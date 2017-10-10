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

module AdderAxi(
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
  wire  _T_108;
  reg  aap_rst_n;
  reg [31:0] _RAND_4;
  reg  ap_start_r;
  reg [31:0] _RAND_5;
  wire  _T_113;
  wire  ap_start_pulse;
  wire  _GEN_0;
  wire  _T_116;
  wire  _T_117;
  wire  _GEN_1;
  wire  _T_122;
  wire  _T_123;
  wire  _GEN_2;
  reg [2:0] stateSlaveWrite;
  reg [31:0] _RAND_6;
  reg [5:0] writeAddr;
  reg [31:0] _RAND_7;
  reg [2:0] stateSlaveRead;
  reg [31:0] _RAND_8;
  reg [31:0] readData;
  reg [31:0] _RAND_9;
  wire  _T_132;
  wire  _T_133;
  wire  _T_134;
  wire  _T_135;
  wire  _T_181;
  wire  addrwr_handshake;
  wire  write_handshake;
  wire [63:0] _GEN_3;
  wire [2:0] _GEN_4;
  wire  _T_184;
  wire [2:0] _GEN_5;
  wire [2:0] _GEN_6;
  wire  _T_187;
  wire  _T_188;
  wire [2:0] _GEN_7;
  wire  _T_190;
  wire [2:0] _GEN_8;
  wire [2:0] _GEN_9;
  wire  _T_195;
  wire  _T_196;
  wire  _T_197;
  wire [2:0] _GEN_10;
  wire  _T_199;
  wire [2:0] _GEN_11;
  wire [2:0] _GEN_12;
  wire  _T_206;
  wire  _T_207;
  wire [2:0] _GEN_13;
  wire  _T_210;
  wire  _T_211;
  wire  _T_212;
  wire  addrrd_handshake;
  wire [2:0] _GEN_14;
  wire [2:0] _GEN_15;
  wire  _T_215;
  wire [2:0] _GEN_16;
  wire [2:0] _GEN_17;
  wire  _T_218;
  wire  _T_219;
  wire  _T_220;
  wire [2:0] _GEN_18;
  wire  _T_222;
  wire [2:0] _GEN_19;
  wire [2:0] _GEN_20;
  wire  _T_226;
  wire  _T_227;
  wire [2:0] _GEN_21;
  wire  _T_229;
  wire [1:0] _GEN_31;
  wire [1:0] _T_230;
  wire [1:0] _GEN_32;
  wire [1:0] _T_231;
  wire [2:0] _GEN_33;
  wire [2:0] _T_232;
  wire [2:0] _GEN_34;
  wire [2:0] _T_233;
  wire [3:0] _GEN_35;
  wire [3:0] _T_234;
  wire [3:0] _GEN_36;
  wire [3:0] _T_235;
  wire [7:0] _GEN_37;
  wire [7:0] _T_236;
  wire [7:0] _GEN_38;
  wire [7:0] _T_237;
  wire [31:0] _GEN_22;
  wire [31:0] _GEN_23;
  wire  _T_239;
  wire  _T_240;
  wire  _T_241;
  wire  _T_242;
  wire  _T_243;
  wire  _T_244;
  wire  _GEN_24;
  wire  _T_247;
  wire  _T_248;
  wire  _GEN_25;
  wire  _GEN_26;
  wire  _T_254;
  wire  _GEN_27;
  wire  _GEN_28;
  wire  _T_261;
  wire  _GEN_29;
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
  assign S_AXI_CONTROL_AWREADY = _T_134;
  assign S_AXI_CONTROL_WREADY = _T_135;
  assign S_AXI_CONTROL_BVALID = _T_181;
  assign S_AXI_CONTROL_BRESP = 2'h0;
  assign S_AXI_CONTROL_ARREADY = _T_211;
  assign S_AXI_CONTROL_RVALID = _T_212;
  assign S_AXI_CONTROL_RDATA = readData;
  assign S_AXI_CONTROL_RRESP = 2'h0;
  assign _T_108 = ap_rst_n == 1'h0;
  assign _T_113 = ap_start_r == 1'h0;
  assign ap_start_pulse = ap_start & _T_113;
  assign _GEN_0 = ap_done ? 1'h1 : ap_idle;
  assign _T_116 = ap_done == 1'h0;
  assign _T_117 = _T_116 & ap_start_pulse;
  assign _GEN_1 = _T_117 ? 1'h0 : _GEN_0;
  assign _T_122 = ap_start_pulse == 1'h0;
  assign _T_123 = _T_116 & _T_122;
  assign _GEN_2 = _T_123 ? ap_idle : _GEN_1;
  assign _T_132 = aap_rst_n == 1'h0;
  assign _T_133 = stateSlaveWrite == 3'h0;
  assign _T_134 = _T_132 & _T_133;
  assign _T_135 = stateSlaveWrite == 3'h1;
  assign _T_181 = stateSlaveWrite == 3'h2;
  assign addrwr_handshake = S_AXI_CONTROL_AWVALID & S_AXI_CONTROL_AWREADY;
  assign write_handshake = S_AXI_CONTROL_WVALID & S_AXI_CONTROL_WREADY;
  assign _GEN_3 = addrwr_handshake ? S_AXI_CONTROL_AWADDR : {{58'd0}, writeAddr};
  assign _GEN_4 = S_AXI_CONTROL_AWVALID ? 3'h1 : stateSlaveWrite;
  assign _T_184 = S_AXI_CONTROL_AWVALID == 1'h0;
  assign _GEN_5 = _T_184 ? 3'h0 : _GEN_4;
  assign _GEN_6 = _T_133 ? _GEN_5 : stateSlaveWrite;
  assign _T_187 = _T_133 == 1'h0;
  assign _T_188 = _T_187 & _T_135;
  assign _GEN_7 = S_AXI_CONTROL_WVALID ? 3'h2 : _GEN_6;
  assign _T_190 = S_AXI_CONTROL_WVALID == 1'h0;
  assign _GEN_8 = _T_190 ? 3'h1 : _GEN_7;
  assign _GEN_9 = _T_188 ? _GEN_8 : _GEN_6;
  assign _T_195 = _T_135 == 1'h0;
  assign _T_196 = _T_187 & _T_195;
  assign _T_197 = _T_196 & _T_181;
  assign _GEN_10 = S_AXI_CONTROL_BREADY ? 3'h0 : _GEN_9;
  assign _T_199 = S_AXI_CONTROL_BREADY == 1'h0;
  assign _GEN_11 = _T_199 ? 3'h2 : _GEN_10;
  assign _GEN_12 = _T_197 ? _GEN_11 : _GEN_9;
  assign _T_206 = _T_181 == 1'h0;
  assign _T_207 = _T_196 & _T_206;
  assign _GEN_13 = _T_207 ? 3'h0 : _GEN_12;
  assign _T_210 = stateSlaveRead == 3'h0;
  assign _T_211 = _T_132 & _T_210;
  assign _T_212 = stateSlaveRead == 3'h3;
  assign addrrd_handshake = S_AXI_CONTROL_ARVALID & S_AXI_CONTROL_ARREADY;
  assign _GEN_14 = aap_rst_n ? 3'h0 : stateSlaveRead;
  assign _GEN_15 = S_AXI_CONTROL_ARVALID ? 3'h3 : _GEN_14;
  assign _T_215 = S_AXI_CONTROL_ARVALID == 1'h0;
  assign _GEN_16 = _T_215 ? 3'h0 : _GEN_15;
  assign _GEN_17 = _T_210 ? _GEN_16 : _GEN_14;
  assign _T_218 = _T_210 == 1'h0;
  assign _T_219 = _T_218 & _T_212;
  assign _T_220 = S_AXI_CONTROL_RVALID & S_AXI_CONTROL_RREADY;
  assign _GEN_18 = _T_220 ? 3'h0 : _GEN_17;
  assign _T_222 = _T_220 == 1'h0;
  assign _GEN_19 = _T_222 ? 3'h3 : _GEN_18;
  assign _GEN_20 = _T_219 ? _GEN_19 : _GEN_17;
  assign _T_226 = _T_212 == 1'h0;
  assign _T_227 = _T_218 & _T_226;
  assign _GEN_21 = _T_227 ? 3'h0 : _GEN_20;
  assign _T_229 = S_AXI_CONTROL_ARADDR == 64'h0;
  assign _GEN_31 = {{1'd0}, ap_done};
  assign _T_230 = _GEN_31 << 1;
  assign _GEN_32 = {{1'd0}, ap_start};
  assign _T_231 = _GEN_32 | _T_230;
  assign _GEN_33 = {{2'd0}, ap_idle};
  assign _T_232 = _GEN_33 << 2;
  assign _GEN_34 = {{1'd0}, _T_231};
  assign _T_233 = _GEN_34 | _T_232;
  assign _GEN_35 = {{3'd0}, ap_done};
  assign _T_234 = _GEN_35 << 3;
  assign _GEN_36 = {{1'd0}, _T_233};
  assign _T_235 = _GEN_36 | _T_234;
  assign _GEN_37 = {{7'd0}, auto_restart};
  assign _T_236 = _GEN_37 << 7;
  assign _GEN_38 = {{4'd0}, _T_235};
  assign _T_237 = _GEN_38 | _T_236;
  assign _GEN_22 = _T_229 ? {{24'd0}, _T_237} : readData;
  assign _GEN_23 = addrrd_handshake ? _GEN_22 : readData;
  assign _T_239 = writeAddr == 6'h0;
  assign _T_240 = write_handshake & _T_239;
  assign _T_241 = S_AXI_CONTROL_WSTRB[0];
  assign _T_242 = _T_240 & _T_241;
  assign _T_243 = S_AXI_CONTROL_WDATA[0];
  assign _T_244 = _T_242 & _T_243;
  assign _GEN_24 = _T_244 ? 1'h1 : ap_start;
  assign _T_247 = _T_244 == 1'h0;
  assign _T_248 = _T_247 & ap_done;
  assign _GEN_25 = _T_248 ? auto_restart : _GEN_24;
  assign _GEN_26 = aap_rst_n ? 1'h0 : ap_done;
  assign _T_254 = addrrd_handshake & _T_229;
  assign _GEN_27 = _T_254 ? 1'h0 : _GEN_26;
  assign _GEN_28 = _T_132 ? _GEN_27 : _GEN_26;
  assign _T_261 = S_AXI_CONTROL_WDATA[7];
  assign _GEN_29 = _T_242 ? _T_261 : auto_restart;
  assign _GEN_30 = ap_start ? 1'h1 : _GEN_28;
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
  aap_rst_n = _RAND_4[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{$random}};
  ap_start_r = _RAND_5[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{$random}};
  stateSlaveWrite = _RAND_6[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{$random}};
  writeAddr = _RAND_7[5:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{$random}};
  stateSlaveRead = _RAND_8[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{$random}};
  readData = _RAND_9[31:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge ap_clk) begin
    if (ap_rst_n) begin
      ap_start <= 1'h0;
    end else begin
      if (_T_248) begin
        ap_start <= auto_restart;
      end else begin
        if (_T_244) begin
          ap_start <= 1'h1;
        end
      end
    end
    if (ap_rst_n) begin
      auto_restart <= 1'h0;
    end else begin
      if (_T_242) begin
        auto_restart <= _T_261;
      end
    end
    if (ap_rst_n) begin
      ap_idle <= 1'h1;
    end else begin
      if (!(_T_123)) begin
        if (_T_117) begin
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
      if (ap_start) begin
        ap_done <= 1'h1;
      end else begin
        if (_T_132) begin
          if (_T_254) begin
            ap_done <= 1'h0;
          end else begin
            if (aap_rst_n) begin
              ap_done <= 1'h0;
            end
          end
        end else begin
          if (aap_rst_n) begin
            ap_done <= 1'h0;
          end
        end
      end
    end
    aap_rst_n <= _T_108;
    if (ap_rst_n) begin
      ap_start_r <= 1'h0;
    end else begin
      ap_start_r <= ap_start;
    end
    if (ap_rst_n) begin
      stateSlaveWrite <= 3'h0;
    end else begin
      if (_T_207) begin
        stateSlaveWrite <= 3'h0;
      end else begin
        if (_T_197) begin
          if (_T_199) begin
            stateSlaveWrite <= 3'h2;
          end else begin
            if (S_AXI_CONTROL_BREADY) begin
              stateSlaveWrite <= 3'h0;
            end else begin
              if (_T_188) begin
                if (_T_190) begin
                  stateSlaveWrite <= 3'h1;
                end else begin
                  if (S_AXI_CONTROL_WVALID) begin
                    stateSlaveWrite <= 3'h2;
                  end else begin
                    if (_T_133) begin
                      if (_T_184) begin
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
                if (_T_133) begin
                  if (_T_184) begin
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
          if (_T_188) begin
            if (_T_190) begin
              stateSlaveWrite <= 3'h1;
            end else begin
              if (S_AXI_CONTROL_WVALID) begin
                stateSlaveWrite <= 3'h2;
              end else begin
                if (_T_133) begin
                  if (_T_184) begin
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
            if (_T_133) begin
              if (_T_184) begin
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
    if (ap_rst_n) begin
      writeAddr <= 6'h0;
    end else begin
      writeAddr <= _GEN_3[5:0];
    end
    if (ap_rst_n) begin
      stateSlaveRead <= 3'h0;
    end else begin
      if (_T_227) begin
        stateSlaveRead <= 3'h0;
      end else begin
        if (_T_219) begin
          if (_T_222) begin
            stateSlaveRead <= 3'h3;
          end else begin
            if (_T_220) begin
              stateSlaveRead <= 3'h0;
            end else begin
              if (_T_210) begin
                if (_T_215) begin
                  stateSlaveRead <= 3'h0;
                end else begin
                  if (S_AXI_CONTROL_ARVALID) begin
                    stateSlaveRead <= 3'h3;
                  end else begin
                    if (aap_rst_n) begin
                      stateSlaveRead <= 3'h0;
                    end
                  end
                end
              end else begin
                if (aap_rst_n) begin
                  stateSlaveRead <= 3'h0;
                end
              end
            end
          end
        end else begin
          if (_T_210) begin
            if (_T_215) begin
              stateSlaveRead <= 3'h0;
            end else begin
              if (S_AXI_CONTROL_ARVALID) begin
                stateSlaveRead <= 3'h3;
              end else begin
                if (aap_rst_n) begin
                  stateSlaveRead <= 3'h0;
                end
              end
            end
          end else begin
            if (aap_rst_n) begin
              stateSlaveRead <= 3'h0;
            end
          end
        end
      end
    end
    if (ap_rst_n) begin
      readData <= 32'h0;
    end else begin
      if (addrrd_handshake) begin
        if (_T_229) begin
          readData <= {{24'd0}, _T_237};
        end
      end
    end
  end
endmodule
