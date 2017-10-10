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
  reg  ap_start;
  reg [31:0] _RAND_0;
  reg  auto_restart;
  reg [31:0] _RAND_1;
  reg  ap_idle;
  reg [31:0] _RAND_2;
  reg  ap_done;
  reg [31:0] _RAND_3;
  wire  _T_108;
  reg  areset;
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
  assign io_s0_writeAddr_ready = _T_134;
  assign io_s0_writeData_ready = _T_135;
  assign io_s0_writeResp_valid = _T_181;
  assign io_s0_writeResp_bits = 2'h0;
  assign io_s0_readAddr_ready = _T_211;
  assign io_s0_readData_valid = _T_212;
  assign io_s0_readData_bits_data = readData;
  assign io_s0_readData_bits_resp = 2'h0;
  assign _T_108 = reset == 1'h0;
  assign _T_113 = ap_start_r == 1'h0;
  assign ap_start_pulse = ap_start & _T_113;
  assign _GEN_0 = ap_done ? 1'h1 : ap_idle;
  assign _T_116 = ap_done == 1'h0;
  assign _T_117 = _T_116 & ap_start_pulse;
  assign _GEN_1 = _T_117 ? 1'h0 : _GEN_0;
  assign _T_122 = ap_start_pulse == 1'h0;
  assign _T_123 = _T_116 & _T_122;
  assign _GEN_2 = _T_123 ? ap_idle : _GEN_1;
  assign _T_132 = areset == 1'h0;
  assign _T_133 = stateSlaveWrite == 3'h0;
  assign _T_134 = _T_132 & _T_133;
  assign _T_135 = stateSlaveWrite == 3'h1;
  assign _T_181 = stateSlaveWrite == 3'h2;
  assign addrwr_handshake = io_s0_writeAddr_valid & io_s0_writeAddr_ready;
  assign write_handshake = io_s0_writeData_valid & io_s0_writeData_ready;
  assign _GEN_3 = addrwr_handshake ? io_s0_writeAddr_bits_addr : {{58'd0}, writeAddr};
  assign _GEN_4 = io_s0_writeAddr_valid ? 3'h1 : stateSlaveWrite;
  assign _T_184 = io_s0_writeAddr_valid == 1'h0;
  assign _GEN_5 = _T_184 ? 3'h0 : _GEN_4;
  assign _GEN_6 = _T_133 ? _GEN_5 : stateSlaveWrite;
  assign _T_187 = _T_133 == 1'h0;
  assign _T_188 = _T_187 & _T_135;
  assign _GEN_7 = io_s0_writeData_valid ? 3'h2 : _GEN_6;
  assign _T_190 = io_s0_writeData_valid == 1'h0;
  assign _GEN_8 = _T_190 ? 3'h1 : _GEN_7;
  assign _GEN_9 = _T_188 ? _GEN_8 : _GEN_6;
  assign _T_195 = _T_135 == 1'h0;
  assign _T_196 = _T_187 & _T_195;
  assign _T_197 = _T_196 & _T_181;
  assign _GEN_10 = io_s0_writeResp_ready ? 3'h0 : _GEN_9;
  assign _T_199 = io_s0_writeResp_ready == 1'h0;
  assign _GEN_11 = _T_199 ? 3'h2 : _GEN_10;
  assign _GEN_12 = _T_197 ? _GEN_11 : _GEN_9;
  assign _T_206 = _T_181 == 1'h0;
  assign _T_207 = _T_196 & _T_206;
  assign _GEN_13 = _T_207 ? 3'h0 : _GEN_12;
  assign _T_210 = stateSlaveRead == 3'h0;
  assign _T_211 = _T_132 & _T_210;
  assign _T_212 = stateSlaveRead == 3'h3;
  assign addrrd_handshake = io_s0_readAddr_valid & io_s0_readAddr_ready;
  assign _GEN_14 = areset ? 3'h0 : stateSlaveRead;
  assign _GEN_15 = io_s0_readAddr_valid ? 3'h3 : _GEN_14;
  assign _T_215 = io_s0_readAddr_valid == 1'h0;
  assign _GEN_16 = _T_215 ? 3'h0 : _GEN_15;
  assign _GEN_17 = _T_210 ? _GEN_16 : _GEN_14;
  assign _T_218 = _T_210 == 1'h0;
  assign _T_219 = _T_218 & _T_212;
  assign _T_220 = io_s0_readData_valid & io_s0_readData_ready;
  assign _GEN_18 = _T_220 ? 3'h0 : _GEN_17;
  assign _T_222 = _T_220 == 1'h0;
  assign _GEN_19 = _T_222 ? 3'h3 : _GEN_18;
  assign _GEN_20 = _T_219 ? _GEN_19 : _GEN_17;
  assign _T_226 = _T_212 == 1'h0;
  assign _T_227 = _T_218 & _T_226;
  assign _GEN_21 = _T_227 ? 3'h0 : _GEN_20;
  assign _T_229 = io_s0_readAddr_bits_addr == 64'h0;
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
  assign _T_241 = io_s0_writeData_bits_strb[0];
  assign _T_242 = _T_240 & _T_241;
  assign _T_243 = io_s0_writeData_bits_data[0];
  assign _T_244 = _T_242 & _T_243;
  assign _GEN_24 = _T_244 ? 1'h1 : ap_start;
  assign _T_247 = _T_244 == 1'h0;
  assign _T_248 = _T_247 & ap_done;
  assign _GEN_25 = _T_248 ? auto_restart : _GEN_24;
  assign _GEN_26 = areset ? 1'h0 : ap_done;
  assign _T_254 = addrrd_handshake & _T_229;
  assign _GEN_27 = _T_254 ? 1'h0 : _GEN_26;
  assign _GEN_28 = _T_132 ? _GEN_27 : _GEN_26;
  assign _T_261 = io_s0_writeData_bits_data[7];
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
  areset = _RAND_4[0:0];
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
  always @(posedge clock) begin
    if (reset) begin
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
    if (reset) begin
      auto_restart <= 1'h0;
    end else begin
      if (_T_242) begin
        auto_restart <= _T_261;
      end
    end
    if (reset) begin
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
    if (reset) begin
      ap_done <= 1'h0;
    end else begin
      if (ap_start) begin
        ap_done <= 1'h1;
      end else begin
        if (_T_132) begin
          if (_T_254) begin
            ap_done <= 1'h0;
          end else begin
            if (areset) begin
              ap_done <= 1'h0;
            end
          end
        end else begin
          if (areset) begin
            ap_done <= 1'h0;
          end
        end
      end
    end
    areset <= _T_108;
    if (reset) begin
      ap_start_r <= 1'h0;
    end else begin
      ap_start_r <= ap_start;
    end
    if (reset) begin
      stateSlaveWrite <= 3'h0;
    end else begin
      if (_T_207) begin
        stateSlaveWrite <= 3'h0;
      end else begin
        if (_T_197) begin
          if (_T_199) begin
            stateSlaveWrite <= 3'h2;
          end else begin
            if (io_s0_writeResp_ready) begin
              stateSlaveWrite <= 3'h0;
            end else begin
              if (_T_188) begin
                if (_T_190) begin
                  stateSlaveWrite <= 3'h1;
                end else begin
                  if (io_s0_writeData_valid) begin
                    stateSlaveWrite <= 3'h2;
                  end else begin
                    if (_T_133) begin
                      if (_T_184) begin
                        stateSlaveWrite <= 3'h0;
                      end else begin
                        if (io_s0_writeAddr_valid) begin
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
                    if (io_s0_writeAddr_valid) begin
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
              if (io_s0_writeData_valid) begin
                stateSlaveWrite <= 3'h2;
              end else begin
                if (_T_133) begin
                  if (_T_184) begin
                    stateSlaveWrite <= 3'h0;
                  end else begin
                    if (io_s0_writeAddr_valid) begin
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
                if (io_s0_writeAddr_valid) begin
                  stateSlaveWrite <= 3'h1;
                end
              end
            end
          end
        end
      end
    end
    if (reset) begin
      writeAddr <= 6'h0;
    end else begin
      writeAddr <= _GEN_3[5:0];
    end
    if (reset) begin
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
                  if (io_s0_readAddr_valid) begin
                    stateSlaveRead <= 3'h3;
                  end else begin
                    if (areset) begin
                      stateSlaveRead <= 3'h0;
                    end
                  end
                end
              end else begin
                if (areset) begin
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
              if (io_s0_readAddr_valid) begin
                stateSlaveRead <= 3'h3;
              end else begin
                if (areset) begin
                  stateSlaveRead <= 3'h0;
                end
              end
            end
          end else begin
            if (areset) begin
              stateSlaveRead <= 3'h0;
            end
          end
        end
      end
    end
    if (reset) begin
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
