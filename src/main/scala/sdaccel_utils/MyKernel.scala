package sdaccel_utils

import chisel3._
import chisel3.util.Counter

/**
  * Created by lorenzo on 05/09/17.
  */
class MyKernel extends Module{
  val io = IO(new Bundle{
    val ap_start = Input(UInt(1.W))
    val ap_idle = Input(UInt(1.W))
    val ap_done = Output(UInt(1.W))

  })

  val counter = Counter(30)
  val regFlagStart = Reg(init = false.B)
  val doneReg = Reg(init = false.B)
  val startReg = Reg(init = false.B)
  val idleReg = Reg(init = true.B)

  idleReg := io.ap_idle
  startReg := io.ap_start
  io.ap_done := doneReg



  when(io.ap_start === true.B && regFlagStart === false.B){
    counter.inc()
    regFlagStart := true.B
  }

  when(counter.value > 0.U){
    doneReg := true.B
  }

}
