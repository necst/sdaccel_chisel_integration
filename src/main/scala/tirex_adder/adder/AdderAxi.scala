/**
  * Created by lorenzo on 05/09/17.
  */

package tirex_adder.adder

import AXI.{AXILiteSlaveIF, AXIMasterIF, Axi_Defines}
import chisel3._
import chisel3.util.{Counter, Enum}


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





  val ap_start = Reg(init = false.B)
  val auto_restart = Reg(init = false.B)
  val ap_idle = Reg(init = true.B)
  val ap_done = Reg(init = false.B)
  val areset = Reg(next = !reset)
  val ap_start_r = Reg(init = false.B, next = ap_start)
  val ap_start_pulse = ap_start & !ap_start_r
  val ap_ready = ap_done

  when(areset){
    ap_idle := true.B
  }.elsewhen(ap_done){
    ap_idle := true.B
  }.elsewhen(ap_start_pulse){
    ap_idle := false.B
  }.otherwise{
    ap_idle := ap_idle
  }






  //FSM to read from Memory

  //FSM Schiavo di merda

  val sIdle :: sWrdata :: sReply :: sReadData :: sEnd :: Nil = Enum(UInt(), 5)
  val stateSlaveWrite = Reg(init = sIdle)
  val writeAddr = Reg(init = 0.U(6.W))

  val stateSlaveRead = Reg(init = sIdle)
  val readData = Reg(init = 0.U(32.W))



  io.s0.writeAddr.ready := !areset & (stateSlaveWrite === sIdle)
  io.s0.writeData.ready := (stateSlaveWrite === sWrdata)
  io.s0.writeResp.bits := Axi_Defines.OKAY
  io.s0.writeResp.valid := (stateSlaveWrite === sReply)

  //segnali di handshake avvenuto per scrittura address e dati
  val addrwr_handshake = io.s0.writeAddr.valid & io.s0.writeAddr.ready
  val write_handshake = io.s0.writeData.valid & io.s0.writeData.ready

  //salvo l'indirizzo di scrittura
  when(addrwr_handshake){
    writeAddr := io.s0.writeAddr.bits.addr
  }

  when(stateSlaveWrite === sIdle){
    when(io.s0.writeAddr.valid){
      stateSlaveWrite := sWrdata
    }.otherwise{
      stateSlaveWrite := sIdle
    }
  }.elsewhen(stateSlaveWrite === sWrdata){
    when(io.s0.writeData.valid){
      stateSlaveWrite := sReply
    }.otherwise{
      stateSlaveWrite := sWrdata
    }
  }.elsewhen(stateSlaveWrite === sReply){
    when(io.s0.writeResp.ready){
      stateSlaveWrite := sIdle
    }.otherwise{
      stateSlaveWrite := sReply
    }

  }.otherwise{
    stateSlaveWrite := sIdle
  }


  io.s0.readAddr.ready := !areset && (stateSlaveRead === sIdle)
  io.s0.readData.bits.data := readData
  io.s0.readData.bits.resp := Axi_Defines.OKAY
  io.s0.readData.valid := (stateSlaveRead === sReadData)
  val addrrd_handshake = io.s0.readAddr.valid & io.s0.readAddr.ready
  val raddr = io.s0.readAddr.bits.addr

  when(areset) {
    stateSlaveRead := sIdle
  }

  when(stateSlaveRead === sIdle){
    when(io.s0.readAddr.valid){
      stateSlaveRead := sReadData
    }.otherwise{
      stateSlaveRead := sIdle
    }
  }.elsewhen(stateSlaveRead === sReadData){
    when(io.s0.readData.valid & io.s0.readData.ready){
      stateSlaveRead := sIdle
    }.otherwise{
      stateSlaveRead := sReadData
    }
  }.otherwise{
    stateSlaveRead := sIdle
  }


  when(addrrd_handshake){
      when(raddr === "h00".U){
        readData := (ap_start).asUInt() | (ap_done << 1).asUInt() | (ap_idle << 2).asUInt() | (ap_ready << 3).asUInt() | (auto_restart << 7).asUInt()
      }
  }

  //ap_start
  when(areset){
    ap_start := false.B
  }.otherwise{
    when(write_handshake && writeAddr === "h00".U && io.s0.writeData.bits.strb(0) && io.s0.writeData.bits.data(0)){
      ap_start := true.B
    }.elsewhen(ap_ready){
      ap_start := auto_restart
    }
  }

  //ap_done
  when(areset){
    ap_done := false.B
  }.otherwise{
    when(addrrd_handshake && raddr === "h00".U){
      ap_done := false.B
    }
  }

  //autorestart
  when(areset){
    auto_restart := false.B
  }.elsewhen(write_handshake && writeAddr === "h00".U && io.s0.writeData.bits.strb(0)){
    auto_restart := io.s0.writeData.bits.data(7)
  }

  when(ap_start){
    ap_done := true.B
  }
/*
  val counter = Counter(30)
  val regFlagStart = Reg(init = false.B)

  /*val regStartWriting = Reg(init = false.B)*/

  when(ap_start_pulse === true.B && regFlagStart === false.B){
    counter.inc()
    regFlagStart := true.B
    ap_done := 1.U
  }


  when(counter.value > 0.U && counter.value < 25.U){
    counter.inc
  }.elsewhen(counter.value >= 25.U){
      ap_done := 1.U
//    regDone := true.B
/*    regStartWriting := true.B*/
  }
  /*
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
*/*/
}


object AdderAxi extends App {

  val address = 64

  //  val dataWidth = if (query_size * 2 < 256){  query_size * 2} else 256
  val dataWidth = 512
  val dataWidthSlave = 32
  val idBits = 1


  chisel3.Driver.execute(args, () => new AdderAxi(address,dataWidth,idBits, dataWidthSlave))

}
