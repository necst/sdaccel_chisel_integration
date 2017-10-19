/**
  * Created by lorenzo on 05/09/17.
  */

package sdaccel_utils

import AXI.{AXILiteSlaveIF, AXIMasterIF}
import chisel3._
import chisel3.util.Counter


class SDAChiselWrapper(addrWidth : Int, dataWidth : Int, idBits : Int, dataWidthSlave : Int) extends Module{
  val io = IO(new Bundle{
    val m0 = new AXIMasterIF(addrWidth, dataWidth, idBits)
    val s0 = new AXILiteSlaveIF(addrWidth, dataWidthSlave) //SLAVE control interface
  })

  io.m0.driveDefaults()
  val slave_fsm = Module(new AXILiteControl(addrWidth, dataWidthSlave))


  val RTLKernel = Module(new MyKernel())

  val ap_start = slave_fsm.io.ap_start
  val ap_done = RTLKernel.io.ap_done
  val ap_idle = slave_fsm.io.ap_idle

  RTLKernel.io.ap_idle := ap_done


  RTLKernel.io.ap_start := ap_start
  slave_fsm.io.ap_done := ap_done

  //
  //ATTENTION! The submodule reset must have the negate of the reset in input
  //


  slave_fsm.reset := !(reset.toBool())
  RTLKernel.reset := !(reset.toBool())

  slave_fsm.io.slave.writeAddr.bits.prot := io.s0.writeAddr.bits.prot
  slave_fsm.io.slave.writeAddr.bits.addr := io.s0.writeAddr.bits.addr
  slave_fsm.io.slave.writeAddr.valid := io.s0.writeAddr.valid
  io.s0.writeAddr.ready := slave_fsm.io.slave.writeAddr.ready

  slave_fsm.io.slave.writeData.bits.strb := io.s0.writeData.bits.strb
  slave_fsm.io.slave.writeData.bits.data := io.s0.writeData.bits.data
  slave_fsm.io.slave.writeData.valid := io.s0.writeData.valid
  io.s0.writeData.ready := slave_fsm.io.slave.writeData.ready

  io.s0.writeResp.valid := slave_fsm.io.slave.writeResp.valid
  io.s0.writeResp.bits := slave_fsm.io.slave.writeResp.bits
  slave_fsm.io.slave.writeResp.ready := io.s0.writeResp.ready

  slave_fsm.io.slave.readAddr.bits.prot := io.s0.readAddr.bits.prot
  slave_fsm.io.slave.readAddr.bits.addr := io.s0.readAddr.bits.addr
  slave_fsm.io.slave.readAddr.valid := io.s0.readAddr.valid
  io.s0.readAddr.ready := slave_fsm.io.slave.readAddr.ready

  io.s0.readData.valid := slave_fsm.io.slave.readData.valid
  slave_fsm.io.slave.readData.ready := slave_fsm.io.slave.readData.ready

  io.s0.readData.bits.resp := slave_fsm.io.slave.readData.bits.resp
  io.s0.readData.bits.data := slave_fsm.io.slave.readData.bits.data



}


object SDAChiselWrapper extends App {

  val address = 64
  val dataWidth = 512
  val dataWidthSlave = 32
  val idBits = 1


  chisel3.Driver.execute(args, () => new SDAChiselWrapper(address,dataWidth,idBits, dataWidthSlave))

}
