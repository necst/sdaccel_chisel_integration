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
  wire  _T_124;
  wire  _GEN_2;
  wire  _T_132;
  wire  _T_133;
  wire  _GEN_3;
  reg [2:0] stateSlaveWrite;
  reg [31:0] _RAND_6;
  reg [5:0] writeAddr;
  reg [31:0] _RAND_7;
  reg [2:0] stateSlaveRead;
  reg [31:0] _RAND_8;
  reg [31:0] readData;
  reg [31:0] _RAND_9;
  wire  _T_143;
  wire  _T_144;
  wire  _T_145;
  wire  _T_191;
  wire  addrwr_handshake;
  wire  write_handshake;
  wire [63:0] _GEN_4;
  wire [2:0] _GEN_5;
  wire  _T_194;
  wire [2:0] _GEN_6;
  wire [2:0] _GEN_7;
  wire  _T_197;
  wire  _T_198;
  wire [2:0] _GEN_8;
  wire  _T_200;
  wire [2:0] _GEN_9;
  wire [2:0] _GEN_10;
  wire  _T_205;
  wire  _T_206;
  wire  _T_207;
  wire [2:0] _GEN_11;
  wire  _T_209;
  wire [2:0] _GEN_12;
  wire [2:0] _GEN_13;
  wire  _T_216;
  wire  _T_217;
  wire [2:0] _GEN_14;
  wire  _T_220;
  wire  _T_221;
  wire  _T_222;
  wire  addrrd_handshake;
  wire [2:0] _GEN_15;
  wire [2:0] _GEN_16;
  wire  _T_225;
  wire [2:0] _GEN_17;
  wire [2:0] _GEN_18;
  wire  _T_228;
  wire  _T_229;
  wire  _T_230;
  wire [2:0] _GEN_19;
  wire  _T_232;
  wire [2:0] _GEN_20;
  wire [2:0] _GEN_21;
  wire  _T_236;
  wire  _T_237;
  wire [2:0] _GEN_22;
  wire  _T_239;
  wire [1:0] _GEN_35;
  wire [1:0] _T_240;
  wire [1:0] _GEN_36;
  wire [1:0] _T_241;
  wire [2:0] _GEN_37;
  wire [2:0] _T_242;
  wire [2:0] _GEN_38;
  wire [2:0] _T_243;
  wire [3:0] _GEN_39;
  wire [3:0] _T_244;
  wire [3:0] _GEN_40;
  wire [3:0] _T_245;
  wire [7:0] _GEN_41;
  wire [7:0] _T_246;
  wire [7:0] _GEN_42;
  wire [7:0] _T_247;
  wire [31:0] _GEN_23;
  wire [31:0] _GEN_24;
  wire  _GEN_25;
  wire  _T_252;
  wire  _T_253;
  wire  _T_254;
  wire  _T_255;
  wire  _T_256;
  wire  _T_257;
  wire  _GEN_26;
  wire  _T_260;
  wire  _T_261;
  wire  _GEN_27;
  wire  _GEN_28;
  wire  _GEN_29;
  wire  _T_267;
  wire  _GEN_30;
  wire  _GEN_31;
  wire  _GEN_32;
  wire  _T_277;
  wire  _T_278;
  wire  _GEN_33;
  wire  _GEN_34;
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
  assign S_AXI_CONTROL_AWREADY = _T_144;
  assign S_AXI_CONTROL_WREADY = _T_145;
  assign S_AXI_CONTROL_BVALID = _T_191;
  assign S_AXI_CONTROL_BRESP = 2'h0;
  assign S_AXI_CONTROL_ARREADY = _T_221;
  assign S_AXI_CONTROL_RVALID = _T_222;
  assign S_AXI_CONTROL_RDATA = readData;
  assign S_AXI_CONTROL_RRESP = 2'h0;
  assign _T_108 = ap_rst_n == 1'h0;
  assign _T_113 = ap_start_r == 1'h0;
  assign ap_start_pulse = ap_start & _T_113;
  assign _GEN_0 = aap_rst_n ? 1'h1 : ap_idle;
  assign _T_116 = aap_rst_n == 1'h0;
  assign _T_117 = _T_116 & ap_done;
  assign _GEN_1 = _T_117 ? 1'h1 : _GEN_0;
  assign _T_122 = ap_done == 1'h0;
  assign _T_123 = _T_116 & _T_122;
  assign _T_124 = _T_123 & ap_start_pulse;
  assign _GEN_2 = _T_124 ? 1'h0 : _GEN_1;
  assign _T_132 = ap_start_pulse == 1'h0;
  assign _T_133 = _T_123 & _T_132;
  assign _GEN_3 = _T_133 ? ap_idle : _GEN_2;
  assign _T_143 = stateSlaveWrite == 3'h0;
  assign _T_144 = _T_116 & _T_143;
  assign _T_145 = stateSlaveWrite == 3'h1;
  assign _T_191 = stateSlaveWrite == 3'h2;
  assign addrwr_handshake = S_AXI_CONTROL_AWVALID & S_AXI_CONTROL_AWREADY;
  assign write_handshake = S_AXI_CONTROL_WVALID & S_AXI_CONTROL_WREADY;
  assign _GEN_4 = addrwr_handshake ? S_AXI_CONTROL_AWADDR : {{58'd0}, writeAddr};
  assign _GEN_5 = S_AXI_CONTROL_AWVALID ? 3'h1 : stateSlaveWrite;
  assign _T_194 = S_AXI_CONTROL_AWVALID == 1'h0;
  assign _GEN_6 = _T_194 ? 3'h0 : _GEN_5;
  assign _GEN_7 = _T_143 ? _GEN_6 : stateSlaveWrite;
  assign _T_197 = _T_143 == 1'h0;
  assign _T_198 = _T_197 & _T_145;
  assign _GEN_8 = S_AXI_CONTROL_WVALID ? 3'h2 : _GEN_7;
  assign _T_200 = S_AXI_CONTROL_WVALID == 1'h0;
  assign _GEN_9 = _T_200 ? 3'h1 : _GEN_8;
  assign _GEN_10 = _T_198 ? _GEN_9 : _GEN_7;
  assign _T_205 = _T_145 == 1'h0;
  assign _T_206 = _T_197 & _T_205;
  assign _T_207 = _T_206 & _T_191;
  assign _GEN_11 = S_AXI_CONTROL_BREADY ? 3'h0 : _GEN_10;
  assign _T_209 = S_AXI_CONTROL_BREADY == 1'h0;
  assign _GEN_12 = _T_209 ? 3'h2 : _GEN_11;
  assign _GEN_13 = _T_207 ? _GEN_12 : _GEN_10;
  assign _T_216 = _T_191 == 1'h0;
  assign _T_217 = _T_206 & _T_216;
  assign _GEN_14 = _T_217 ? 3'h0 : _GEN_13;
  assign _T_220 = stateSlaveRead == 3'h0;
  assign _T_221 = _T_116 & _T_220;
  assign _T_222 = stateSlaveRead == 3'h3;
  assign addrrd_handshake = S_AXI_CONTROL_ARVALID & S_AXI_CONTROL_ARREADY;
  assign _GEN_15 = aap_rst_n ? 3'h0 : stateSlaveRead;
  assign _GEN_16 = S_AXI_CONTROL_ARVALID ? 3'h3 : _GEN_15;
  assign _T_225 = S_AXI_CONTROL_ARVALID == 1'h0;
  assign _GEN_17 = _T_225 ? 3'h0 : _GEN_16;
  assign _GEN_18 = _T_220 ? _GEN_17 : _GEN_15;
  assign _T_228 = _T_220 == 1'h0;
  assign _T_229 = _T_228 & _T_222;
  assign _T_230 = S_AXI_CONTROL_RVALID & S_AXI_CONTROL_RREADY;
  assign _GEN_19 = _T_230 ? 3'h0 : _GEN_18;
  assign _T_232 = _T_230 == 1'h0;
  assign _GEN_20 = _T_232 ? 3'h3 : _GEN_19;
  assign _GEN_21 = _T_229 ? _GEN_20 : _GEN_18;
  assign _T_236 = _T_222 == 1'h0;
  assign _T_237 = _T_228 & _T_236;
  assign _GEN_22 = _T_237 ? 3'h0 : _GEN_21;
  assign _T_239 = S_AXI_CONTROL_ARADDR == 64'h0;
  assign _GEN_35 = {{1'd0}, ap_done};
  assign _T_240 = _GEN_35 << 1;
  assign _GEN_36 = {{1'd0}, ap_start};
  assign _T_241 = _GEN_36 | _T_240;
  assign _GEN_37 = {{2'd0}, ap_idle};
  assign _T_242 = _GEN_37 << 2;
  assign _GEN_38 = {{1'd0}, _T_241};
  assign _T_243 = _GEN_38 | _T_242;
  assign _GEN_39 = {{3'd0}, ap_done};
  assign _T_244 = _GEN_39 << 3;
  assign _GEN_40 = {{1'd0}, _T_243};
  assign _T_245 = _GEN_40 | _T_244;
  assign _GEN_41 = {{7'd0}, auto_restart};
  assign _T_246 = _GEN_41 << 7;
  assign _GEN_42 = {{4'd0}, _T_245};
  assign _T_247 = _GEN_42 | _T_246;
  assign _GEN_23 = _T_239 ? {{24'd0}, _T_247} : readData;
  assign _GEN_24 = addrrd_handshake ? _GEN_23 : readData;
  assign _GEN_25 = aap_rst_n ? 1'h0 : ap_start;
  assign _T_252 = writeAddr == 6'h0;
  assign _T_253 = write_handshake & _T_252;
  assign _T_254 = S_AXI_CONTROL_WSTRB[0];
  assign _T_255 = _T_253 & _T_254;
  assign _T_256 = S_AXI_CONTROL_WDATA[0];
  assign _T_257 = _T_255 & _T_256;
  assign _GEN_26 = _T_257 ? 1'h1 : _GEN_25;
  assign _T_260 = _T_257 == 1'h0;
  assign _T_261 = _T_260 & ap_done;
  assign _GEN_27 = _T_261 ? auto_restart : _GEN_26;
  assign _GEN_28 = _T_116 ? _GEN_27 : _GEN_25;
  assign _GEN_29 = aap_rst_n ? 1'h0 : ap_done;
  assign _T_267 = addrrd_handshake & _T_239;
  assign _GEN_30 = _T_267 ? 1'h0 : _GEN_29;
  assign _GEN_31 = _T_116 ? _GEN_30 : _GEN_29;
  assign _GEN_32 = aap_rst_n ? 1'h0 : auto_restart;
  assign _T_277 = _T_116 & _T_255;
  assign _T_278 = S_AXI_CONTROL_WDATA[7];
  assign _GEN_33 = _T_277 ? _T_278 : _GEN_32;
  assign _GEN_34 = ap_start ? 1'h1 : _GEN_31;
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
      if (_T_116) begin
        if (_T_261) begin
          ap_start <= auto_restart;
        end else begin
          if (_T_257) begin
            ap_start <= 1'h1;
          end else begin
            if (aap_rst_n) begin
              ap_start <= 1'h0;
            end
          end
        end
      end else begin
        if (aap_rst_n) begin
          ap_start <= 1'h0;
        end
      end
    end
    if (ap_rst_n) begin
      auto_restart <= 1'h0;
    end else begin
      if (_T_277) begin
        auto_restart <= _T_278;
      end else begin
        if (aap_rst_n) begin
          auto_restart <= 1'h0;
        end
      end
    end
    if (ap_rst_n) begin
      ap_idle <= 1'h1;
    end else begin
      if (!(_T_133)) begin
        if (_T_124) begin
          ap_idle <= 1'h0;
        end else begin
          if (_T_117) begin
            ap_idle <= 1'h1;
          end else begin
            if (aap_rst_n) begin
              ap_idle <= 1'h1;
            end
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
        if (_T_116) begin
          if (_T_267) begin
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
      if (_T_217) begin
        stateSlaveWrite <= 3'h0;
      end else begin
        if (_T_207) begin
          if (_T_209) begin
            stateSlaveWrite <= 3'h2;
          end else begin
            if (S_AXI_CONTROL_BREADY) begin
              stateSlaveWrite <= 3'h0;
            end else begin
              if (_T_198) begin
                if (_T_200) begin
                  stateSlaveWrite <= 3'h1;
                end else begin
                  if (S_AXI_CONTROL_WVALID) begin
                    stateSlaveWrite <= 3'h2;
                  end else begin
                    if (_T_143) begin
                      if (_T_194) begin
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
                if (_T_143) begin
                  if (_T_194) begin
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
          if (_T_198) begin
            if (_T_200) begin
              stateSlaveWrite <= 3'h1;
            end else begin
              if (S_AXI_CONTROL_WVALID) begin
                stateSlaveWrite <= 3'h2;
              end else begin
                if (_T_143) begin
                  if (_T_194) begin
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
            if (_T_143) begin
              if (_T_194) begin
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
      writeAddr <= _GEN_4[5:0];
    end
    if (ap_rst_n) begin
      stateSlaveRead <= 3'h0;
    end else begin
      if (_T_237) begin
        stateSlaveRead <= 3'h0;
      end else begin
        if (_T_229) begin
          if (_T_232) begin
            stateSlaveRead <= 3'h3;
          end else begin
            if (_T_230) begin
              stateSlaveRead <= 3'h0;
            end else begin
              if (_T_220) begin
                if (_T_225) begin
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
          if (_T_220) begin
            if (_T_225) begin
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
        if (_T_239) begin
          readData <= {{24'd0}, _T_247};
        end
      end
    end
  end
endmodule
