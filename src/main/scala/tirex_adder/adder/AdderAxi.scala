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

  //FSM to handle sync with HOST

  val regStart = Reg(init = 0.U(1.W))
  val regDone = Reg(init = 0.U(1.W))
  val regIdle = Reg(init = 1.U(1.W))

  val regCtrAddr = Reg(init = "h00000001".asUInt(addrWidth.W))
  val regCtrAddrWrite = Reg(init = 0.U(addrWidth.W))

  val regDataReceived = Reg(init = 0.U(dataWidth.W))


  val adder = Module(new Adder)

  //FSM to read from Memory

  //FSM Schiavo di merda

  val sIdle :: sAddrRead :: sPrepareData :: sReply :: sStartWrite :: sPerfWrite :: sWaitResp :: sEnd :: Nil = Enum(UInt(), 8)
  val stateSlaveWrite = Reg(init = sIdle)

  //always ready to receive addresses
  io.s0.writeAddr.ready := true.B
  when(stateSlaveWrite === sIdle){
    when(io.s0.writeAddr.valid){
      regCtrAddrWrite := io.s0.writeAddr.bits.addr
      stateSlaveWrite := sAddrRead
    }
  }.elsewhen(stateSlaveWrite === sAddrRead){
    io.s0.writeData.ready := true.B
    when(io.s0.writeData.valid){
      regDataReceived := io.s0.writeData.bits.data
      regDone := false.B
      stateSlaveWrite := sReply
//      stateSlaveWrite := sEnd
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

  regStart := regDataReceived(0)
  //regDone := regDataReceived(1)
  //regIdle := regDataReceived(2)

  when(regDone === true.B){
    regIdle := true.B
  }

  //read transaction
  val stateSlaveRead = Reg(init = sIdle)
  val regCtrAddrRead = Reg(init = 0.U(addrWidth.W))

  io.s0.readAddr.ready := true.B
  when(stateSlaveRead === sIdle){
    when(io.s0.readAddr.valid){
      regCtrAddrRead := io.s0.readAddr.bits.addr
      stateSlaveRead := sPrepareData
    }
  }.elsewhen(stateSlaveRead === sPrepareData){
    //io.s0.readData.bits.data := io.s0.readData.bits.data | (regStart << 0.U).asUInt()
    io.s0.readData.bits.data := (regDone << 1.U).asUInt()
    //io.s0.readData.bits.data := io.s0.readData.bits.data | (regIdle << 2.U).asUInt()
    io.s0.readData.valid := true.B
    when(io.s0.readData.ready){
      stateSlaveRead := sEnd
    }
  }.elsewhen(stateSlaveRead === sEnd){
    io.s0.readData.valid := false.B
    stateSlaveRead := sIdle
  }

  val counter = Counter(30)
  val regFlagStart = Reg(init = false.B)

  val regStartWriting = Reg(init = false.B)

  when(regStart === true.B && regFlagStart === false.B){
    counter.inc()
    regFlagStart := true.B
  }

  when(counter.value > 0.U && counter.value < 25.U){
    counter.inc
  }.elsewhen(counter.value >= 25.U){
//    regDone := true.B
    regStartWriting := true.B
  }

  //FSM write

  val stateWriteMem = Reg(init = sIdle)
  val regWriteAddr = Reg(init = "h028".asUInt)
  val regResp = Reg(init = 0.U(2.W))

  //Default values
  io.m0.writeAddr.bits.size := Axi_Defines.THIRTY_TWO_BYTES
  io.m0.writeAddr.bits.burst := Axi_Defines.INCREMENTING
  io.m0.writeAddr.bits.lock := Axi_Defines.NORMAL_ACCESS
  io.m0.writeAddr.bits.cache := Axi_Defines.NON_CACHE_NON_BUFFER
  io.m0.writeAddr.bits.prot := Axi_Defines.DATA_SECURE_NORMAL
  io.m0.writeAddr.bits.qos := Axi_Defines.NOT_QOS_PARTICIPANT

  io.m0.writeAddr.bits.id := 0.U
  io.m0.writeAddr.bits.addr := regWriteAddr
  io.m0.writeAddr.bits.len := 0.U // 1 write just the result

  when(stateWriteMem === sIdle){
    when(regStartWriting){
      stateWriteMem := sStartWrite
    }
  }.elsewhen(stateWriteMem === sStartWrite){
    io.m0.writeAddr.valid := true.B
    when(io.m0.writeAddr.ready){
      stateWriteMem := sPerfWrite
    }
  }.elsewhen(stateWriteMem === sPerfWrite){
    io.m0.writeAddr.valid := true.B

    io.m0.writeData.bits.data := counter.value
    io.m0.writeData.bits.last := true.B
    io.m0.writeData.valid := true.B
    io.m0.writeResp.ready := true.B
    when(io.m0.writeData.ready){
      stateWriteMem := sWaitResp
    }
  }.elsewhen(stateWriteMem === sWaitResp){
    io.m0.writeResp.ready := true.B
    when(io.m0.writeResp.valid) {
      regResp := io.m0.writeResp.bits.resp
      stateWriteMem := sEnd
    }
  }.elsewhen(stateWriteMem === sEnd){
    //this is redundant as function driveDefaults is always valid if not overridden
    io.m0.writeResp.ready := false.B
    io.m0.writeData.valid := false.B
    io.m0.writeAddr.valid := false.B
    regDone := true.B
  }

}


object AdderAxi extends App {

  val address = 64

  //  val dataWidth = if (query_size * 2 < 256){  query_size * 2} else 256
  val dataWidth = 512
  val dataWidthSlave = 32
  val idBits = 1


  chisel3.Driver.execute(args, () => new AdderAxi(address,dataWidth,idBits, dataWidthSlave))

}
