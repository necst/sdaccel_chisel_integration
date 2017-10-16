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


  slave_fsm.io.s0.writeData <> io.s0.writeData
  io.s0.writeResp <> slave_fsm.io.s0.writeResp
  slave_fsm.io.s0.writeAddr <> io.s0.writeAddr
  io.s0.readData <> slave_fsm.io.s0.readData
  slave_fsm.io.s0.readAddr <> io.s0.readAddr

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
