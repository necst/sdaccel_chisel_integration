package tirex_adder.adder

import AXI.{AXILiteSlaveIF, AXIMasterIF, Axi_Defines}
import chisel3._
import chisel3.util.{Counter, Enum}

/**
  * Created by lorenzo on 05/09/17.
  */
class AdderAxi(addrWidth : Int, dataWidth : Int, idBits : Int, dataWidthSlave : Int) extends Module{
  val io = IO(new Bundle{
    val m0 = new AXIMasterIF(addrWidth, dataWidth, idBits)
    val s0 = new AXILiteSlaveIF(addrWidth, dataWidthSlave) //SLAVE control interface
  })

  io.m0.driveDefaults()

  io.s0.writeResp.bits := Axi_Defines.OKAY //resp valid
  io.s0.readData.bits.resp := Axi_Defines.OKAY


  //FSM to handle sync with HOST

  val regStart = Reg(init = 0.U(1.W))
  val regDone = Reg(init = 0.U(1.W))
  val regIdle = Reg(init = 1.U(1.W))

  val regCtrAddr = Reg(init = "h0".asUInt(addrWidth.W))
  val regCtrAddrWrite = Reg(init = 0.U(addrWidth.W))

  val regDataReceived = Reg(init = 0.U(dataWidth.W))


  val adder = Module(new Adder)

  //FSM to read from Memory

  //FSM Schiavo di merda

  val sIdle :: sAddrRead :: sPrepareData :: sReply :: sEnd :: Nil = Enum(UInt(), 5)
  val stateSlaveWrite = Reg(init = sIdle)

  //always ready to receive addresses
  io.s0.writeAddr.ready := true.B
  when(stateSlaveWrite === sIdle){
    when(io.s0.writeAddr.valid){
      regCtrAddrWrite := io.s0.writeAddr.bits.addr
      stateSlaveWrite := sAddrRead
    }
  }.elsewhen(stateSlaveWrite === sAddrRead){
    when(regCtrAddrWrite === regCtrAddr){
      io.s0.writeData.ready := true.B
      when(io.s0.writeData.valid){
        regDataReceived := io.s0.writeData.bits.data
        regStart := io.s0.writeData.bits.data(0)
        regDone := io.s0.writeData.bits.data(1)
        regIdle := io.s0.writeData.bits.data(2)
//        regDone := false.B
        stateSlaveWrite := sReply
        //      stateSlaveWrite := sEnd
      }
    }.otherwise{
      stateSlaveWrite := sEnd
    }

  }.elsewhen(stateSlaveWrite === sReply){
    io.s0.writeResp.bits := Axi_Defines.OKAY
    io.s0.writeResp.valid := true.B
    io.s0.writeData.ready := true.B
    when(io.s0.writeResp.ready){
      stateSlaveWrite := sEnd
    }

  }.elsewhen(stateSlaveWrite === sEnd){
    io.s0.writeData.ready := false.B
    io.s0.writeResp.valid := false.B
    stateSlaveWrite := sIdle
  }

//  regStart := regDataReceived(0)
  //regDone := regDataReceived(1)
  //regIdle := regDataReceived(2)

  when(regDone === true.B){
    regIdle := true.B
  }

  //read transaction
  val stateSlaveRead = Reg(init = sIdle)
  val regCtrAddrRead = Reg(init = "h0".U(addrWidth.W))

  io.s0.readAddr.ready := true.B
  when(stateSlaveRead === sIdle){
    when(io.s0.readAddr.valid){
      regCtrAddrRead := io.s0.readAddr.bits.addr
      stateSlaveRead := sPrepareData
    }
  }.elsewhen(stateSlaveRead === sPrepareData){
    when(regCtrAddrRead === regCtrAddr){
      //io.s0.readData.bits.data := io.s0.readData.bits.data | (regStart << 0.U).asUInt()
      io.s0.readData.bits.data := (regStart << 0.U).asUInt() | (regDone << 1.U).asUInt() | (regIdle << 2.U).asUInt()
      //io.s0.readData.bits.data := io.s0.readData.bits.data | (regIdle << 2.U).asUInt()
      io.s0.readData.valid := true.B
      when(io.s0.readData.ready){
//        stateSlaveRead := sEnd
        stateSlaveRead := sReply
      }
    }
  }.elsewhen(stateSlaveRead === sReply){
    io.s0.readData.bits.resp := Axi_Defines.OKAY
    stateSlaveRead := sEnd
  }.elsewhen(stateSlaveRead === sEnd){
    io.s0.readData.valid := false.B
    stateSlaveRead := sIdle
  }

  val counter = Counter(30)
  val regFlagStart = Reg(init = false.B)

  when(regStart === true.B && regFlagStart === false.B){
    counter.inc()
    regFlagStart := true.B
  }

  when(counter.value > 0.U && counter.value < 25.U){
    counter.inc
  }.elsewhen(counter.value >= 25.U){
    regDone := true.B
  }

}


object AdderAxi extends App {

  val address = 64

  //  val dataWidth = if (query_size * 2 < 256){  query_size * 2} else 256
  val dataWidth = 32
  val dataWidthSlave = 32
  val idBits = 1


  chisel3.Driver.execute(args, () => new AdderAxi(address,dataWidth,idBits, dataWidthSlave))

}
