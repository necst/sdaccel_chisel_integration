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
  reg  ap_start_r;
  reg [31:0] _RAND_4;
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
  reg [31:0] _RAND_5;
  reg [5:0] writeAddr;
  reg [31:0] _RAND_6;
  reg [2:0] stateSlaveRead;
  reg [31:0] _RAND_7;
  reg [31:0] readData;
  reg [31:0] _RAND_8;
  wire  _T_131;
  wire  _T_132;
  wire  _T_133;
  wire  _T_179;
  wire  addrwr_handshake;
  wire  write_handshake;
  wire [63:0] _GEN_3;
  wire [2:0] _GEN_4;
  wire  _T_182;
  wire [2:0] _GEN_5;
  wire [2:0] _GEN_6;
  wire  _T_185;
  wire  _T_186;
  wire [2:0] _GEN_7;
  wire  _T_188;
  wire [2:0] _GEN_8;
  wire [2:0] _GEN_9;
  wire  _T_193;
  wire  _T_194;
  wire  _T_195;
  wire [2:0] _GEN_10;
  wire  _T_197;
  wire [2:0] _GEN_11;
  wire [2:0] _GEN_12;
  wire  _T_204;
  wire  _T_205;
  wire [2:0] _GEN_13;
  wire  _T_206;
  wire  _T_207;
  wire  _T_208;
  wire  addrrd_handshake;
  wire [2:0] _GEN_14;
  wire  _T_211;
  wire [2:0] _GEN_15;
  wire [2:0] _GEN_16;
  wire  _T_214;
  wire  _T_215;
  wire  _T_216;
  wire [2:0] _GEN_17;
  wire  _T_218;
  wire [2:0] _GEN_18;
  wire [2:0] _GEN_19;
  wire  _T_222;
  wire  _T_223;
  wire [2:0] _GEN_20;
  wire  _T_225;
  wire [1:0] _GEN_28;
  wire [1:0] _T_226;
  wire [1:0] _GEN_29;
  wire [1:0] _T_227;
  wire [2:0] _GEN_30;
  wire [2:0] _T_228;
  wire [2:0] _GEN_31;
  wire [2:0] _T_229;
  wire [3:0] _GEN_32;
  wire [3:0] _T_230;
  wire [3:0] _GEN_33;
  wire [3:0] _T_231;
  wire [7:0] _GEN_34;
  wire [7:0] _T_232;
  wire [7:0] _GEN_35;
  wire [7:0] _T_233;
  wire [31:0] _GEN_21;
  wire [31:0] _GEN_22;
  wire  _T_235;
  wire  _T_236;
  wire  _T_237;
  wire  _T_238;
  wire  _T_239;
  wire  _T_240;
  wire  _GEN_23;
  wire  _T_243;
  wire  _T_244;
  wire  _GEN_24;
  wire  _T_247;
  wire  _GEN_25;
  wire  _T_254;
  wire  _GEN_26;
  wire  _GEN_27;
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
  assign io_s0_writeAddr_ready = _T_132;
  assign io_s0_writeData_ready = _T_133;
  assign io_s0_writeResp_valid = _T_179;
  assign io_s0_writeResp_bits = 2'h0;
  assign io_s0_readAddr_ready = _T_207;
  assign io_s0_readData_valid = _T_208;
  assign io_s0_readData_bits_data = readData;
  assign io_s0_readData_bits_resp = 2'h0;
  assign _T_113 = ap_start_r == 1'h0;
  assign ap_start_pulse = ap_start & _T_113;
  assign _GEN_0 = ap_done ? 1'h1 : ap_idle;
  assign _T_116 = ap_done == 1'h0;
  assign _T_117 = _T_116 & ap_start_pulse;
  assign _GEN_1 = _T_117 ? 1'h0 : _GEN_0;
  assign _T_122 = ap_start_pulse == 1'h0;
  assign _T_123 = _T_116 & _T_122;
  assign _GEN_2 = _T_123 ? ap_idle : _GEN_1;
  assign _T_131 = stateSlaveWrite == 3'h0;
  assign _T_132 = reset & _T_131;
  assign _T_133 = stateSlaveWrite == 3'h1;
  assign _T_179 = stateSlaveWrite == 3'h2;
  assign addrwr_handshake = io_s0_writeAddr_valid & io_s0_writeAddr_ready;
  assign write_handshake = io_s0_writeData_valid & io_s0_writeData_ready;
  assign _GEN_3 = addrwr_handshake ? io_s0_writeAddr_bits_addr : {{58'd0}, writeAddr};
  assign _GEN_4 = io_s0_writeAddr_valid ? 3'h1 : stateSlaveWrite;
  assign _T_182 = io_s0_writeAddr_valid == 1'h0;
  assign _GEN_5 = _T_182 ? 3'h0 : _GEN_4;
  assign _GEN_6 = _T_131 ? _GEN_5 : stateSlaveWrite;
  assign _T_185 = _T_131 == 1'h0;
  assign _T_186 = _T_185 & _T_133;
  assign _GEN_7 = io_s0_writeData_valid ? 3'h2 : _GEN_6;
  assign _T_188 = io_s0_writeData_valid == 1'h0;
  assign _GEN_8 = _T_188 ? 3'h1 : _GEN_7;
  assign _GEN_9 = _T_186 ? _GEN_8 : _GEN_6;
  assign _T_193 = _T_133 == 1'h0;
  assign _T_194 = _T_185 & _T_193;
  assign _T_195 = _T_194 & _T_179;
  assign _GEN_10 = io_s0_writeResp_ready ? 3'h0 : _GEN_9;
  assign _T_197 = io_s0_writeResp_ready == 1'h0;
  assign _GEN_11 = _T_197 ? 3'h2 : _GEN_10;
  assign _GEN_12 = _T_195 ? _GEN_11 : _GEN_9;
  assign _T_204 = _T_179 == 1'h0;
  assign _T_205 = _T_194 & _T_204;
  assign _GEN_13 = _T_205 ? 3'h0 : _GEN_12;
  assign _T_206 = stateSlaveRead == 3'h0;
  assign _T_207 = reset & _T_206;
  assign _T_208 = stateSlaveRead == 3'h3;
  assign addrrd_handshake = io_s0_readAddr_valid & io_s0_readAddr_ready;
  assign _GEN_14 = io_s0_readAddr_valid ? 3'h3 : stateSlaveRead;
  assign _T_211 = io_s0_readAddr_valid == 1'h0;
  assign _GEN_15 = _T_211 ? 3'h0 : _GEN_14;
  assign _GEN_16 = _T_206 ? _GEN_15 : stateSlaveRead;
  assign _T_214 = _T_206 == 1'h0;
  assign _T_215 = _T_214 & _T_208;
  assign _T_216 = io_s0_readData_valid & io_s0_readData_ready;
  assign _GEN_17 = _T_216 ? 3'h0 : _GEN_16;
  assign _T_218 = _T_216 == 1'h0;
  assign _GEN_18 = _T_218 ? 3'h3 : _GEN_17;
  assign _GEN_19 = _T_215 ? _GEN_18 : _GEN_16;
  assign _T_222 = _T_208 == 1'h0;
  assign _T_223 = _T_214 & _T_222;
  assign _GEN_20 = _T_223 ? 3'h0 : _GEN_19;
  assign _T_225 = io_s0_readAddr_bits_addr == 64'h0;
  assign _GEN_28 = {{1'd0}, ap_done};
  assign _T_226 = _GEN_28 << 1;
  assign _GEN_29 = {{1'd0}, ap_start};
  assign _T_227 = _GEN_29 | _T_226;
  assign _GEN_30 = {{2'd0}, ap_idle};
  assign _T_228 = _GEN_30 << 2;
  assign _GEN_31 = {{1'd0}, _T_227};
  assign _T_229 = _GEN_31 | _T_228;
  assign _GEN_32 = {{3'd0}, ap_done};
  assign _T_230 = _GEN_32 << 3;
  assign _GEN_33 = {{1'd0}, _T_229};
  assign _T_231 = _GEN_33 | _T_230;
  assign _GEN_34 = {{7'd0}, auto_restart};
  assign _T_232 = _GEN_34 << 7;
  assign _GEN_35 = {{4'd0}, _T_231};
  assign _T_233 = _GEN_35 | _T_232;
  assign _GEN_21 = _T_225 ? {{24'd0}, _T_233} : readData;
  assign _GEN_22 = addrrd_handshake ? _GEN_21 : readData;
  assign _T_235 = writeAddr == 6'h0;
  assign _T_236 = write_handshake & _T_235;
  assign _T_237 = io_s0_writeData_bits_strb[0];
  assign _T_238 = _T_236 & _T_237;
  assign _T_239 = io_s0_writeData_bits_data[0];
  assign _T_240 = _T_238 & _T_239;
  assign _GEN_23 = _T_240 ? 1'h1 : ap_start;
  assign _T_243 = _T_240 == 1'h0;
  assign _T_244 = _T_243 & ap_done;
  assign _GEN_24 = _T_244 ? auto_restart : _GEN_23;
  assign _T_247 = addrrd_handshake & _T_225;
  assign _GEN_25 = _T_247 ? 1'h0 : ap_done;
  assign _T_254 = io_s0_writeData_bits_data[7];
  assign _GEN_26 = _T_238 ? _T_254 : auto_restart;
  assign _GEN_27 = ap_start ? 1'h1 : _GEN_25;
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
  always @(posedge clock) begin
    if (reset) begin
      ap_start <= 1'h0;
    end else begin
      if (_T_244) begin
        ap_start <= auto_restart;
      end else begin
        if (_T_240) begin
          ap_start <= 1'h1;
        end
      end
    end
    if (reset) begin
      auto_restart <= 1'h0;
    end else begin
      if (_T_238) begin
        auto_restart <= _T_254;
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
        if (_T_247) begin
          ap_done <= 1'h0;
        end
      end
    end
    if (reset) begin
      ap_start_r <= 1'h0;
    end else begin
      ap_start_r <= ap_start;
    end
    if (reset) begin
      stateSlaveWrite <= 3'h0;
    end else begin
      if (_T_205) begin
        stateSlaveWrite <= 3'h0;
      end else begin
        if (_T_195) begin
          if (_T_197) begin
            stateSlaveWrite <= 3'h2;
          end else begin
            if (io_s0_writeResp_ready) begin
              stateSlaveWrite <= 3'h0;
            end else begin
              if (_T_186) begin
                if (_T_188) begin
                  stateSlaveWrite <= 3'h1;
                end else begin
                  if (io_s0_writeData_valid) begin
                    stateSlaveWrite <= 3'h2;
                  end else begin
                    if (_T_131) begin
                      if (_T_182) begin
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
                if (_T_131) begin
                  if (_T_182) begin
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
          if (_T_186) begin
            if (_T_188) begin
              stateSlaveWrite <= 3'h1;
            end else begin
              if (io_s0_writeData_valid) begin
                stateSlaveWrite <= 3'h2;
              end else begin
                if (_T_131) begin
                  if (_T_182) begin
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
            if (_T_131) begin
              if (_T_182) begin
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
      if (_T_223) begin
        stateSlaveRead <= 3'h0;
      end else begin
        if (_T_215) begin
          if (_T_218) begin
            stateSlaveRead <= 3'h3;
          end else begin
            if (_T_216) begin
              stateSlaveRead <= 3'h0;
            end else begin
              if (_T_206) begin
                if (_T_211) begin
                  stateSlaveRead <= 3'h0;
                end else begin
                  if (io_s0_readAddr_valid) begin
                    stateSlaveRead <= 3'h3;
                  end
                end
              end
            end
          end
        end else begin
          if (_T_206) begin
            if (_T_211) begin
              stateSlaveRead <= 3'h0;
            end else begin
              if (io_s0_readAddr_valid) begin
                stateSlaveRead <= 3'h3;
              end
            end
          end
        end
      end
    end
    if (reset) begin
      readData <= 32'h0;
    end else begin
      if (addrrd_handshake) begin
        if (_T_225) begin
          readData <= {{24'd0}, _T_233};
        end
      end
    end
  end
endmodule
