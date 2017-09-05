package tirex_adder.test

import chisel3.iotesters.{ChiselFlatSpec, Driver, PeekPokeTester}
import tirex_adder.adder.AdderAxi

/**
  * Created by lorenzo on 05/09/17.
  */
class AdderAxiUnitTest (adder : AdderAxi) extends PeekPokeTester(adder) {

  poke(adder.io.s0.writeAddr.bits.addr, 0)
  poke(adder.io.s0.writeAddr.valid, 1)

  step(100)

  poke(adder.io.s0.writeData.bits.data, 1 << 0)
  poke(adder.io.s0.writeData.valid, true)

  step(100)

}


class AdderAxiTester extends ChiselFlatSpec {

  val address = 64

  val dataWidth = 32
  val idBits = 8


  private val backendNames = Array[String]("firrtl", "verilator")
  for ( backendName <- backendNames ) {
    "Adder" should s"work fine (with $backendName)" in {
      Driver(() => new AdderAxi(address,dataWidth,idBits,dataWidth), backendName) {
        adder => new AdderAxiUnitTest(adder)
      } should be (true)
    }
  }
}