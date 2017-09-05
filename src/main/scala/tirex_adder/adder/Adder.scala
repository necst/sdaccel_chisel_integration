package tirex_adder.adder

import chisel3._

/**
  * Created by lorenzo on 05/09/17.
  */
class Adder extends Module{
  val io = IO(new Bundle{
    val a = Input(UInt(32.W))
    val b = Input(UInt(32.W))

    val out = Output(UInt(32.W))

  })

  io.out := io.a + io.b

}
