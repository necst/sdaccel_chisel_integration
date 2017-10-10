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
  assign io_s0_writeAddr_ready = _T_120;
  assign io_s0_writeData_ready = _T_121;
  assign io_s0_writeResp_valid = _T_167;
  assign io_s0_writeResp_bits = 2'h0;
  assign io_s0_readAddr_ready = _T_195;
  assign io_s0_readData_valid = _T_196;
  assign io_s0_readData_bits_data = readData;
  assign io_s0_readData_bits_resp = 2'h0;
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
  assign _T_120 = reset & _T_119;
  assign _T_121 = stateSlaveWrite == 3'h1;
  assign _T_167 = stateSlaveWrite == 3'h2;
  assign addrwr_handshake = io_s0_writeAddr_valid & io_s0_writeAddr_ready;
  assign write_handshake = io_s0_writeData_valid & io_s0_writeData_ready;
  assign _GEN_3 = addrwr_handshake ? io_s0_writeAddr_bits_addr : {{58'd0}, writeAddr};
  assign _GEN_4 = io_s0_writeAddr_valid ? 3'h1 : stateSlaveWrite;
  assign _T_170 = io_s0_writeAddr_valid == 1'h0;
  assign _GEN_5 = _T_170 ? 3'h0 : _GEN_4;
  assign _GEN_6 = _T_119 ? _GEN_5 : stateSlaveWrite;
  assign _T_173 = _T_119 == 1'h0;
  assign _T_174 = _T_173 & _T_121;
  assign _GEN_7 = io_s0_writeData_valid ? 3'h2 : _GEN_6;
  assign _T_176 = io_s0_writeData_valid == 1'h0;
  assign _GEN_8 = _T_176 ? 3'h1 : _GEN_7;
  assign _GEN_9 = _T_174 ? _GEN_8 : _GEN_6;
  assign _T_181 = _T_121 == 1'h0;
  assign _T_182 = _T_173 & _T_181;
  assign _T_183 = _T_182 & _T_167;
  assign _GEN_10 = io_s0_writeResp_ready ? 3'h0 : _GEN_9;
  assign _T_185 = io_s0_writeResp_ready == 1'h0;
  assign _GEN_11 = _T_185 ? 3'h2 : _GEN_10;
  assign _GEN_12 = _T_183 ? _GEN_11 : _GEN_9;
  assign _T_192 = _T_167 == 1'h0;
  assign _T_193 = _T_182 & _T_192;
  assign _GEN_13 = _T_193 ? 3'h0 : _GEN_12;
  assign _T_194 = stateSlaveRead == 3'h0;
  assign _T_195 = reset & _T_194;
  assign _T_196 = stateSlaveRead == 3'h3;
  assign addrrd_handshake = io_s0_readAddr_valid & io_s0_readAddr_ready;
  assign _GEN_14 = io_s0_readAddr_valid ? 3'h3 : stateSlaveRead;
  assign _T_199 = io_s0_readAddr_valid == 1'h0;
  assign _GEN_15 = _T_199 ? 3'h0 : _GEN_14;
  assign _GEN_16 = _T_194 ? _GEN_15 : stateSlaveRead;
  assign _T_202 = _T_194 == 1'h0;
  assign _T_203 = _T_202 & _T_196;
  assign _T_204 = io_s0_readData_valid & io_s0_readData_ready;
  assign _GEN_17 = _T_204 ? 3'h0 : _GEN_16;
  assign _T_206 = _T_204 == 1'h0;
  assign _GEN_18 = _T_206 ? 3'h3 : _GEN_17;
  assign _GEN_19 = _T_203 ? _GEN_18 : _GEN_16;
  assign _T_210 = _T_196 == 1'h0;
  assign _T_211 = _T_202 & _T_210;
  assign _GEN_20 = _T_211 ? 3'h0 : _GEN_19;
  assign _T_213 = io_s0_readAddr_bits_addr == 64'h0;
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
  assign _T_225 = io_s0_writeData_bits_strb[0];
  assign _T_226 = _T_224 & _T_225;
  assign _T_227 = io_s0_writeData_bits_data[0];
  assign _T_228 = _T_226 & _T_227;
  assign _GEN_23 = _T_228 ? 1'h1 : ap_start;
  assign _T_231 = _T_228 == 1'h0;
  assign _T_232 = _T_231 & ap_done;
  assign _GEN_24 = _T_232 ? auto_restart : _GEN_23;
  assign _T_235 = addrrd_handshake & _T_213;
  assign _GEN_25 = _T_235 ? 1'h0 : ap_done;
  assign _T_242 = io_s0_writeData_bits_data[7];
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
  always @(posedge clock) begin
    if (reset) begin
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
    if (reset) begin
      auto_restart <= 1'h0;
    end else begin
      if (_T_226) begin
        auto_restart <= _T_242;
      end
    end
    if (reset) begin
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
    if (reset) begin
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
    if (reset) begin
      ap_start_r <= 1'h0;
    end else begin
      ap_start_r <= ap_start;
    end
    if (reset) begin
      stateSlaveWrite <= 3'h0;
    end else begin
      if (_T_193) begin
        stateSlaveWrite <= 3'h0;
      end else begin
        if (_T_183) begin
          if (_T_185) begin
            stateSlaveWrite <= 3'h2;
          end else begin
            if (io_s0_writeResp_ready) begin
              stateSlaveWrite <= 3'h0;
            end else begin
              if (_T_174) begin
                if (_T_176) begin
                  stateSlaveWrite <= 3'h1;
                end else begin
                  if (io_s0_writeData_valid) begin
                    stateSlaveWrite <= 3'h2;
                  end else begin
                    if (_T_119) begin
                      if (_T_170) begin
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
                if (_T_119) begin
                  if (_T_170) begin
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
          if (_T_174) begin
            if (_T_176) begin
              stateSlaveWrite <= 3'h1;
            end else begin
              if (io_s0_writeData_valid) begin
                stateSlaveWrite <= 3'h2;
              end else begin
                if (_T_119) begin
                  if (_T_170) begin
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
            if (_T_119) begin
              if (_T_170) begin
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
                  if (io_s0_readAddr_valid) begin
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
        if (_T_213) begin
          readData <= {{24'd0}, _T_221};
        end
      end
    end
    if (reset) begin
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
    if (reset) begin
      regFlagStart <= 1'h0;
    end else begin
      if (_T_251) begin
        regFlagStart <= 1'h1;
      end
    end
  end
endmodule
