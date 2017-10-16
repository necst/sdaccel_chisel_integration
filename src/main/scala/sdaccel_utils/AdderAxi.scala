/**
  * Created by lorenzo on 05/09/17.
  */

package sdaccel_utils

import AXI.{AXILiteSlaveIF, AXIMasterIF}
import chisel3._
import chisel3.util.Counter


class AdderAxi(addrWidth : Int, dataWidth : Int, idBits : Int, dataWidthSlave : Int) extends Module{
  val io = IO(new Bundle{
    val m0 = new AXIMasterIF(addrWidth, dataWidth, idBits)
    val s0 = new AXILiteSlaveIF(addrWidth, dataWidthSlave) //SLAVE control interface
  })

  io.m0.driveDefaults()
  val slave_fsm = Module(new AXILiteControl(addrWidth, dataWidthSlave))


  val adder = Module(new Adder)


  slave_fsm.io.sl.writeAddr.bits.prot := io.s0.writeAddr.bits.prot
  slave_fsm.io.sl.writeAddr.bits.addr := io.s0.writeAddr.bits.addr
  slave_fsm.io.sl.writeAddr.valid := io.s0.writeAddr.valid
  io.s0.writeAddr.ready := slave_fsm.io.sl.writeAddr.ready

  slave_fsm.io.sl.writeData.bits.strb := io.s0.writeData.bits.strb
  slave_fsm.io.sl.writeData.bits.data := io.s0.writeData.bits.data
  slave_fsm.io.sl.writeData.valid := io.s0.writeData.valid
  io.s0.writeData.ready := slave_fsm.io.sl.writeData.ready

  io.s0.writeResp.valid := slave_fsm.io.sl.writeResp.valid
  io.s0.writeResp.bits := slave_fsm.io.sl.writeResp.bits
  slave_fsm.io.sl.writeResp.ready := io.s0.writeResp.ready

  slave_fsm.io.sl.readAddr.bits.prot := io.s0.readAddr.bits.prot
  slave_fsm.io.sl.readAddr.bits.addr := io.s0.readAddr.bits.addr
  slave_fsm.io.sl.readAddr.valid := io.s0.readAddr.valid
  io.s0.readAddr.ready := slave_fsm.io.sl.readAddr.ready

  io.s0.readData.valid := slave_fsm.io.sl.readData.valid
  slave_fsm.io.sl.readData.ready := slave_fsm.io.sl.readData.ready

  io.s0.readData.bits.resp := slave_fsm.io.sl.readData.bits.resp
  io.s0.readData.bits.data := slave_fsm.io.sl.readData.bits.data


  val counter = Counter(30)
  val regFlagStart = Reg(init = false.B)

  when(slave_fsm.io.ap_start === true.B && regFlagStart === false.B){
    counter.inc()
    regFlagStart := true.B
  }

  when(counter.value > 0.U){
    slave_fsm.io.ap_done := true.B
  }
}


object AdderAxi extends App {

  val address = 64
  val dataWidth = 512
  val dataWidthSlave = 32
  val idBits = 1


  chisel3.Driver.execute(args, () => new AdderAxi(address,dataWidth,idBits, dataWidthSlave))

}
