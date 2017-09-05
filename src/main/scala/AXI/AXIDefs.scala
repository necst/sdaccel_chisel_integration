package AXI

// Part I: Definitions for the actual data carried over AXI channels
// in part II we will provide definitions for the actual AXI interfaces
// by wrapping the part I types in Decoupled (ready/valid) bundles

// AXI channel data definitions

import chisel3._
import chisel3.util.Decoupled

class AXIAddress(addrWidthBits: Int, idBits: Int) extends Bundle {
  // address for the transaction, should be burst aligned if bursts are used
  val addr    = UInt(addrWidthBits.W)
  // size of data beat in bytes
  // set to UInt(log2Up((dataBits/8)-1)) for full-width bursts
  val size    = UInt(3.W)
  // number of data beats -1 in burst: max 255 for incrementing, 15 for wrapping
  val len     = UInt(8.W)
  // burst mode: 0 for fixed, 1 for incrementing, 2 for wrapping
  val burst   = UInt(2.W)
  // transaction ID for multiple outstanding requests
  val id      = UInt(idBits.W)
  // set to 1 for exclusive access
  val lock    = Bool()
  // cachability, set to 0010 or 0011
  val cache   = UInt(4.W)
  // generally ignored, set to to all zeroes
  val prot    = UInt(3.W)
  // not implemented, set to zeroes
  val qos     = UInt(4.W)

  override def cloneType = { new AXIAddress(addrWidthBits, idBits).asInstanceOf[this.type] }
}

class AXIWriteData(dataWidthBits: Int) extends Bundle {
  val data    = UInt(dataWidthBits.W)
  val strb    = UInt((dataWidthBits/8).W)
  val last    = Bool()
  override def cloneType = { new AXIWriteData(dataWidthBits).asInstanceOf[this.type] }
}

class AXIWriteResponse(idBits: Int) extends Bundle {
  val id      = UInt(idBits.W)
  val resp    = UInt(2.W)
  override def cloneType = { new AXIWriteResponse(idBits).asInstanceOf[this.type] }
}

class AXIReadData(dataWidthBits: Int, idBits: Int) extends Bundle {
  val data    = UInt(dataWidthBits.W)
  val id      = UInt(idBits.W)
  val last    = Bool()
  val resp    = UInt(2.W)
  override def cloneType = { new AXIReadData(dataWidthBits, idBits).asInstanceOf[this.type] }
}



// Part II: Definitions for the actual AXI interfaces

// TODO add full slave interface definition

class AXIMasterIF(addrWidthBits: Int, dataWidthBits: Int, idBits: Int) extends Bundle {
  // write address channel
  val writeAddr   = Decoupled(new AXIAddress(addrWidthBits, idBits))
  // write data channel
  val writeData   = Decoupled(new AXIWriteData(dataWidthBits))
  // write response channel (for memory consistency)
  val writeResp   = Decoupled(new AXIWriteResponse(idBits)).data.flip

  // read address channel
  val readAddr    = Decoupled(new AXIAddress(addrWidthBits, idBits))
  // read data channel
  val readData    = Decoupled(new AXIReadData(dataWidthBits, idBits)).data.flip

  // drive default/"harmless" values to leave no output uninitialized
  def driveDefaults() {
    writeAddr.valid := false.B
    writeData.valid := false.B
    writeResp.ready := false.B
    readAddr.valid := false.B
    readData.ready := false.B
    // write address channel
    writeAddr.bits.addr := 0.U
    writeAddr.bits.prot := 0.U
    writeAddr.bits.size := 0.U
    writeAddr.bits.len := 0.U
    writeAddr.bits.burst := 0.U
    writeAddr.bits.lock := false.B
    writeAddr.bits.cache := 0.U
    writeAddr.bits.qos := 0.U
    writeAddr.bits.id := 0.U
    // write data channel
//    writeData.bits.data := 0.U
    writeData.bits.strb := 0.U
    writeData.bits.last := false.B
    // read address channel
    readAddr.bits.addr := 0.U
    readAddr.bits.prot := 0.U
    readAddr.bits.size := 0.U
    readAddr.bits.len := 0.U
    readAddr.bits.burst := 0.U
    readAddr.bits.lock := false.B
    readAddr.bits.cache := 0.U
    readAddr.bits.qos := 0.U
    readAddr.bits.id := 0.U
  }

  override def cloneType = { new AXIMasterIF(addrWidthBits, dataWidthBits, idBits).asInstanceOf[this.type] }
}


class AXIMasterReadOnlyIF(addrWidthBits: Int, dataWidthBits: Int, idBits: Int) extends Bundle {

  // read address channel
  val readAddr    = Decoupled(new AXIAddress(addrWidthBits, idBits))
  // read data channel
  val readData    = Decoupled(new AXIReadData(dataWidthBits, idBits)).data.flip

  override def cloneType = { new AXIMasterReadOnlyIF(addrWidthBits, dataWidthBits, idBits).asInstanceOf[this.type] }
}

object Axi_Defines {
  val MAX_AXI_LEN = 256

  val ONE_BYTE =               "h0".U(3.W)
  val TWO_BYTES =              "h1".U(3.W)
  val FOUR_BYTES =             "h2".U(3.W)
  val EIGHT_BYTES =            "h3".U(3.W)
  val SIXTEEN_BYTES =          "h4".U(3.W)
  val THIRTY_TWO_BYTES =       "h5".U(3.W)
  val SIXTY_FOUR_BYTES =       "h6".U(3.W)
  val ONE_TWENTY_EIGHT_BYTES = "h7".U(3.W)

  val FIXED         =  "h0".U(2.W)
  val INCREMENTING  =  "h1".U(2.W)
  val WRAPPING      =  "h2".U(2.W)
  val RESERVED_1    =  "h3".U(2.W)

  val NON_CACHE_NON_BUFFER              =  "h0".U(4.W)
  val BUF_ONLY                          =  "h1".U(4.W)
  val CACHE_DO_NOT_ALLOC                =  "h2".U(4.W)
  val CACHE_BUF_DO_NOT_ALLOC            =  "h3".U(4.W)
  val RESERVED_2                        =  "h4".U(4.W)
  val RESERVED_3                        =  "h5".U(4.W)
  val CACHE_WRITE_THROUGH_ALLOC_READS   =  "h6".U(4.W)
  val CACHE_WRITE_BACK_ALLOC_READS      =  "h7".U(4.W)
  val RESERVED_4                        =  "h8".U(4.W)
  val RESERVED_5                        =  "h9".U(4.W)
  val CACHE_WRITE_THROUGH_ALLOC_WRITES  =  "ha".U(4.W)
  val CACHE_WRITE_BACK_ALLOC_WRITES     =  "hb".U(4.W)
  val RESERVED_6                        =  "hc".U(4.W)
  val RESERVED_7                        =  "hd".U(4.W)
  val CACHE_WRITE_THROUGH_ALLOC_BOTH    =  "he".U(4.W)
  val CACHE_WRITE_BACK_ALLOC_BOTH       =  "hf".U(4.W)

  val DATA_SECURE_NORMAL            =  "h0".U(3.W)
  val DATA_SECURE_PRIV              =  "h1".U(3.W)
  val DATA_NONSECURE_NORMAL         =  "h2".U(3.W)
  val DATA_NONSECURE_PRIV           =  "h3".U(3.W)
  val INSTRUCTION_SECURE_NORMAL     =  "h4".U(3.W)
  val INSTRUCTION_SECURE_PRIV       =  "h5".U(3.W)
  val INSTRUCTION_NONSECURE_NORMAL  =  "h6".U(3.W)
  val INSTRUCTION_NONSECURE_PRIV    =  "h7".U(3.W)


  val NORMAL_ACCESS      = "h0".U(2.W)
  val EXCLUSIVE_ACCESS   = "h1".U(2.W)
  val LOCKED_ACCESS      = "h2".U(2.W)
  val RESERVED_8         = "h3".U(2.W)


  val OKAY   = "h0".U(2.W)    // Normal access okay indicates if a normal access has been successful.
  //  Can also indicate an exclusive access failure.
  val EXOKAY = "h1".U(2.W)    // Exclusive access okay indicates that either the read or write portion
  //  of an exclusive access has been successful.
  val SLVERR = "h2".U(2.W)    // Slave error is used when the access has reached the slave successfully,
  //  but the slave wishes to return an error condition to the originating master
  val DECERR = "h3".U(2.W)    // Decode error is generated typically by an interconnect component to indicate
  //  that there is no slave at the transaction address.

  // Settings for ARQOS[3:0] & AWQOS[3:0] from page 13-3
  val NOT_QOS_PARTICIPANT  =   "h0".U(4.W)    // not participating in the quality of service function
}

