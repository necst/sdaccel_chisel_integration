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
  input          clock,
  input          reset,
  input          io_m0_writeAddr_ready,
  output         io_m0_writeAddr_valid,
  output [63:0]  io_m0_writeAddr_bits_addr,
  output [2:0]   io_m0_writeAddr_bits_size,
  output [7:0]   io_m0_writeAddr_bits_len,
  output [1:0]   io_m0_writeAddr_bits_burst,
  output         io_m0_writeAddr_bits_id,
  output         io_m0_writeAddr_bits_lock,
  output [3:0]   io_m0_writeAddr_bits_cache,
  output [2:0]   io_m0_writeAddr_bits_prot,
  output [3:0]   io_m0_writeAddr_bits_qos,
  input          io_m0_writeData_ready,
  output         io_m0_writeData_valid,
  output [511:0] io_m0_writeData_bits_data,
  output [63:0]  io_m0_writeData_bits_strb,
  output         io_m0_writeData_bits_last,
  output         io_m0_writeResp_ready,
  input          io_m0_writeResp_valid,
  input          io_m0_writeResp_bits_id,
  input  [1:0]   io_m0_writeResp_bits_resp,
  input          io_m0_readAddr_ready,
  output         io_m0_readAddr_valid,
  output [63:0]  io_m0_readAddr_bits_addr,
  output [2:0]   io_m0_readAddr_bits_size,
  output [7:0]   io_m0_readAddr_bits_len,
  output [1:0]   io_m0_readAddr_bits_burst,
  output         io_m0_readAddr_bits_id,
  output         io_m0_readAddr_bits_lock,
  output [3:0]   io_m0_readAddr_bits_cache,
  output [2:0]   io_m0_readAddr_bits_prot,
  output [3:0]   io_m0_readAddr_bits_qos,
  output         io_m0_readData_ready,
  input          io_m0_readData_valid,
  input  [511:0] io_m0_readData_bits_data,
  input          io_m0_readData_bits_id,
  input          io_m0_readData_bits_last,
  input  [1:0]   io_m0_readData_bits_resp,
  output         io_s0_writeAddr_ready,
  input          io_s0_writeAddr_valid,
  input  [63:0]  io_s0_writeAddr_bits_addr,
  input  [2:0]   io_s0_writeAddr_bits_prot,
  output         io_s0_writeData_ready,
  input          io_s0_writeData_valid,
  input  [31:0]  io_s0_writeData_bits_data,
  input  [3:0]   io_s0_writeData_bits_strb,
  input          io_s0_writeResp_ready,
  output         io_s0_writeResp_valid,
  output [1:0]   io_s0_writeResp_bits,
  output         io_s0_readAddr_ready,
  input          io_s0_readAddr_valid,
  input  [63:0]  io_s0_readAddr_bits_addr,
  input  [2:0]   io_s0_readAddr_bits_prot,
  input          io_s0_readData_ready,
  output         io_s0_readData_valid,
  output [31:0]  io_s0_readData_bits_data,
  output [1:0]   io_s0_readData_bits_resp
);
  reg [63:0] regCtrAddrWrite;
  reg [63:0] _RAND_0;
  reg [2:0] stateSlaveWrite;
  reg [31:0] _RAND_1;
  reg  addrwr_handshake;
  reg [31:0] _RAND_2;
  reg  write_handshake;
  reg [31:0] _RAND_3;
  wire  _T_105;
  wire  _T_106;
  wire [63:0] _GEN_0;
  wire  _T_107;
  wire [2:0] _GEN_1;
  wire [2:0] _GEN_4;
  wire  _T_110;
  wire  _T_112;
  wire  _T_113;
  wire [2:0] _GEN_5;
  wire  _GEN_6;
  wire [2:0] _GEN_8;
  wire  _T_116;
  wire  _T_120;
  wire  _T_121;
  wire  _T_122;
  wire [2:0] _GEN_9;
  wire  _T_171;
  wire [2:0] _GEN_10;
  wire  _GEN_11;
  wire [2:0] _GEN_14;
  reg [2:0] stateSlaveRead;
  reg [31:0] _RAND_4;
  reg  addrrd_handshake;
  reg [31:0] _RAND_5;
  reg [31:0] rdata;
  reg [31:0] _RAND_6;
  reg [5:0] raddr;
  reg [31:0] _RAND_7;
  wire  _T_181;
  wire  _T_182;
  wire [2:0] _GEN_16;
  wire [2:0] _GEN_20;
  wire  _T_185;
  wire  _T_187;
  wire  _T_188;
  wire [2:0] _GEN_21;
  wire  _GEN_22;
  wire [2:0] _GEN_24;
  wire  _T_194;
  wire  _T_195;
  wire [2:0] _GEN_25;
  reg  areset;
  reg [31:0] _RAND_8;
  reg  ap_start;
  reg [31:0] _RAND_9;
  reg  ap_start_pulse;
  reg [31:0] _RAND_10;
  reg  ap_start_r;
  reg [31:0] _RAND_11;
  reg  ap_ready;
  reg [31:0] _RAND_12;
  reg  ap_done;
  reg [31:0] _RAND_13;
  reg  ap_idle;
  reg [31:0] _RAND_14;
  reg  ap_autorestart;
  reg [31:0] _RAND_15;
  wire  _T_213;
  wire  _T_215;
  wire  _T_216;
  wire  _T_222;
  wire  _GEN_26;
  wire  _T_229;
  wire  _T_230;
  wire  _GEN_27;
  wire  _T_235;
  wire  _T_236;
  wire  _GEN_28;
  wire  _GEN_29;
  wire  _GEN_30;
  wire  _T_243;
  wire  _T_244;
  wire  _GEN_31;
  wire  _T_247;
  wire  _GEN_32;
  wire  _GEN_33;
  wire  _GEN_34;
  wire  _T_255;
  wire  _T_256;
  wire  _T_257;
  wire  _T_258;
  wire  _T_259;
  wire  _T_260;
  wire  _GEN_35;
  wire  _T_265;
  wire  _T_266;
  wire  _GEN_36;
  wire  _GEN_37;
  wire  _GEN_38;
  wire  _T_277;
  wire  _GEN_39;
  wire  _GEN_40;
  wire [1:0] _GEN_52;
  wire [1:0] _T_282;
  wire [1:0] _GEN_53;
  wire [1:0] _T_283;
  wire [3:0] _GEN_54;
  wire [3:0] _T_285;
  wire [3:0] _GEN_55;
  wire [3:0] _T_286;
  wire [3:0] _GEN_56;
  wire [3:0] _T_288;
  wire [3:0] _T_289;
  wire [7:0] _GEN_57;
  wire [7:0] _T_291;
  wire [7:0] _GEN_58;
  wire [7:0] _T_292;
  wire [31:0] _T_293;
  wire [31:0] _GEN_41;
  wire  _T_295;
  wire [31:0] _GEN_42;
  wire [31:0] _GEN_43;
  wire  _GEN_44;
  reg [4:0] value;
  reg [31:0] _RAND_16;
  reg  regFlagStart;
  reg [31:0] _RAND_17;
  wire  _T_307;
  wire  _T_308;
  wire  _T_310;
  wire [5:0] _T_312;
  wire [4:0] _T_313;
  wire [4:0] _GEN_45;
  wire [4:0] _GEN_46;
  wire  _GEN_47;
  wire  _GEN_48;
  wire  _T_318;
  wire  _T_320;
  wire  _T_321;
  wire [4:0] _GEN_50;
  wire  _T_329;
  wire  _T_331;
  wire  _T_332;
  wire  _GEN_51;
  assign io_m0_writeAddr_valid = 1'h0;
  assign io_m0_writeAddr_bits_addr = 64'h0;
  assign io_m0_writeAddr_bits_size = 3'h0;
  assign io_m0_writeAddr_bits_len = 8'h0;
  assign io_m0_writeAddr_bits_burst = 2'h0;
  assign io_m0_writeAddr_bits_id = 1'h0;
  assign io_m0_writeAddr_bits_lock = 1'h0;
  assign io_m0_writeAddr_bits_cache = 4'h0;
  assign io_m0_writeAddr_bits_prot = 3'h0;
  assign io_m0_writeAddr_bits_qos = 4'h0;
  assign io_m0_writeData_valid = 1'h0;
  assign io_m0_writeData_bits_data = 512'h0;
  assign io_m0_writeData_bits_strb = 64'h0;
  assign io_m0_writeData_bits_last = 1'h0;
  assign io_m0_writeResp_ready = 1'h0;
  assign io_m0_readAddr_valid = 1'h0;
  assign io_m0_readAddr_bits_addr = 64'h0;
  assign io_m0_readAddr_bits_size = 3'h0;
  assign io_m0_readAddr_bits_len = 8'h0;
  assign io_m0_readAddr_bits_burst = 2'h0;
  assign io_m0_readAddr_bits_id = 1'h0;
  assign io_m0_readAddr_bits_lock = 1'h0;
  assign io_m0_readAddr_bits_cache = 4'h0;
  assign io_m0_readAddr_bits_prot = 3'h0;
  assign io_m0_readAddr_bits_qos = 4'h0;
  assign io_m0_readData_ready = 1'h0;
  assign io_s0_writeAddr_ready = _GEN_6;
  assign io_s0_writeData_ready = _GEN_11;
  assign io_s0_writeResp_valid = _T_122;
  assign io_s0_writeResp_bits = 2'h0;
  assign io_s0_readAddr_ready = _GEN_22;
  assign io_s0_readData_valid = _T_188;
  assign io_s0_readData_bits_data = rdata;
  assign io_s0_readData_bits_resp = 2'h0;
  assign _T_105 = io_s0_writeAddr_valid & io_s0_writeAddr_ready;
  assign _T_106 = io_s0_writeData_valid & io_s0_writeData_ready;
  assign _GEN_0 = addrwr_handshake ? io_s0_writeAddr_bits_addr : regCtrAddrWrite;
  assign _T_107 = stateSlaveWrite == 3'h0;
  assign _GEN_1 = io_s0_writeAddr_valid ? 3'h1 : stateSlaveWrite;
  assign _GEN_4 = _T_107 ? _GEN_1 : stateSlaveWrite;
  assign _T_110 = stateSlaveWrite == 3'h1;
  assign _T_112 = _T_107 == 1'h0;
  assign _T_113 = _T_112 & _T_110;
  assign _GEN_5 = io_s0_writeData_valid ? 3'h3 : _GEN_4;
  assign _GEN_6 = _T_113 ? 1'h0 : 1'h1;
  assign _GEN_8 = _T_113 ? _GEN_5 : _GEN_4;
  assign _T_116 = stateSlaveWrite == 3'h3;
  assign _T_120 = _T_110 == 1'h0;
  assign _T_121 = _T_112 & _T_120;
  assign _T_122 = _T_121 & _T_116;
  assign _GEN_9 = io_s0_writeResp_ready ? 3'h0 : _GEN_8;
  assign _T_171 = io_s0_writeResp_ready == 1'h0;
  assign _GEN_10 = _T_171 ? 3'h0 : _GEN_9;
  assign _GEN_11 = _T_122 ? 1'h0 : 1'h1;
  assign _GEN_14 = _T_122 ? _GEN_10 : _GEN_8;
  assign _T_181 = io_s0_readAddr_valid & io_s0_readAddr_ready;
  assign _T_182 = stateSlaveRead == 3'h0;
  assign _GEN_16 = io_s0_readAddr_valid ? 3'h2 : stateSlaveRead;
  assign _GEN_20 = _T_182 ? _GEN_16 : stateSlaveRead;
  assign _T_185 = stateSlaveRead == 3'h2;
  assign _T_187 = _T_182 == 1'h0;
  assign _T_188 = _T_187 & _T_185;
  assign _GEN_21 = io_s0_readData_ready ? 3'h7 : _GEN_20;
  assign _GEN_22 = _T_188 ? 1'h0 : 1'h1;
  assign _GEN_24 = _T_188 ? _GEN_21 : _GEN_20;
  assign _T_194 = _T_185 == 1'h0;
  assign _T_195 = _T_187 & _T_194;
  assign _GEN_25 = _T_195 ? 3'h0 : _GEN_24;
  assign _T_213 = reset == 1'h0;
  assign _T_215 = ap_start_r == 1'h0;
  assign _T_216 = ap_start & _T_215;
  assign _T_222 = areset == 1'h0;
  assign _GEN_26 = ap_done ? 1'h1 : ap_idle;
  assign _T_229 = ap_done == 1'h0;
  assign _T_230 = _T_229 & ap_start_pulse;
  assign _GEN_27 = _T_230 ? 1'h0 : _GEN_26;
  assign _T_235 = ap_start_pulse == 1'h0;
  assign _T_236 = _T_229 & _T_235;
  assign _GEN_28 = _T_236 ? ap_idle : _GEN_27;
  assign _GEN_29 = _T_222 ? _GEN_28 : ap_idle;
  assign _GEN_30 = areset ? 1'h0 : ap_done;
  assign _T_243 = raddr == 6'h0;
  assign _T_244 = addrrd_handshake & _T_243;
  assign _GEN_31 = _T_244 ? 1'h0 : _GEN_30;
  assign _T_247 = _T_244 == 1'h0;
  assign _GEN_32 = _T_247 ? 1'h1 : _GEN_31;
  assign _GEN_33 = _T_222 ? _GEN_32 : _GEN_30;
  assign _GEN_34 = areset ? 1'h0 : ap_start;
  assign _T_255 = regCtrAddrWrite == 64'h0;
  assign _T_256 = write_handshake & _T_255;
  assign _T_257 = io_s0_writeData_bits_strb[0];
  assign _T_258 = _T_256 & _T_257;
  assign _T_259 = io_s0_writeData_bits_data[0];
  assign _T_260 = _T_258 & _T_259;
  assign _GEN_35 = _T_260 ? 1'h1 : _GEN_34;
  assign _T_265 = _T_260 == 1'h0;
  assign _T_266 = _T_265 & ap_ready;
  assign _GEN_36 = _T_266 ? ap_autorestart : _GEN_35;
  assign _GEN_37 = _T_222 ? _GEN_36 : _GEN_34;
  assign _GEN_38 = areset ? 1'h0 : ap_autorestart;
  assign _T_277 = io_s0_writeData_bits_data[7];
  assign _GEN_39 = _T_258 ? _T_277 : _GEN_38;
  assign _GEN_40 = _T_222 ? _GEN_39 : _GEN_38;
  assign _GEN_52 = {{1'd0}, ap_done};
  assign _T_282 = _GEN_52 << 1'h1;
  assign _GEN_53 = {{1'd0}, ap_start};
  assign _T_283 = _GEN_53 | _T_282;
  assign _GEN_54 = {{3'd0}, ap_idle};
  assign _T_285 = _GEN_54 << 2'h2;
  assign _GEN_55 = {{2'd0}, _T_283};
  assign _T_286 = _GEN_55 | _T_285;
  assign _GEN_56 = {{3'd0}, ap_ready};
  assign _T_288 = _GEN_56 << 2'h3;
  assign _T_289 = _T_286 | _T_288;
  assign _GEN_57 = {{7'd0}, ap_autorestart};
  assign _T_291 = _GEN_57 << 3'h7;
  assign _GEN_58 = {{4'd0}, _T_289};
  assign _T_292 = _GEN_58 | _T_291;
  assign _T_293 = {{24'd0}, _T_292};
  assign _GEN_41 = _T_243 ? _T_293 : rdata;
  assign _T_295 = _T_243 == 1'h0;
  assign _GEN_42 = _T_295 ? 32'h0 : _GEN_41;
  assign _GEN_43 = addrrd_handshake ? _GEN_42 : rdata;
  assign _GEN_44 = _T_255 ? 1'h1 : _GEN_37;
  assign _T_307 = regFlagStart == 1'h0;
  assign _T_308 = ap_start_pulse & _T_307;
  assign _T_310 = value == 5'h1d;
  assign _T_312 = value + 5'h1;
  assign _T_313 = _T_312[4:0];
  assign _GEN_45 = _T_310 ? 5'h0 : _T_313;
  assign _GEN_46 = _T_308 ? _GEN_45 : value;
  assign _GEN_47 = _T_308 ? 1'h1 : regFlagStart;
  assign _GEN_48 = _T_308 ? 1'h1 : _GEN_33;
  assign _T_318 = value > 5'h0;
  assign _T_320 = value < 5'h19;
  assign _T_321 = _T_318 & _T_320;
  assign _GEN_50 = _T_321 ? _GEN_45 : _GEN_46;
  assign _T_329 = value >= 5'h19;
  assign _T_331 = _T_321 == 1'h0;
  assign _T_332 = _T_331 & _T_329;
  assign _GEN_51 = _T_332 ? 1'h1 : _GEN_48;
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {2{$random}};
  regCtrAddrWrite = _RAND_0[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{$random}};
  stateSlaveWrite = _RAND_1[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{$random}};
  addrwr_handshake = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{$random}};
  write_handshake = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{$random}};
  stateSlaveRead = _RAND_4[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{$random}};
  addrrd_handshake = _RAND_5[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{$random}};
  rdata = _RAND_6[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{$random}};
  raddr = _RAND_7[5:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{$random}};
  areset = _RAND_8[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{$random}};
  ap_start = _RAND_9[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{$random}};
  ap_start_pulse = _RAND_10[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{$random}};
  ap_start_r = _RAND_11[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_12 = {1{$random}};
  ap_ready = _RAND_12[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_13 = {1{$random}};
  ap_done = _RAND_13[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_14 = {1{$random}};
  ap_idle = _RAND_14[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_15 = {1{$random}};
  ap_autorestart = _RAND_15[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_16 = {1{$random}};
  value = _RAND_16[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_17 = {1{$random}};
  regFlagStart = _RAND_17[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      regCtrAddrWrite <= 64'h0;
    end else begin
      if (addrwr_handshake) begin
        regCtrAddrWrite <= io_s0_writeAddr_bits_addr;
      end
    end
    if (reset) begin
      stateSlaveWrite <= 3'h0;
    end else begin
      if (_T_122) begin
        if (_T_171) begin
          stateSlaveWrite <= 3'h0;
        end else begin
          if (io_s0_writeResp_ready) begin
            stateSlaveWrite <= 3'h0;
          end else begin
            if (_T_113) begin
              if (io_s0_writeData_valid) begin
                stateSlaveWrite <= 3'h3;
              end else begin
                if (_T_107) begin
                  if (io_s0_writeAddr_valid) begin
                    stateSlaveWrite <= 3'h1;
                  end
                end
              end
            end else begin
              if (_T_107) begin
                if (io_s0_writeAddr_valid) begin
                  stateSlaveWrite <= 3'h1;
                end
              end
            end
          end
        end
      end else begin
        if (_T_113) begin
          if (io_s0_writeData_valid) begin
            stateSlaveWrite <= 3'h3;
          end else begin
            if (_T_107) begin
              if (io_s0_writeAddr_valid) begin
                stateSlaveWrite <= 3'h1;
              end
            end
          end
        end else begin
          if (_T_107) begin
            if (io_s0_writeAddr_valid) begin
              stateSlaveWrite <= 3'h1;
            end
          end
        end
      end
    end
    if (reset) begin
      addrwr_handshake <= 1'h0;
    end else begin
      addrwr_handshake <= _T_105;
    end
    if (reset) begin
      write_handshake <= 1'h0;
    end else begin
      write_handshake <= _T_106;
    end
    if (reset) begin
      stateSlaveRead <= 3'h0;
    end else begin
      if (_T_195) begin
        stateSlaveRead <= 3'h0;
      end else begin
        if (_T_188) begin
          if (io_s0_readData_ready) begin
            stateSlaveRead <= 3'h7;
          end else begin
            if (_T_182) begin
              if (io_s0_readAddr_valid) begin
                stateSlaveRead <= 3'h2;
              end
            end
          end
        end else begin
          if (_T_182) begin
            if (io_s0_readAddr_valid) begin
              stateSlaveRead <= 3'h2;
            end
          end
        end
      end
    end
    if (reset) begin
      addrrd_handshake <= 1'h0;
    end else begin
      addrrd_handshake <= _T_181;
    end
    if (reset) begin
      rdata <= 32'h0;
    end else begin
      if (addrrd_handshake) begin
        if (_T_295) begin
          rdata <= 32'h0;
        end else begin
          if (_T_243) begin
            rdata <= _T_293;
          end
        end
      end
    end
    if (reset) begin
      raddr <= 6'h0;
    end else begin
      raddr <= io_s0_readAddr_bits_addr[5:0];
    end
    if (reset) begin
      areset <= 1'h0;
    end else begin
      areset <= _T_213;
    end
    if (reset) begin
      ap_start <= 1'h0;
    end else begin
      if (_T_255) begin
        ap_start <= 1'h1;
      end else begin
        if (_T_222) begin
          if (_T_266) begin
            ap_start <= ap_autorestart;
          end else begin
            if (_T_260) begin
              ap_start <= 1'h1;
            end else begin
              if (areset) begin
                ap_start <= 1'h0;
              end
            end
          end
        end else begin
          if (areset) begin
            ap_start <= 1'h0;
          end
        end
      end
    end
    if (reset) begin
      ap_start_pulse <= 1'h0;
    end else begin
      ap_start_pulse <= _T_216;
    end
    if (reset) begin
      ap_start_r <= 1'h0;
    end else begin
      ap_start_r <= ap_start;
    end
    if (reset) begin
      ap_ready <= 1'h0;
    end else begin
      ap_ready <= ap_done;
    end
    if (reset) begin
      ap_done <= 1'h0;
    end else begin
      if (_T_332) begin
        ap_done <= 1'h1;
      end else begin
        if (_T_308) begin
          ap_done <= 1'h1;
        end else begin
          if (_T_222) begin
            if (_T_247) begin
              ap_done <= 1'h1;
            end else begin
              if (_T_244) begin
                ap_done <= 1'h0;
              end else begin
                if (areset) begin
                  ap_done <= 1'h0;
                end
              end
            end
          end else begin
            if (areset) begin
              ap_done <= 1'h0;
            end
          end
        end
      end
    end
    if (reset) begin
      ap_idle <= 1'h1;
    end else begin
      if (_T_222) begin
        if (!(_T_236)) begin
          if (_T_230) begin
            ap_idle <= 1'h0;
          end else begin
            if (ap_done) begin
              ap_idle <= 1'h1;
            end
          end
        end
      end
    end
    if (reset) begin
      ap_autorestart <= 1'h0;
    end else begin
      if (_T_222) begin
        if (_T_258) begin
          ap_autorestart <= _T_277;
        end else begin
          if (areset) begin
            ap_autorestart <= 1'h0;
          end
        end
      end else begin
        if (areset) begin
          ap_autorestart <= 1'h0;
        end
      end
    end
    if (reset) begin
      value <= 5'h0;
    end else begin
      if (_T_321) begin
        if (_T_310) begin
          value <= 5'h0;
        end else begin
          value <= _T_313;
        end
      end else begin
        if (_T_308) begin
          if (_T_310) begin
            value <= 5'h0;
          end else begin
            value <= _T_313;
          end
        end
      end
    end
    if (reset) begin
      regFlagStart <= 1'h0;
    end else begin
      if (_T_308) begin
        regFlagStart <= 1'h1;
      end
    end
  end
endmodule
