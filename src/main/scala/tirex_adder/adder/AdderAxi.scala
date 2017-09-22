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

  //FSM to read from Memory

  //FSM Schiavo di merda

  val sIdle :: sWrdata :: sPrepareData :: sReply :: sStartWrite :: sPerfWrite :: sWaitResp :: sEnd :: Nil = Enum(UInt(), 8)
  val stateSlaveWrite = Reg(init = sIdle)
  val addrwr_handshake = Reg(init = false.B)
  val write_handshake = Reg(init = false.B)

  //always ready to receive addresses
  //io.s0.writeAddr.ready := !reset && (stateSlaveWrite === sIdle)
  //io.s0.writeData.ready := stateSlaveWrite === sWrdata
  //io.s0.writeResp.bits  := Axi_Defines.OKAY
  //io.s0.writeResp.valid := stateSlaveWrite === sReply

  //segnali di handshake avvenuto per scrittura address e dati
  addrwr_handshake := io.s0.writeAddr.valid & io.s0.writeAddr.ready
  write_handshake := io.s0.writeData.valid & io.s0.writeData.ready

  //salvo l'indirizzo di scrittura
  when(addrwr_handshake){
    regCtrAddrWrite := io.s0.writeAddr.bits.addr
  }

  when(stateSlaveWrite === sIdle){
    io.s0.writeResp.valid := false.B
    io.s0.writeAddr.ready := true.B
    when(io.s0.writeAddr.valid){
      stateSlaveWrite := sWrdata
    }
  }.elsewhen(stateSlaveWrite === sWrdata){
    io.s0.writeAddr.ready := false.B
    io.s0.writeData.ready := true.B
    when(io.s0.writeData.valid){
      //regDataReceived := io.s0.writeData.bits.data
      //regDone := false.B
      stateSlaveWrite := sReply
    }
  }.elsewhen(stateSlaveWrite === sReply){
    io.s0.writeData.ready := false.B
    io.s0.writeResp.bits := Axi_Defines.OKAY
    io.s0.writeResp.valid := true.B
    when(io.s0.writeResp.ready){
      stateSlaveWrite := sIdle
    }.otherwise{
      stateSlaveWrite := sIdle
    }

  }


  /*regStart := regDataReceived(0)
  //regDone := regDataReceived(1)
  //regIdle := regDataReceived(2)

  when(regDone === true.B){
    regIdle := true.B
  }*/






  //read transaction
  val stateSlaveRead = Reg(init = sIdle)
  val regCtrAddrRead = Reg(init = 0.U(addrWidth.W))

  val addrrd_handshake = Reg(init = false.B)
  val rdata = Reg(init = 0.U(32.W))
  val raddr = Reg(init = 0.U(6.W))
  io.s0.readData.bits.data := rdata
  raddr := io.s0.readAddr.bits.addr
  addrrd_handshake := io.s0.readAddr.valid & io.s0.readAddr.ready

  //io.s0.readAddr.ready := true.B
  when(stateSlaveRead === sIdle){
    io.s0.readData.valid := false.B
    io.s0.readAddr.ready := true.B
    when(io.s0.readAddr.valid){
      regCtrAddrRead := io.s0.readAddr.bits.addr
      stateSlaveRead := sPrepareData
    }
  }.elsewhen(stateSlaveRead === sPrepareData){
    //io.s0.readData.bits.data := io.s0.readData.bits.data | (regStart << 0.U).asUInt()
    /*io.s0.readData.bits.data := (regDone << 1.U).asUInt()*/
    //io.s0.readData.bits.data := io.s0.readData.bits.data | (regIdle << 2.U).asUInt()
    io.s0.readAddr.ready := false.B
    io.s0.readData.valid := true.B
    when(io.s0.readData.ready){
      stateSlaveRead := sEnd
    }
  }.otherwise{
    stateSlaveRead := sIdle
  }



  //Logica start,done,idle

  val areset = Reg(init = 0.U(1.W))
  val ap_start = Reg(init = 0.U(1.W))
  val ap_start_pulse = Reg(init = 0.U(1.W))
  val ap_start_r = Reg(init = 0.U(1.W))
  val ap_ready = Reg(init = 0.U(1.W))
  val ap_done = Reg(init = 0.U(1.W))
  val ap_idle = Reg(init = 1.U(1.W))
  val ap_autorestart = Reg(init = 0.U(1.W))

  ap_ready := ap_done

  areset := ! reset
  ap_start_r := ap_start
  ap_start_pulse := ap_start & ! ap_start_r
  ap_ready := ap_done

  //ap_idle
  when(areset === 1.U){
    ap_idle <= 1.U
  }.otherwise{
    when(ap_done === 1.U){
      ap_idle := 1.U
    }.elsewhen (ap_start_pulse === 1.U){
      ap_idle := 0.U
    }.otherwise{
      ap_idle := ap_idle
    }
  }

  //ap_done
  when(areset === 1.U){
    ap_done := 0.U
  }.otherwise{
    when(addrrd_handshake && raddr === 0.U){
      ap_done := 0.U
    }.otherwise{
      ap_done := 1.U
    }
  }

  //ap_start
  when(areset === 1.U){
    ap_start := 0.U
  }.otherwise{
    when(write_handshake && regCtrAddrWrite === 0.U && io.s0.writeData.bits.strb(0) && io.s0.writeData.bits.data(0)){
      ap_start := 1.U
    }.elsewhen(ap_ready === 1.U){
      ap_start := ap_autorestart
    }
  }

  //autorestart
  when(areset === 1.U){
    ap_autorestart := 0.U
  }.otherwise{
    when(write_handshake && regCtrAddrWrite === 0.U && io.s0.writeData.bits.strb(0)) {
      ap_autorestart := io.s0.writeData.bits.data(7)
    }
  }




  /*
  0--> ap_start
  1--> ap_done
  2--> ap_idle
  3--> ap_ready
  7--> auto_restart
 */

  when(addrrd_handshake){
    when(raddr === 0.U){
      rdata := 0.U(32.W) | (ap_start | (ap_done << 1.U).asUInt() | (ap_idle << 2.U).asUInt() | (ap_ready << 3.U).asUInt() | (ap_autorestart << 7.U).asUInt())
    }.otherwise{
      rdata := 0.U
    }

  }



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
*/
}


object AdderAxi extends App {

  val address = 64

  //  val dataWidth = if (query_size * 2 < 256){  query_size * 2} else 256
  val dataWidth = 512
  val dataWidthSlave = 32
  val idBits = 1


  chisel3.Driver.execute(args, () => new AdderAxi(address,dataWidth,idBits, dataWidthSlave))

}
