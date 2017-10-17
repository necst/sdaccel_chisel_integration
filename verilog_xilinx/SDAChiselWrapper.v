`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif

module AXILiteControl(
  input         ap_clk,
  input         ap_rst_n,
  output        io_slave_writeAddr_ready,
  input         io_slave_writeAddr_valid,
  input  [63:0] io_slave_writeAddr_bits_addr,
  output        io_slave_writeData_ready,
  input         io_slave_writeData_valid,
  input  [31:0] io_slave_writeData_bits_data,
  input  [3:0]  io_slave_writeData_bits_strb,
  input         io_slave_writeResp_ready,
  output        io_slave_writeResp_valid,
  output        io_slave_readAddr_ready,
  input         io_slave_readAddr_valid,
  input  [63:0] io_slave_readAddr_bits_addr,
  input         io_slave_readData_ready,
  output        io_slave_readData_valid,
  output [31:0] io_slave_readData_bits_data,
  output        io_ap_start,
  input         io_ap_done
);
  reg  ap_start;
  reg [31:0] _RAND_0;
  reg  auto_restart;
  reg [31:0] _RAND_1;
  reg  ap_idle;
  reg [31:0] _RAND_2;
  reg  ap_done;
  reg [31:0] _RAND_3;
  reg  ap_start_r;
  reg [31:0] _RAND_4;
  wire  _T_48;
  wire  ap_start_pulse;
  wire  _GEN_0;
  wire  _T_51;
  wire  _T_52;
  wire  _GEN_1;
  wire  _T_57;
  wire  _T_58;
  wire  _GEN_2;
  reg [2:0] stateSlaveWrite;
  reg [31:0] _RAND_5;
  reg [5:0] writeAddr;
  reg [31:0] _RAND_6;
  reg [2:0] stateSlaveRead;
  reg [31:0] _RAND_7;
  reg [31:0] readData;
  reg [31:0] _RAND_8;
  wire  _T_67;
  wire  _T_68;
  wire  _T_69;
  wire  _T_70;
  wire  _T_116;
  wire  addrwr_handshake;
  wire  write_handshake;
  wire [63:0] _GEN_3;
  wire [2:0] _GEN_4;
  wire  _T_119;
  wire [2:0] _GEN_5;
  wire [2:0] _GEN_6;
  wire  _T_122;
  wire  _T_123;
  wire [2:0] _GEN_7;
  wire  _T_125;
  wire [2:0] _GEN_8;
  wire [2:0] _GEN_9;
  wire  _T_130;
  wire  _T_131;
  wire  _T_132;
  wire [2:0] _GEN_10;
  wire  _T_134;
  wire [2:0] _GEN_11;
  wire [2:0] _GEN_12;
  wire  _T_141;
  wire  _T_142;
  wire [2:0] _GEN_13;
  wire  _T_145;
  wire  _T_146;
  wire  _T_147;
  wire  addrrd_handshake;
  wire [2:0] _GEN_14;
  wire  _T_150;
  wire [2:0] _GEN_15;
  wire [2:0] _GEN_16;
  wire  _T_153;
  wire  _T_154;
  wire  _T_155;
  wire [2:0] _GEN_17;
  wire  _T_157;
  wire [2:0] _GEN_18;
  wire [2:0] _GEN_19;
  wire  _T_161;
  wire  _T_162;
  wire [2:0] _GEN_20;
  wire  _T_164;
  wire [1:0] _GEN_27;
  wire [1:0] _T_165;
  wire [1:0] _GEN_28;
  wire [1:0] _T_166;
  wire [2:0] _GEN_29;
  wire [2:0] _T_167;
  wire [2:0] _GEN_30;
  wire [2:0] _T_168;
  wire [3:0] _GEN_31;
  wire [3:0] _T_169;
  wire [3:0] _GEN_32;
  wire [3:0] _T_170;
  wire [7:0] _GEN_33;
  wire [7:0] _T_171;
  wire [7:0] _GEN_34;
  wire [7:0] _T_172;
  wire [31:0] _GEN_21;
  wire [31:0] _GEN_22;
  wire  _T_174;
  wire  _T_175;
  wire  _T_176;
  wire  _T_177;
  wire  _T_178;
  wire  _T_179;
  wire  _GEN_23;
  wire  _T_182;
  wire  _T_183;
  wire  _GEN_24;
  wire  _T_186;
  wire  _GEN_25;
  wire  _T_193;
  wire  _GEN_26;
  assign io_slave_writeAddr_ready = _T_69;
  assign io_slave_writeData_ready = _T_70;
  assign io_slave_writeResp_valid = _T_116;
  assign io_slave_readAddr_ready = _T_146;
  assign io_slave_readData_valid = _T_147;
  assign io_slave_readData_bits_data = readData;
  assign io_ap_start = ap_start;
  assign _T_48 = ap_start_r == 1'h0;
  assign ap_start_pulse = ap_start & _T_48;
  assign _GEN_0 = ap_done ? 1'h1 : ap_idle;
  assign _T_51 = ap_done == 1'h0;
  assign _T_52 = _T_51 & ap_start_pulse;
  assign _GEN_1 = _T_52 ? 1'h0 : _GEN_0;
  assign _T_57 = ap_start_pulse == 1'h0;
  assign _T_58 = _T_51 & _T_57;
  assign _GEN_2 = _T_58 ? ap_idle : _GEN_1;
  assign _T_67 = ap_rst_n == 1'h0;
  assign _T_68 = stateSlaveWrite == 3'h0;
  assign _T_69 = _T_67 & _T_68;
  assign _T_70 = stateSlaveWrite == 3'h1;
  assign _T_116 = stateSlaveWrite == 3'h2;
  assign addrwr_handshake = io_slave_writeAddr_valid & io_slave_writeAddr_ready;
  assign write_handshake = io_slave_writeData_valid & io_slave_writeData_ready;
  assign _GEN_3 = addrwr_handshake ? io_slave_writeAddr_bits_addr : {{58'd0}, writeAddr};
  assign _GEN_4 = io_slave_writeAddr_valid ? 3'h1 : stateSlaveWrite;
  assign _T_119 = io_slave_writeAddr_valid == 1'h0;
  assign _GEN_5 = _T_119 ? 3'h0 : _GEN_4;
  assign _GEN_6 = _T_68 ? _GEN_5 : stateSlaveWrite;
  assign _T_122 = _T_68 == 1'h0;
  assign _T_123 = _T_122 & _T_70;
  assign _GEN_7 = io_slave_writeData_valid ? 3'h2 : _GEN_6;
  assign _T_125 = io_slave_writeData_valid == 1'h0;
  assign _GEN_8 = _T_125 ? 3'h1 : _GEN_7;
  assign _GEN_9 = _T_123 ? _GEN_8 : _GEN_6;
  assign _T_130 = _T_70 == 1'h0;
  assign _T_131 = _T_122 & _T_130;
  assign _T_132 = _T_131 & _T_116;
  assign _GEN_10 = io_slave_writeResp_ready ? 3'h0 : _GEN_9;
  assign _T_134 = io_slave_writeResp_ready == 1'h0;
  assign _GEN_11 = _T_134 ? 3'h2 : _GEN_10;
  assign _GEN_12 = _T_132 ? _GEN_11 : _GEN_9;
  assign _T_141 = _T_116 == 1'h0;
  assign _T_142 = _T_131 & _T_141;
  assign _GEN_13 = _T_142 ? 3'h0 : _GEN_12;
  assign _T_145 = stateSlaveRead == 3'h0;
  assign _T_146 = _T_67 & _T_145;
  assign _T_147 = stateSlaveRead == 3'h3;
  assign addrrd_handshake = io_slave_readAddr_valid & io_slave_readAddr_ready;
  assign _GEN_14 = io_slave_readAddr_valid ? 3'h3 : stateSlaveRead;
  assign _T_150 = io_slave_readAddr_valid == 1'h0;
  assign _GEN_15 = _T_150 ? 3'h0 : _GEN_14;
  assign _GEN_16 = _T_145 ? _GEN_15 : stateSlaveRead;
  assign _T_153 = _T_145 == 1'h0;
  assign _T_154 = _T_153 & _T_147;
  assign _T_155 = io_slave_readData_valid & io_slave_readData_ready;
  assign _GEN_17 = _T_155 ? 3'h0 : _GEN_16;
  assign _T_157 = _T_155 == 1'h0;
  assign _GEN_18 = _T_157 ? 3'h3 : _GEN_17;
  assign _GEN_19 = _T_154 ? _GEN_18 : _GEN_16;
  assign _T_161 = _T_147 == 1'h0;
  assign _T_162 = _T_153 & _T_161;
  assign _GEN_20 = _T_162 ? 3'h0 : _GEN_19;
  assign _T_164 = io_slave_readAddr_bits_addr == 64'h0;
  assign _GEN_27 = {{1'd0}, ap_done};
  assign _T_165 = _GEN_27 << 1;
  assign _GEN_28 = {{1'd0}, ap_start};
  assign _T_166 = _GEN_28 | _T_165;
  assign _GEN_29 = {{2'd0}, ap_idle};
  assign _T_167 = _GEN_29 << 2;
  assign _GEN_30 = {{1'd0}, _T_166};
  assign _T_168 = _GEN_30 | _T_167;
  assign _GEN_31 = {{3'd0}, ap_done};
  assign _T_169 = _GEN_31 << 3;
  assign _GEN_32 = {{1'd0}, _T_168};
  assign _T_170 = _GEN_32 | _T_169;
  assign _GEN_33 = {{7'd0}, auto_restart};
  assign _T_171 = _GEN_33 << 7;
  assign _GEN_34 = {{4'd0}, _T_170};
  assign _T_172 = _GEN_34 | _T_171;
  assign _GEN_21 = _T_164 ? {{24'd0}, _T_172} : readData;
  assign _GEN_22 = addrrd_handshake ? _GEN_21 : readData;
  assign _T_174 = writeAddr == 6'h0;
  assign _T_175 = write_handshake & _T_174;
  assign _T_176 = io_slave_writeData_bits_strb[0];
  assign _T_177 = _T_175 & _T_176;
  assign _T_178 = io_slave_writeData_bits_data[0];
  assign _T_179 = _T_177 & _T_178;
  assign _GEN_23 = _T_179 ? 1'h1 : ap_start;
  assign _T_182 = _T_179 == 1'h0;
  assign _T_183 = _T_182 & ap_done;
  assign _GEN_24 = _T_183 ? auto_restart : _GEN_23;
  assign _T_186 = addrrd_handshake & _T_164;
  assign _GEN_25 = _T_186 ? 1'h0 : io_ap_done;
  assign _T_193 = io_slave_writeData_bits_data[7];
  assign _GEN_26 = _T_177 ? _T_193 : auto_restart;
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{$random}};
  ap_start = _RAND_0[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{$random}};
  auto_restart = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{$random}};
  ap_idle = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{$random}};
  ap_done = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{$random}};
  ap_start_r = _RAND_4[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{$random}};
  stateSlaveWrite = _RAND_5[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{$random}};
  writeAddr = _RAND_6[5:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{$random}};
  stateSlaveRead = _RAND_7[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{$random}};
  readData = _RAND_8[31:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge ap_clk) begin
    if (ap_rst_n) begin
      ap_start <= 1'h0;
    end else begin
      if (_T_183) begin
        ap_start <= auto_restart;
      end else begin
        if (_T_179) begin
          ap_start <= 1'h1;
        end
      end
    end
    if (ap_rst_n) begin
      auto_restart <= 1'h0;
    end else begin
      if (_T_177) begin
        auto_restart <= _T_193;
      end
    end
    if (ap_rst_n) begin
      ap_idle <= 1'h1;
    end else begin
      if (!(_T_58)) begin
        if (_T_52) begin
          ap_idle <= 1'h0;
        end else begin
          if (ap_done) begin
            ap_idle <= 1'h1;
          end
        end
      end
    end
    if (ap_rst_n) begin
      ap_done <= 1'h0;
    end else begin
      if (_T_186) begin
        ap_done <= 1'h0;
      end else begin
        ap_done <= io_ap_done;
      end
    end
    if (ap_rst_n) begin
      ap_start_r <= 1'h0;
    end else begin
      ap_start_r <= ap_start;
    end
    if (ap_rst_n) begin
      stateSlaveWrite <= 3'h0;
    end else begin
      if (_T_142) begin
        stateSlaveWrite <= 3'h0;
      end else begin
        if (_T_132) begin
          if (_T_134) begin
            stateSlaveWrite <= 3'h2;
          end else begin
            if (io_slave_writeResp_ready) begin
              stateSlaveWrite <= 3'h0;
            end else begin
              if (_T_123) begin
                if (_T_125) begin
                  stateSlaveWrite <= 3'h1;
                end else begin
                  if (io_slave_writeData_valid) begin
                    stateSlaveWrite <= 3'h2;
                  end else begin
                    if (_T_68) begin
                      if (_T_119) begin
                        stateSlaveWrite <= 3'h0;
                      end else begin
                        if (io_slave_writeAddr_valid) begin
                          stateSlaveWrite <= 3'h1;
                        end
                      end
                    end
                  end
                end
              end else begin
                if (_T_68) begin
                  if (_T_119) begin
                    stateSlaveWrite <= 3'h0;
                  end else begin
                    if (io_slave_writeAddr_valid) begin
                      stateSlaveWrite <= 3'h1;
                    end
                  end
                end
              end
            end
          end
        end else begin
          if (_T_123) begin
            if (_T_125) begin
              stateSlaveWrite <= 3'h1;
            end else begin
              if (io_slave_writeData_valid) begin
                stateSlaveWrite <= 3'h2;
              end else begin
                if (_T_68) begin
                  if (_T_119) begin
                    stateSlaveWrite <= 3'h0;
                  end else begin
                    if (io_slave_writeAddr_valid) begin
                      stateSlaveWrite <= 3'h1;
                    end
                  end
                end
              end
            end
          end else begin
            if (_T_68) begin
              if (_T_119) begin
                stateSlaveWrite <= 3'h0;
              end else begin
                if (io_slave_writeAddr_valid) begin
                  stateSlaveWrite <= 3'h1;
                end
              end
            end
          end
        end
      end
    end
    if (ap_rst_n) begin
      writeAddr <= 6'h0;
    end else begin
      writeAddr <= _GEN_3[5:0];
    end
    if (ap_rst_n) begin
      stateSlaveRead <= 3'h0;
    end else begin
      if (_T_162) begin
        stateSlaveRead <= 3'h0;
      end else begin
        if (_T_154) begin
          if (_T_157) begin
            stateSlaveRead <= 3'h3;
          end else begin
            if (_T_155) begin
              stateSlaveRead <= 3'h0;
            end else begin
              if (_T_145) begin
                if (_T_150) begin
                  stateSlaveRead <= 3'h0;
                end else begin
                  if (io_slave_readAddr_valid) begin
                    stateSlaveRead <= 3'h3;
                  end
                end
              end
            end
          end
        end else begin
          if (_T_145) begin
            if (_T_150) begin
              stateSlaveRead <= 3'h0;
            end else begin
              if (io_slave_readAddr_valid) begin
                stateSlaveRead <= 3'h3;
              end
            end
          end
        end
      end
    end
    if (ap_rst_n) begin
      readData <= 32'h0;
    end else begin
      if (addrrd_handshake) begin
        if (_T_164) begin
          readData <= {{24'd0}, _T_172};
        end
      end
    end
  end
endmodule
module MyKernel(
  input   ap_clk,
  input   ap_rst_n,
  input   io_ap_start,
  output  io_ap_done
);
  reg [4:0] value;
  reg [31:0] _RAND_0;
  reg  regFlagStart;
  reg [31:0] _RAND_1;
  reg  doneReg;
  reg [31:0] _RAND_2;
  wire  _T_18;
  wire  _T_19;
  wire  _T_21;
  wire [5:0] _T_23;
  wire [4:0] _T_24;
  wire [4:0] _GEN_0;
  wire [4:0] _GEN_1;
  wire  _GEN_2;
  wire  _T_28;
  wire  _GEN_3;
  assign io_ap_done = doneReg;
  assign _T_18 = regFlagStart == 1'h0;
  assign _T_19 = io_ap_start & _T_18;
  assign _T_21 = value == 5'h1d;
  assign _T_23 = value + 5'h1;
  assign _T_24 = _T_23[4:0];
  assign _GEN_0 = _T_21 ? 5'h0 : _T_24;
  assign _GEN_1 = _T_19 ? _GEN_0 : value;
  assign _GEN_2 = _T_19 ? 1'h1 : regFlagStart;
  assign _T_28 = value > 5'h0;
  assign _GEN_3 = _T_28 ? 1'h1 : doneReg;
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{$random}};
  value = _RAND_0[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{$random}};
  regFlagStart = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{$random}};
  doneReg = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge ap_clk) begin
    if (ap_rst_n) begin
      value <= 5'h0;
    end else begin
      if (_T_19) begin
        if (_T_21) begin
          value <= 5'h0;
        end else begin
          value <= _T_24;
        end
      end
    end
    if (ap_rst_n) begin
      regFlagStart <= 1'h0;
    end else begin
      if (_T_19) begin
        regFlagStart <= 1'h1;
      end
    end
    if (ap_rst_n) begin
      doneReg <= 1'h0;
    end else begin
      if (_T_28) begin
        doneReg <= 1'h1;
      end
    end
  end
endmodule
module SDAChiselWrapper(
  input          ap_clk,
  input          ap_rst_n,
  input          m_axi_gmem_AWREADY,
  output         m_axi_gmem_AWVALID,
  output [63:0]  m_axi_gmem_AWADDR,
  output [2:0]   m_axi_gmem_AWSIZE,
  output [7:0]   m_axi_gmem_AWLEN,
  output [1:0]   m_axi_gmem_AWBURST,
  output         m_axi_gmem_AWID,
  output         m_axi_gmem_AWLOCK,
  output [3:0]   m_axi_gmem_AWCACHE,
  output [2:0]   m_axi_gmem_AWPROT,
  output [3:0]   m_axi_gmem_AWQOS,
  input          m_axi_gmem_WREADY,
  output         m_axi_gmem_WVALID,
  output [511:0] m_axi_gmem_WDATA,
  output [63:0]  m_axi_gmem_WSTRB,
  output         m_axi_gmem_WLAST,
  output         m_axi_gmem_BREADY,
  input          m_axi_gmem_BVALID,
  input          m_axi_gmem_BID,
  input  [1:0]   m_axi_gmem_BRESP,
  input          m_axi_gmem_ARREADY,
  output         m_axi_gmem_ARVALID,
  output [63:0]  m_axi_gmem_ARADDR,
  output [2:0]   m_axi_gmem_ARSIZE,
  output [7:0]   m_axi_gmem_ARLEN,
  output [1:0]   m_axi_gmem_ARBURST,
  output         m_axi_gmem_ARID,
  output         m_axi_gmem_ARLOCK,
  output [3:0]   m_axi_gmem_ARCACHE,
  output [2:0]   m_axi_gmem_ARPROT,
  output [3:0]   m_axi_gmem_ARQOS,
  output         m_axi_gmem_RREADY,
  input          m_axi_gmem_RVALID,
  input  [511:0] m_axi_gmem_RDATA,
  input          m_axi_gmem_RID,
  input          m_axi_gmem_RLAST,
  input  [1:0]   m_axi_gmem_RRESP,
  output         S_AXI_CONTROL_AWREADY,
  input          S_AXI_CONTROL_AWVALID,
  input  [63:0]  S_AXI_CONTROL_AWADDR,
  input  [2:0]   S_AXI_CONTROL_AWPROT,
  output         S_AXI_CONTROL_WREADY,
  input          S_AXI_CONTROL_WVALID,
  input  [31:0]  S_AXI_CONTROL_WDATA,
  input  [3:0]   S_AXI_CONTROL_WSTRB,
  input          S_AXI_CONTROL_BREADY,
  output         S_AXI_CONTROL_BVALID,
  output [1:0]   S_AXI_CONTROL_BRESP,
  output         S_AXI_CONTROL_ARREADY,
  input          S_AXI_CONTROL_ARVALID,
  input  [63:0]  S_AXI_CONTROL_ARADDR,
  input  [2:0]   S_AXI_CONTROL_ARPROT,
  input          S_AXI_CONTROL_RREADY,
  output         S_AXI_CONTROL_RVALID,
  output [31:0]  S_AXI_CONTROL_RDATA,
  output [1:0]   S_AXI_CONTROL_RRESP
);
  wire  slave_fsm_ap_clk;
  wire  slave_fsm_ap_rst_n;
  wire  slave_fsm_io_slave_writeAddr_ready;
  wire  slave_fsm_io_slave_writeAddr_valid;
  wire [63:0] slave_fsm_io_slave_writeAddr_bits_addr;
  wire  slave_fsm_io_slave_writeData_ready;
  wire  slave_fsm_io_slave_writeData_valid;
  wire [31:0] slave_fsm_io_slave_writeData_bits_data;
  wire [3:0] slave_fsm_io_slave_writeData_bits_strb;
  wire  slave_fsm_io_slave_writeResp_ready;
  wire  slave_fsm_io_slave_writeResp_valid;
  wire  slave_fsm_io_slave_readAddr_ready;
  wire  slave_fsm_io_slave_readAddr_valid;
  wire [63:0] slave_fsm_io_slave_readAddr_bits_addr;
  wire  slave_fsm_io_slave_readData_ready;
  wire  slave_fsm_io_slave_readData_valid;
  wire [31:0] slave_fsm_io_slave_readData_bits_data;
  wire  slave_fsm_io_ap_start;
  wire  slave_fsm_io_ap_done;
  wire  RTLKernel_ap_clk;
  wire  RTLKernel_ap_rst_n;
  wire  RTLKernel_io_ap_start;
  wire  RTLKernel_io_ap_done;
  wire  _T_88;
  AXILiteControl slave_fsm (
    .ap_clk(slave_fsm_ap_clk),
    .ap_rst_n(slave_fsm_ap_rst_n),
    .io_slave_writeAddr_ready(slave_fsm_io_slave_writeAddr_ready),
    .io_slave_writeAddr_valid(slave_fsm_io_slave_writeAddr_valid),
    .io_slave_writeAddr_bits_addr(slave_fsm_io_slave_writeAddr_bits_addr),
    .io_slave_writeData_ready(slave_fsm_io_slave_writeData_ready),
    .io_slave_writeData_valid(slave_fsm_io_slave_writeData_valid),
    .io_slave_writeData_bits_data(slave_fsm_io_slave_writeData_bits_data),
    .io_slave_writeData_bits_strb(slave_fsm_io_slave_writeData_bits_strb),
    .io_slave_writeResp_ready(slave_fsm_io_slave_writeResp_ready),
    .io_slave_writeResp_valid(slave_fsm_io_slave_writeResp_valid),
    .io_slave_readAddr_ready(slave_fsm_io_slave_readAddr_ready),
    .io_slave_readAddr_valid(slave_fsm_io_slave_readAddr_valid),
    .io_slave_readAddr_bits_addr(slave_fsm_io_slave_readAddr_bits_addr),
    .io_slave_readData_ready(slave_fsm_io_slave_readData_ready),
    .io_slave_readData_valid(slave_fsm_io_slave_readData_valid),
    .io_slave_readData_bits_data(slave_fsm_io_slave_readData_bits_data),
    .io_ap_start(slave_fsm_io_ap_start),
    .io_ap_done(slave_fsm_io_ap_done)
  );
  MyKernel RTLKernel (
    .ap_clk(RTLKernel_ap_clk),
    .ap_rst_n(RTLKernel_ap_rst_n),
    .io_ap_start(RTLKernel_io_ap_start),
    .io_ap_done(RTLKernel_io_ap_done)
  );
  assign m_axi_gmem_AWVALID = 1'h0;
  assign m_axi_gmem_AWADDR = 64'h0;
  assign m_axi_gmem_AWSIZE = 3'h0;
  assign m_axi_gmem_AWLEN = 8'h0;
  assign m_axi_gmem_AWBURST = 2'h0;
  assign m_axi_gmem_AWID = 1'h0;
  assign m_axi_gmem_AWLOCK = 1'h0;
  assign m_axi_gmem_AWCACHE = 4'h0;
  assign m_axi_gmem_AWPROT = 3'h0;
  assign m_axi_gmem_AWQOS = 4'h0;
  assign m_axi_gmem_WVALID = 1'h0;
  assign m_axi_gmem_WDATA = 512'h0;
  assign m_axi_gmem_WSTRB = 64'h0;
  assign m_axi_gmem_WLAST = 1'h0;
  assign m_axi_gmem_BREADY = 1'h0;
  assign m_axi_gmem_ARVALID = 1'h0;
  assign m_axi_gmem_ARADDR = 64'h0;
  assign m_axi_gmem_ARSIZE = 3'h0;
  assign m_axi_gmem_ARLEN = 8'h0;
  assign m_axi_gmem_ARBURST = 2'h0;
  assign m_axi_gmem_ARID = 1'h0;
  assign m_axi_gmem_ARLOCK = 1'h0;
  assign m_axi_gmem_ARCACHE = 4'h0;
  assign m_axi_gmem_ARPROT = 3'h0;
  assign m_axi_gmem_ARQOS = 4'h0;
  assign m_axi_gmem_RREADY = 1'h0;
  assign S_AXI_CONTROL_AWREADY = slave_fsm_io_slave_writeAddr_ready;
  assign S_AXI_CONTROL_WREADY = slave_fsm_io_slave_writeData_ready;
  assign S_AXI_CONTROL_BVALID = slave_fsm_io_slave_writeResp_valid;
  assign S_AXI_CONTROL_BRESP = 2'h0;
  assign S_AXI_CONTROL_ARREADY = slave_fsm_io_slave_readAddr_ready;
  assign S_AXI_CONTROL_RVALID = slave_fsm_io_slave_readData_valid;
  assign S_AXI_CONTROL_RDATA = slave_fsm_io_slave_readData_bits_data;
  assign S_AXI_CONTROL_RRESP = 2'h0;
  assign slave_fsm_ap_clk = ap_clk;
  assign slave_fsm_ap_rst_n = _T_88;
  assign slave_fsm_io_slave_writeAddr_valid = S_AXI_CONTROL_AWVALID;
  assign slave_fsm_io_slave_writeAddr_bits_addr = S_AXI_CONTROL_AWADDR;
  assign slave_fsm_io_slave_writeData_valid = S_AXI_CONTROL_WVALID;
  assign slave_fsm_io_slave_writeData_bits_data = S_AXI_CONTROL_WDATA;
  assign slave_fsm_io_slave_writeData_bits_strb = S_AXI_CONTROL_WSTRB;
  assign slave_fsm_io_slave_writeResp_ready = S_AXI_CONTROL_BREADY;
  assign slave_fsm_io_slave_readAddr_valid = S_AXI_CONTROL_ARVALID;
  assign slave_fsm_io_slave_readAddr_bits_addr = S_AXI_CONTROL_ARADDR;
  assign slave_fsm_io_slave_readData_ready = slave_fsm_io_slave_readData_ready;
  assign slave_fsm_io_ap_done = RTLKernel_io_ap_done;
  assign RTLKernel_ap_clk = ap_clk;
  assign RTLKernel_ap_rst_n = _T_88;
  assign RTLKernel_io_ap_start = slave_fsm_io_ap_start;
  assign _T_88 = ap_rst_n == 1'h0;
endmodule
