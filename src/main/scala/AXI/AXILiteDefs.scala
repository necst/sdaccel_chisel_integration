package AXI

import Chisel._

// Part I: Definitions for the actual data carried over AXI channels
// in part II we will provide definitions for the actual AXI interfaces
// by wrapping the part I types in Decoupled (ready/valid) bundles


// AXI Lite channel data definitions

class AXILiteAddress(addrWidthBits: Int) extends Bundle {
  val addr    = UInt(width = addrWidthBits)
  val prot    = UInt(width = 3)
  override def cloneType = { new AXILiteAddress(addrWidthBits).asInstanceOf[this.type] }
}

class AXILiteWriteData(dataWidthBits: Int) extends Bundle {
  val data    = UInt(width = dataWidthBits)
  val strb    = UInt(width = dataWidthBits/8)
  override def cloneType = { new AXILiteWriteData(dataWidthBits).asInstanceOf[this.type] }
}

class AXILiteReadData(dataWidthBits: Int) extends Bundle {
  val data    = UInt(width = dataWidthBits)
  val resp    = UInt(width = 2)
  override def cloneType = { new AXILiteReadData(dataWidthBits).asInstanceOf[this.type] }
}

// Part II: Definitions for the actual AXI interfaces

class AXILiteSlaveIF(addrWidthBits: Int, dataWidthBits: Int) extends Bundle {
  // write address channel
  val writeAddr   = Decoupled(new AXILiteAddress(addrWidthBits)).flip
  // write data channel
  val writeData   = Decoupled(new AXILiteWriteData(dataWidthBits)).flip
  // write response channel (for memory consistency)
  val writeResp   = Decoupled(UInt(width = 2))

  // read address channel
  val readAddr    = Decoupled(new AXILiteAddress(addrWidthBits)).flip
  // read data channel
  val readData    = Decoupled(new AXILiteReadData(dataWidthBits))

  override def cloneType = { new AXILiteSlaveIF(addrWidthBits, dataWidthBits).asInstanceOf[this.type] }
}



class AXILiteMasterIF(addrWidthBits: Int, dataWidthBits: Int) extends Bundle {
  // write address channel
  val writeAddr   = Decoupled(new AXILiteAddress(addrWidthBits))
  // write data channel
  val writeData   = Decoupled(new AXILiteWriteData(dataWidthBits))
  // write response channel (for memory consistency)
  val writeResp   = Decoupled(UInt(width = 2)).flip

  // read address channel
  val readAddr    = Decoupled(new AXILiteAddress(addrWidthBits))
  // read data channel
  val readData    = Decoupled(new AXILiteReadData(dataWidthBits)).flip

  override def cloneType = { new AXILiteMasterIF(addrWidthBits, dataWidthBits).asInstanceOf[this.type] }
}

class AXILiteMasterWriteOnlyIF(addrWidthBits: Int, dataWidthBits: Int) extends Bundle {
  // write address channel
  val writeAddr   = Decoupled(new AXILiteAddress(addrWidthBits))
  // write data channel
  val writeData   = Decoupled(new AXILiteWriteData(dataWidthBits))
  // write response channel (for memory consistency)
  val writeResp   = Decoupled(UInt(width = 2)).flip


  override def cloneType = { new AXILiteMasterWriteOnlyIF(addrWidthBits, dataWidthBits).asInstanceOf[this.type] }
}