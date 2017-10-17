package sdaccel_utils

import chisel3._
import chisel3.util.Counter

/**
  * Created by lorenzo on 05/09/17.
  */
class MyKernel extends Module{
  val io = IO(new Bundle{
    val start = Input(UInt(1.W))
    val done = Output(UInt(1.W))

  })

  val counter = Counter(30)
  val regFlagStart = Reg(init = false.B)

  when(io.start === true.B && regFlagStart === false.B){
    counter.inc()
    regFlagStart := true.B
  }

  when(counter.value > 0.U){
    io.done := true.B
  }

}
