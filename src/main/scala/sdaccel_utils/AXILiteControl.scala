/**
  * Created by lorenzo on 05/09/17.
  */
package sdaccel_utils

import AXI.{AXILiteSlaveIF, Axi_Defines}
import Chisel._
import chisel3.core.{Input, Output}
import chisel3.util.Enum
import chisel3.{Reg, UInt, when}

class AXILiteControl(addrWidth: Int, dataWidthSlave : Int) extends Module{
  val io =  IO(new Bundle{
    val sl = new AXILiteSlaveIF(addrWidth, dataWidthSlave)
    val ap_idle = Output(UInt(1.W))
    val ap_start = Output(UInt(1.W))
    val ap_done = Input(UInt(1.W))
  })

  val ADDR_AP_CTRL = "h00".U
  val ap_start = Reg(init = false.B)
  val auto_restart = Reg(init = false.B)
  val ap_idle = Reg(init = true.B)
  val ap_done = Reg(init = false.B)
  val areset = Reg(next = !reset)
  val ap_start_r = Reg(init = false.B, next = ap_start)
  val ap_start_pulse = ap_start & !ap_start_r
  val ap_ready = ap_done

  ap_done := io.ap_done
  io.ap_idle := ap_idle
  io.ap_start := ap_start

  when(ap_done){
    ap_idle := true.B
  }.elsewhen(ap_start_pulse){
    ap_idle := false.B
  }.otherwise{
    ap_idle := ap_idle
  }

  val sIdle :: sWrdata :: sReply :: sReadData :: sEnd :: Nil = Enum(UInt(), 5)
  val stateSlaveWrite = Reg(init = sIdle)
  val writeAddr = Reg(init = 0.U(6.W))

  val stateSlaveRead = Reg(init = sIdle)
  val readData = Reg(init = 0.U(32.W))



  io.sl.writeAddr.ready := reset & (stateSlaveWrite === sIdle)
  io.sl.writeData.ready := (stateSlaveWrite === sWrdata)
  io.sl.writeResp.bits := Axi_Defines.OKAY
  io.sl.writeResp.valid := (stateSlaveWrite === sReply)

  val addrwr_handshake = io.sl.writeAddr.valid & io.sl.writeAddr.ready
  val write_handshake = io.sl.writeData.valid & io.sl.writeData.ready

  when(addrwr_handshake){
    writeAddr := io.sl.writeAddr.bits.addr
  }

  //FSM AXI-Lite Write
  when(stateSlaveWrite === sIdle){
    when(io.sl.writeAddr.valid){
      stateSlaveWrite := sWrdata
    }.otherwise{
      stateSlaveWrite := sIdle
    }
  }.elsewhen(stateSlaveWrite === sWrdata){
    when(io.sl.writeData.valid){
      stateSlaveWrite := sReply
    }.otherwise{
      stateSlaveWrite := sWrdata
    }
  }.elsewhen(stateSlaveWrite === sReply){
    when(io.sl.writeResp.ready){
      stateSlaveWrite := sIdle
    }.otherwise{
      stateSlaveWrite := sReply
    }

  }.otherwise{
    stateSlaveWrite := sIdle
  }


  io.sl.readAddr.ready := reset && (stateSlaveRead === sIdle)
  io.sl.readData.bits.data := readData
  io.sl.readData.bits.resp := Axi_Defines.OKAY
  io.sl.readData.valid := (stateSlaveRead === sReadData)

  val addrrd_handshake = io.sl.readAddr.valid & io.sl.readAddr.ready
  val raddr = io.sl.readAddr.bits.addr

  //FSM AXI-Lite READ
  when(stateSlaveRead === sIdle){
    when(io.sl.readAddr.valid){
      stateSlaveRead := sReadData
    }.otherwise{
      stateSlaveRead := sIdle
    }
  }.elsewhen(stateSlaveRead === sReadData){
    when(io.sl.readData.valid & io.sl.readData.ready){
      stateSlaveRead := sIdle
    }.otherwise{
      stateSlaveRead := sReadData
    }
  }.otherwise{
    stateSlaveRead := sIdle
  }


  when(addrrd_handshake){
    when(raddr === ADDR_AP_CTRL){
      readData := (ap_start).asUInt() | (ap_done << 1).asUInt() | (ap_idle << 2).asUInt() | (ap_ready << 3).asUInt() | (auto_restart << 7).asUInt()
    }
  }

  //ap_start
  when(write_handshake && writeAddr === ADDR_AP_CTRL && io.sl.writeData.bits.strb(0) && io.sl.writeData.bits.data(0)){
    ap_start := true.B
  }.elsewhen(ap_ready){
    ap_start := auto_restart
  }

  //ap_done
  when(addrrd_handshake && raddr === ADDR_AP_CTRL){
    ap_done := false.B
  }


  //autorestart
  when(write_handshake && writeAddr === ADDR_AP_CTRL && io.sl.writeData.bits.strb(0)){
    auto_restart := io.sl.writeData.bits.data(7)
  }
}
