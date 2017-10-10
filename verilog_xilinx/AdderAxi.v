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

module AdderAxi#(
    parameter integer C_S_AXI_CONTROL_DATA_WIDTH = 32,
    parameter integer C_S_AXI_CONTROL_ADDR_WIDTH = 64,
    
    parameter integer C_M_AXI_GMEM_ID_WIDTH = 8,
    parameter integer C_M_AXI_GMEM_ADDR_WIDTH = 64,
    parameter integer C_M_AXI_GMEM_DATA_WIDTH = 512
)(
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
  wire  _T_101;
  wire  ap_start_pulse;
  wire  _GEN_0;
  wire  _T_104;
  wire  _T_105;
  wire  _GEN_1;
  wire  _T_110;
  wire  _T_111;
  wire  _GEN_2;
  reg [2:0] stateSlaveWrite;
  reg [31:0] _RAND_5;
  reg [5:0] writeAddr;
  reg [31:0] _RAND_6;
  reg [2:0] stateSlaveRead;
  reg [31:0] _RAND_7;
  reg [31:0] readData;
  reg [31:0] _RAND_8;
  wire  _T_119;
  wire  _T_120;
  wire  _T_121;
  wire  _T_167;
  wire  addrwr_handshake;
  wire  write_handshake;
  wire [63:0] _GEN_3;
  wire [2:0] _GEN_4;
  wire  _T_170;
  wire [2:0] _GEN_5;
  wire [2:0] _GEN_6;
  wire  _T_173;
  wire  _T_174;
  wire [2:0] _GEN_7;
  wire  _T_176;
  wire [2:0] _GEN_8;
  wire [2:0] _GEN_9;
  wire  _T_181;
  wire  _T_182;
  wire  _T_183;
  wire [2:0] _GEN_10;
  wire  _T_185;
  wire [2:0] _GEN_11;
  wire [2:0] _GEN_12;
  wire  _T_192;
  wire  _T_193;
  wire [2:0] _GEN_13;
  wire  _T_194;
  wire  _T_195;
  wire  _T_196;
  wire  addrrd_handshake;
  wire [2:0] _GEN_14;
  wire  _T_199;
  wire [2:0] _GEN_15;
  wire [2:0] _GEN_16;
  wire  _T_202;
  wire  _T_203;
  wire  _T_204;
  wire [2:0] _GEN_17;
  wire  _T_206;
  wire [2:0] _GEN_18;
  wire [2:0] _GEN_19;
  wire  _T_210;
  wire  _T_211;
  wire [2:0] _GEN_20;
  wire  _T_213;
  wire [1:0] _GEN_31;
  wire [1:0] _T_214;
  wire [1:0] _GEN_32;
  wire [1:0] _T_215;
  wire [2:0] _GEN_33;
  wire [2:0] _T_216;
  wire [2:0] _GEN_34;
  wire [2:0] _T_217;
  wire [3:0] _GEN_35;
  wire [3:0] _T_218;
  wire [3:0] _GEN_36;
  wire [3:0] _T_219;
  wire [7:0] _GEN_37;
  wire [7:0] _T_220;
  wire [7:0] _GEN_38;
  wire [7:0] _T_221;
  wire [31:0] _GEN_21;
  wire [31:0] _GEN_22;
  wire  _T_223;
  wire  _T_224;
  wire  _T_225;
  wire  _T_226;
  wire  _T_227;
  wire  _T_228;
  wire  _GEN_23;
  wire  _T_231;
  wire  _T_232;
  wire  _GEN_24;
  wire  _T_235;
  wire  _GEN_25;
  wire  _T_242;
  wire  _GEN_26;
  reg [4:0] value;
  reg [31:0] _RAND_9;
  reg  regFlagStart;
  reg [31:0] _RAND_10;
  wire  _T_250;
  wire  _T_251;
  wire  _T_253;
  wire [5:0] _T_255;
  wire [4:0] _T_256;
  wire [4:0] _GEN_27;
  wire [4:0] _GEN_28;
  wire  _GEN_29;
  wire  _T_260;
  wire  _GEN_30;
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
  assign S_AXI_CONTROL_AWREADY = _T_120;
  assign S_AXI_CONTROL_WREADY = _T_121;
  assign S_AXI_CONTROL_BVALID = _T_167;
  assign S_AXI_CONTROL_BRESP = 2'h0;
  assign S_AXI_CONTROL_ARREADY = _T_195;
  assign S_AXI_CONTROL_RVALID = _T_196;
  assign S_AXI_CONTROL_RDATA = readData;
  assign S_AXI_CONTROL_RRESP = 2'h0;
  assign _T_101 = ap_start_r == 1'h0;
  assign ap_start_pulse = ap_start & _T_101;
  assign _GEN_0 = ap_done ? 1'h1 : ap_idle;
  assign _T_104 = ap_done == 1'h0;
  assign _T_105 = _T_104 & ap_start_pulse;
  assign _GEN_1 = _T_105 ? 1'h0 : _GEN_0;
  assign _T_110 = ap_start_pulse == 1'h0;
  assign _T_111 = _T_104 & _T_110;
  assign _GEN_2 = _T_111 ? ap_idle : _GEN_1;
  assign _T_119 = stateSlaveWrite == 3'h0;
  assign _T_120 = ap_rst_n & _T_119;
  assign _T_121 = stateSlaveWrite == 3'h1;
  assign _T_167 = stateSlaveWrite == 3'h2;
  assign addrwr_handshake = S_AXI_CONTROL_AWVALID & S_AXI_CONTROL_AWREADY;
  assign write_handshake = S_AXI_CONTROL_WVALID & S_AXI_CONTROL_WREADY;
  assign _GEN_3 = addrwr_handshake ? S_AXI_CONTROL_AWADDR : {{58'd0}, writeAddr};
  assign _GEN_4 = S_AXI_CONTROL_AWVALID ? 3'h1 : stateSlaveWrite;
  assign _T_170 = S_AXI_CONTROL_AWVALID == 1'h0;
  assign _GEN_5 = _T_170 ? 3'h0 : _GEN_4;
  assign _GEN_6 = _T_119 ? _GEN_5 : stateSlaveWrite;
  assign _T_173 = _T_119 == 1'h0;
  assign _T_174 = _T_173 & _T_121;
  assign _GEN_7 = S_AXI_CONTROL_WVALID ? 3'h2 : _GEN_6;
  assign _T_176 = S_AXI_CONTROL_WVALID == 1'h0;
  assign _GEN_8 = _T_176 ? 3'h1 : _GEN_7;
  assign _GEN_9 = _T_174 ? _GEN_8 : _GEN_6;
  assign _T_181 = _T_121 == 1'h0;
  assign _T_182 = _T_173 & _T_181;
  assign _T_183 = _T_182 & _T_167;
  assign _GEN_10 = S_AXI_CONTROL_BREADY ? 3'h0 : _GEN_9;
  assign _T_185 = S_AXI_CONTROL_BREADY == 1'h0;
  assign _GEN_11 = _T_185 ? 3'h2 : _GEN_10;
  assign _GEN_12 = _T_183 ? _GEN_11 : _GEN_9;
  assign _T_192 = _T_167 == 1'h0;
  assign _T_193 = _T_182 & _T_192;
  assign _GEN_13 = _T_193 ? 3'h0 : _GEN_12;
  assign _T_194 = stateSlaveRead == 3'h0;
  assign _T_195 = ap_rst_n & _T_194;
  assign _T_196 = stateSlaveRead == 3'h3;
  assign addrrd_handshake = S_AXI_CONTROL_ARVALID & S_AXI_CONTROL_ARREADY;
  assign _GEN_14 = S_AXI_CONTROL_ARVALID ? 3'h3 : stateSlaveRead;
  assign _T_199 = S_AXI_CONTROL_ARVALID == 1'h0;
  assign _GEN_15 = _T_199 ? 3'h0 : _GEN_14;
  assign _GEN_16 = _T_194 ? _GEN_15 : stateSlaveRead;
  assign _T_202 = _T_194 == 1'h0;
  assign _T_203 = _T_202 & _T_196;
  assign _T_204 = S_AXI_CONTROL_RVALID & S_AXI_CONTROL_RREADY;
  assign _GEN_17 = _T_204 ? 3'h0 : _GEN_16;
  assign _T_206 = _T_204 == 1'h0;
  assign _GEN_18 = _T_206 ? 3'h3 : _GEN_17;
  assign _GEN_19 = _T_203 ? _GEN_18 : _GEN_16;
  assign _T_210 = _T_196 == 1'h0;
  assign _T_211 = _T_202 & _T_210;
  assign _GEN_20 = _T_211 ? 3'h0 : _GEN_19;
  assign _T_213 = S_AXI_CONTROL_ARADDR == 64'h0;
  assign _GEN_31 = {{1'd0}, ap_done};
  assign _T_214 = _GEN_31 << 1;
  assign _GEN_32 = {{1'd0}, ap_start};
  assign _T_215 = _GEN_32 | _T_214;
  assign _GEN_33 = {{2'd0}, ap_idle};
  assign _T_216 = _GEN_33 << 2;
  assign _GEN_34 = {{1'd0}, _T_215};
  assign _T_217 = _GEN_34 | _T_216;
  assign _GEN_35 = {{3'd0}, ap_done};
  assign _T_218 = _GEN_35 << 3;
  assign _GEN_36 = {{1'd0}, _T_217};
  assign _T_219 = _GEN_36 | _T_218;
  assign _GEN_37 = {{7'd0}, auto_restart};
  assign _T_220 = _GEN_37 << 7;
  assign _GEN_38 = {{4'd0}, _T_219};
  assign _T_221 = _GEN_38 | _T_220;
  assign _GEN_21 = _T_213 ? {{24'd0}, _T_221} : readData;
  assign _GEN_22 = addrrd_handshake ? _GEN_21 : readData;
  assign _T_223 = writeAddr == 6'h0;
  assign _T_224 = write_handshake & _T_223;
  assign _T_225 = S_AXI_CONTROL_WSTRB[0];
  assign _T_226 = _T_224 & _T_225;
  assign _T_227 = S_AXI_CONTROL_WDATA[0];
  assign _T_228 = _T_226 & _T_227;
  assign _GEN_23 = _T_228 ? 1'h1 : ap_start;
  assign _T_231 = _T_228 == 1'h0;
  assign _T_232 = _T_231 & ap_done;
  assign _GEN_24 = _T_232 ? auto_restart : _GEN_23;
  assign _T_235 = addrrd_handshake & _T_213;
  assign _GEN_25 = _T_235 ? 1'h0 : ap_done;
  assign _T_242 = S_AXI_CONTROL_WDATA[7];
  assign _GEN_26 = _T_226 ? _T_242 : auto_restart;
  assign _T_250 = regFlagStart == 1'h0;
  assign _T_251 = ap_start & _T_250;
  assign _T_253 = value == 5'h1d;
  assign _T_255 = value + 5'h1;
  assign _T_256 = _T_255[4:0];
  assign _GEN_27 = _T_253 ? 5'h0 : _T_256;
  assign _GEN_28 = _T_251 ? _GEN_27 : value;
  assign _GEN_29 = _T_251 ? 1'h1 : regFlagStart;
  assign _T_260 = value > 5'h0;
  assign _GEN_30 = _T_260 ? 1'h1 : _GEN_25;
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
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{$random}};
  value = _RAND_9[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{$random}};
  regFlagStart = _RAND_10[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge ap_clk) begin
    if (!ap_rst_n) begin
      ap_start <= 1'h0;
    end else begin
      if (_T_232) begin
        ap_start <= auto_restart;
      end else begin
        if (_T_228) begin
          ap_start <= 1'h1;
        end
      end
    end
    if (!ap_rst_n) begin
      auto_restart <= 1'h0;
    end else begin
      if (_T_226) begin
        auto_restart <= _T_242;
      end
    end
    if (!ap_rst_n) begin
      ap_idle <= 1'h1;
    end else begin
      if (!(_T_111)) begin
        if (_T_105) begin
          ap_idle <= 1'h0;
        end else begin
          if (ap_done) begin
            ap_idle <= 1'h1;
          end
        end
      end
    end
    if (!ap_rst_n) begin
      ap_done <= 1'h0;
    end else begin
      if (_T_260) begin
        ap_done <= 1'h1;
      end else begin
        if (_T_235) begin
          ap_done <= 1'h0;
        end
      end
    end
    if (!ap_rst_n) begin
      ap_start_r <= 1'h0;
    end else begin
      ap_start_r <= ap_start;
    end
    if (!ap_rst_n) begin
      stateSlaveWrite <= 3'h0;
    end else begin
      if (_T_193) begin
        stateSlaveWrite <= 3'h0;
      end else begin
        if (_T_183) begin
          if (_T_185) begin
            stateSlaveWrite <= 3'h2;
          end else begin
            if (S_AXI_CONTROL_BREADY) begin
              stateSlaveWrite <= 3'h0;
            end else begin
              if (_T_174) begin
                if (_T_176) begin
                  stateSlaveWrite <= 3'h1;
                end else begin
                  if (S_AXI_CONTROL_WVALID) begin
                    stateSlaveWrite <= 3'h2;
                  end else begin
                    if (_T_119) begin
                      if (_T_170) begin
                        stateSlaveWrite <= 3'h0;
                      end else begin
                        if (S_AXI_CONTROL_AWVALID) begin
                          stateSlaveWrite <= 3'h1;
                        end
                      end
                    end
                  end
                end
              end else begin
                if (_T_119) begin
                  if (_T_170) begin
                    stateSlaveWrite <= 3'h0;
                  end else begin
                    if (S_AXI_CONTROL_AWVALID) begin
                      stateSlaveWrite <= 3'h1;
                    end
                  end
                end
              end
            end
          end
        end else begin
          if (_T_174) begin
            if (_T_176) begin
              stateSlaveWrite <= 3'h1;
            end else begin
              if (S_AXI_CONTROL_WVALID) begin
                stateSlaveWrite <= 3'h2;
              end else begin
                if (_T_119) begin
                  if (_T_170) begin
                    stateSlaveWrite <= 3'h0;
                  end else begin
                    if (S_AXI_CONTROL_AWVALID) begin
                      stateSlaveWrite <= 3'h1;
                    end
                  end
                end
              end
            end
          end else begin
            if (_T_119) begin
              if (_T_170) begin
                stateSlaveWrite <= 3'h0;
              end else begin
                if (S_AXI_CONTROL_AWVALID) begin
                  stateSlaveWrite <= 3'h1;
                end
              end
            end
          end
        end
      end
    end
    if (!ap_rst_n) begin
      writeAddr <= 6'h0;
    end else begin
      writeAddr <= _GEN_3[5:0];
    end
    if (!ap_rst_n) begin
      stateSlaveRead <= 3'h0;
    end else begin
      if (_T_211) begin
        stateSlaveRead <= 3'h0;
      end else begin
        if (_T_203) begin
          if (_T_206) begin
            stateSlaveRead <= 3'h3;
          end else begin
            if (_T_204) begin
              stateSlaveRead <= 3'h0;
            end else begin
              if (_T_194) begin
                if (_T_199) begin
                  stateSlaveRead <= 3'h0;
                end else begin
                  if (S_AXI_CONTROL_ARVALID) begin
                    stateSlaveRead <= 3'h3;
                  end
                end
              end
            end
          end
        end else begin
          if (_T_194) begin
            if (_T_199) begin
              stateSlaveRead <= 3'h0;
            end else begin
              if (S_AXI_CONTROL_ARVALID) begin
                stateSlaveRead <= 3'h3;
              end
            end
          end
        end
      end
    end
    if (!ap_rst_n) begin
      readData <= 32'h0;
    end else begin
      if (addrrd_handshake) begin
        if (_T_213) begin
          readData <= {{24'd0}, _T_221};
        end
      end
    end
    if (!ap_rst_n) begin
      value <= 5'h0;
    end else begin
      if (_T_251) begin
        if (_T_253) begin
          value <= 5'h0;
        end else begin
          value <= _T_256;
        end
      end
    end
    if (!ap_rst_n) begin
      regFlagStart <= 1'h0;
    end else begin
      if (_T_251) begin
        regFlagStart <= 1'h1;
      end
    end
  end
endmodule
