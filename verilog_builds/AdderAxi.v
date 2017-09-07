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
  reg  regStart;
  reg [31:0] _RAND_0;
  reg  regDone;
  reg [31:0] _RAND_1;
  reg [511:0] regDataReceived;
  reg [511:0] _RAND_2;
  reg [2:0] stateSlaveWrite;
  reg [31:0] _RAND_3;
  wire  _T_102;
  wire [2:0] _GEN_1;
  wire [2:0] _GEN_3;
  wire  _T_103;
  wire  _T_105;
  wire  _T_106;
  wire [511:0] _GEN_4;
  wire  _GEN_5;
  wire [2:0] _GEN_6;
  wire [511:0] _GEN_8;
  wire  _GEN_9;
  wire [2:0] _GEN_10;
  wire  _T_109;
  wire  _T_113;
  wire  _T_114;
  wire  _T_115;
  wire [2:0] _GEN_11;
  wire [2:0] _GEN_15;
  wire  _T_163;
  wire  _T_170;
  wire  _T_171;
  wire  _T_172;
  wire  _GEN_16;
  wire [2:0] _GEN_18;
  wire  _T_175;
  reg [2:0] stateSlaveRead;
  reg [31:0] _RAND_4;
  wire  _T_183;
  wire [2:0] _GEN_21;
  wire [2:0] _GEN_23;
  wire  _T_184;
  wire  _T_186;
  wire  _T_187;
  wire [1:0] _GEN_55;
  wire [1:0] _T_189;
  wire [2:0] _GEN_24;
  wire [2:0] _GEN_27;
  wire  _T_191;
  wire  _T_195;
  wire  _T_196;
  wire  _T_197;
  wire  _GEN_28;
  wire [2:0] _GEN_29;
  reg [4:0] value;
  reg [31:0] _RAND_5;
  reg  regFlagStart;
  reg [31:0] _RAND_6;
  reg  regStartWriting;
  reg [31:0] _RAND_7;
  wire  _T_208;
  wire  _T_209;
  wire  _T_211;
  wire [5:0] _T_213;
  wire [4:0] _T_214;
  wire [4:0] _GEN_30;
  wire [4:0] _GEN_31;
  wire  _GEN_32;
  wire  _T_218;
  wire  _T_220;
  wire  _T_221;
  wire [4:0] _GEN_34;
  wire  _T_229;
  wire  _T_231;
  wire  _T_232;
  wire  _GEN_35;
  reg [2:0] stateWriteMem;
  reg [31:0] _RAND_8;
  wire  _T_241;
  wire [2:0] _GEN_36;
  wire [2:0] _GEN_37;
  wire  _T_242;
  wire  _T_244;
  wire  _T_245;
  wire [2:0] _GEN_38;
  wire [2:0] _GEN_40;
  wire  _T_247;
  wire  _T_251;
  wire  _T_252;
  wire  _T_253;
  wire [2:0] _GEN_41;
  wire  _GEN_42;
  wire [2:0] _GEN_45;
  wire  _T_258;
  wire  _T_265;
  wire  _T_266;
  wire  _T_267;
  wire [2:0] _GEN_47;
  wire  _GEN_48;
  wire [2:0] _GEN_50;
  wire  _T_269;
  wire  _T_279;
  wire  _T_280;
  wire  _T_281;
  wire  _GEN_51;
  wire  _GEN_52;
  wire  _GEN_53;
  wire  _GEN_54;
  assign io_m0_writeAddr_valid = _GEN_53;
  assign io_m0_writeAddr_bits_addr = 64'h20;
  assign io_m0_writeAddr_bits_size = 3'h5;
  assign io_m0_writeAddr_bits_len = 8'h0;
  assign io_m0_writeAddr_bits_burst = 2'h1;
  assign io_m0_writeAddr_bits_id = 1'h0;
  assign io_m0_writeAddr_bits_lock = 1'h0;
  assign io_m0_writeAddr_bits_cache = 4'h0;
  assign io_m0_writeAddr_bits_prot = 3'h0;
  assign io_m0_writeAddr_bits_qos = 4'h0;
  assign io_m0_writeData_valid = _GEN_52;
  assign io_m0_writeData_bits_data = {{507'd0}, value};
  assign io_m0_writeData_bits_strb = 64'h0;
  assign io_m0_writeData_bits_last = _T_253;
  assign io_m0_writeResp_ready = _GEN_51;
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
  assign io_s0_writeAddr_ready = 1'h1;
  assign io_s0_writeData_ready = _GEN_16;
  assign io_s0_writeResp_valid = _GEN_16;
  assign io_s0_writeResp_bits = 2'h0;
  assign io_s0_readAddr_ready = 1'h1;
  assign io_s0_readData_valid = _GEN_28;
  assign io_s0_readData_bits_data = {{30'd0}, _T_189};
  assign io_s0_readData_bits_resp = 2'h0;
  assign _T_102 = stateSlaveWrite == 3'h0;
  assign _GEN_1 = io_s0_writeAddr_valid ? 3'h1 : stateSlaveWrite;
  assign _GEN_3 = _T_102 ? _GEN_1 : stateSlaveWrite;
  assign _T_103 = stateSlaveWrite == 3'h1;
  assign _T_105 = _T_102 == 1'h0;
  assign _T_106 = _T_105 & _T_103;
  assign _GEN_4 = io_s0_writeData_valid ? {{480'd0}, io_s0_writeData_bits_data} : regDataReceived;
  assign _GEN_5 = io_s0_writeData_valid ? 1'h0 : regDone;
  assign _GEN_6 = io_s0_writeData_valid ? 3'h3 : _GEN_3;
  assign _GEN_8 = _T_106 ? _GEN_4 : regDataReceived;
  assign _GEN_9 = _T_106 ? _GEN_5 : regDone;
  assign _GEN_10 = _T_106 ? _GEN_6 : _GEN_3;
  assign _T_109 = stateSlaveWrite == 3'h3;
  assign _T_113 = _T_103 == 1'h0;
  assign _T_114 = _T_105 & _T_113;
  assign _T_115 = _T_114 & _T_109;
  assign _GEN_11 = io_s0_writeResp_ready ? 3'h7 : _GEN_10;
  assign _GEN_15 = _T_115 ? _GEN_11 : _GEN_10;
  assign _T_163 = stateSlaveWrite == 3'h7;
  assign _T_170 = _T_109 == 1'h0;
  assign _T_171 = _T_114 & _T_170;
  assign _T_172 = _T_171 & _T_163;
  assign _GEN_16 = _T_172 ? 1'h0 : 1'h1;
  assign _GEN_18 = _T_172 ? 3'h0 : _GEN_15;
  assign _T_175 = regDataReceived[0];
  assign _T_183 = stateSlaveRead == 3'h0;
  assign _GEN_21 = io_s0_readAddr_valid ? 3'h2 : stateSlaveRead;
  assign _GEN_23 = _T_183 ? _GEN_21 : stateSlaveRead;
  assign _T_184 = stateSlaveRead == 3'h2;
  assign _T_186 = _T_183 == 1'h0;
  assign _T_187 = _T_186 & _T_184;
  assign _GEN_55 = {{1'd0}, regDone};
  assign _T_189 = _GEN_55 << 1'h1;
  assign _GEN_24 = io_s0_readData_ready ? 3'h7 : _GEN_23;
  assign _GEN_27 = _T_187 ? _GEN_24 : _GEN_23;
  assign _T_191 = stateSlaveRead == 3'h7;
  assign _T_195 = _T_184 == 1'h0;
  assign _T_196 = _T_186 & _T_195;
  assign _T_197 = _T_196 & _T_191;
  assign _GEN_28 = _T_197 ? 1'h0 : 1'h1;
  assign _GEN_29 = _T_197 ? 3'h0 : _GEN_27;
  assign _T_208 = regFlagStart == 1'h0;
  assign _T_209 = regStart & _T_208;
  assign _T_211 = value == 5'h1d;
  assign _T_213 = value + 5'h1;
  assign _T_214 = _T_213[4:0];
  assign _GEN_30 = _T_211 ? 5'h0 : _T_214;
  assign _GEN_31 = _T_209 ? _GEN_30 : value;
  assign _GEN_32 = _T_209 ? 1'h1 : regFlagStart;
  assign _T_218 = value > 5'h0;
  assign _T_220 = value < 5'h19;
  assign _T_221 = _T_218 & _T_220;
  assign _GEN_34 = _T_221 ? _GEN_30 : _GEN_31;
  assign _T_229 = value >= 5'h19;
  assign _T_231 = _T_221 == 1'h0;
  assign _T_232 = _T_231 & _T_229;
  assign _GEN_35 = _T_232 ? 1'h1 : regStartWriting;
  assign _T_241 = stateWriteMem == 3'h0;
  assign _GEN_36 = regStartWriting ? 3'h4 : stateWriteMem;
  assign _GEN_37 = _T_241 ? _GEN_36 : stateWriteMem;
  assign _T_242 = stateWriteMem == 3'h4;
  assign _T_244 = _T_241 == 1'h0;
  assign _T_245 = _T_244 & _T_242;
  assign _GEN_38 = io_m0_writeAddr_ready ? 3'h5 : _GEN_37;
  assign _GEN_40 = _T_245 ? _GEN_38 : _GEN_37;
  assign _T_247 = stateWriteMem == 3'h5;
  assign _T_251 = _T_242 == 1'h0;
  assign _T_252 = _T_244 & _T_251;
  assign _T_253 = _T_252 & _T_247;
  assign _GEN_41 = io_m0_writeData_ready ? 3'h6 : _GEN_40;
  assign _GEN_42 = _T_253 ? 1'h1 : _T_245;
  assign _GEN_45 = _T_253 ? _GEN_41 : _GEN_40;
  assign _T_258 = stateWriteMem == 3'h6;
  assign _T_265 = _T_247 == 1'h0;
  assign _T_266 = _T_252 & _T_265;
  assign _T_267 = _T_266 & _T_258;
  assign _GEN_47 = io_m0_writeResp_valid ? 3'h7 : _GEN_45;
  assign _GEN_48 = _T_267 ? 1'h1 : _T_253;
  assign _GEN_50 = _T_267 ? _GEN_47 : _GEN_45;
  assign _T_269 = stateWriteMem == 3'h7;
  assign _T_279 = _T_258 == 1'h0;
  assign _T_280 = _T_266 & _T_279;
  assign _T_281 = _T_280 & _T_269;
  assign _GEN_51 = _T_281 ? 1'h0 : _GEN_48;
  assign _GEN_52 = _T_281 ? 1'h0 : _T_253;
  assign _GEN_53 = _T_281 ? 1'h0 : _GEN_42;
  assign _GEN_54 = _T_281 ? 1'h1 : _GEN_9;
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{$random}};
  regStart = _RAND_0[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{$random}};
  regDone = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {16{$random}};
  regDataReceived = _RAND_2[511:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{$random}};
  stateSlaveWrite = _RAND_3[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{$random}};
  stateSlaveRead = _RAND_4[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{$random}};
  value = _RAND_5[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{$random}};
  regFlagStart = _RAND_6[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{$random}};
  regStartWriting = _RAND_7[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{$random}};
  stateWriteMem = _RAND_8[2:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      regStart <= 1'h0;
    end else begin
      regStart <= _T_175;
    end
    if (reset) begin
      regDone <= 1'h0;
    end else begin
      if (_T_281) begin
        regDone <= 1'h1;
      end else begin
        if (_T_106) begin
          if (io_s0_writeData_valid) begin
            regDone <= 1'h0;
          end
        end
      end
    end
    if (reset) begin
      regDataReceived <= 512'h0;
    end else begin
      if (_T_106) begin
        if (io_s0_writeData_valid) begin
          regDataReceived <= {{480'd0}, io_s0_writeData_bits_data};
        end
      end
    end
    if (reset) begin
      stateSlaveWrite <= 3'h0;
    end else begin
      if (_T_172) begin
        stateSlaveWrite <= 3'h0;
      end else begin
        if (_T_115) begin
          if (io_s0_writeResp_ready) begin
            stateSlaveWrite <= 3'h7;
          end else begin
            if (_T_106) begin
              if (io_s0_writeData_valid) begin
                stateSlaveWrite <= 3'h3;
              end else begin
                if (_T_102) begin
                  if (io_s0_writeAddr_valid) begin
                    stateSlaveWrite <= 3'h1;
                  end
                end
              end
            end else begin
              if (_T_102) begin
                if (io_s0_writeAddr_valid) begin
                  stateSlaveWrite <= 3'h1;
                end
              end
            end
          end
        end else begin
          if (_T_106) begin
            if (io_s0_writeData_valid) begin
              stateSlaveWrite <= 3'h3;
            end else begin
              if (_T_102) begin
                if (io_s0_writeAddr_valid) begin
                  stateSlaveWrite <= 3'h1;
                end
              end
            end
          end else begin
            if (_T_102) begin
              if (io_s0_writeAddr_valid) begin
                stateSlaveWrite <= 3'h1;
              end
            end
          end
        end
      end
    end
    if (reset) begin
      stateSlaveRead <= 3'h0;
    end else begin
      if (_T_197) begin
        stateSlaveRead <= 3'h0;
      end else begin
        if (_T_187) begin
          if (io_s0_readData_ready) begin
            stateSlaveRead <= 3'h7;
          end else begin
            if (_T_183) begin
              if (io_s0_readAddr_valid) begin
                stateSlaveRead <= 3'h2;
              end
            end
          end
        end else begin
          if (_T_183) begin
            if (io_s0_readAddr_valid) begin
              stateSlaveRead <= 3'h2;
            end
          end
        end
      end
    end
    if (reset) begin
      value <= 5'h0;
    end else begin
      if (_T_221) begin
        if (_T_211) begin
          value <= 5'h0;
        end else begin
          value <= _T_214;
        end
      end else begin
        if (_T_209) begin
          if (_T_211) begin
            value <= 5'h0;
          end else begin
            value <= _T_214;
          end
        end
      end
    end
    if (reset) begin
      regFlagStart <= 1'h0;
    end else begin
      if (_T_209) begin
        regFlagStart <= 1'h1;
      end
    end
    if (reset) begin
      regStartWriting <= 1'h0;
    end else begin
      if (_T_232) begin
        regStartWriting <= 1'h1;
      end
    end
    if (reset) begin
      stateWriteMem <= 3'h0;
    end else begin
      if (_T_267) begin
        if (io_m0_writeResp_valid) begin
          stateWriteMem <= 3'h7;
        end else begin
          if (_T_253) begin
            if (io_m0_writeData_ready) begin
              stateWriteMem <= 3'h6;
            end else begin
              if (_T_245) begin
                if (io_m0_writeAddr_ready) begin
                  stateWriteMem <= 3'h5;
                end else begin
                  if (_T_241) begin
                    if (regStartWriting) begin
                      stateWriteMem <= 3'h4;
                    end
                  end
                end
              end else begin
                if (_T_241) begin
                  if (regStartWriting) begin
                    stateWriteMem <= 3'h4;
                  end
                end
              end
            end
          end else begin
            if (_T_245) begin
              if (io_m0_writeAddr_ready) begin
                stateWriteMem <= 3'h5;
              end else begin
                if (_T_241) begin
                  if (regStartWriting) begin
                    stateWriteMem <= 3'h4;
                  end
                end
              end
            end else begin
              if (_T_241) begin
                if (regStartWriting) begin
                  stateWriteMem <= 3'h4;
                end
              end
            end
          end
        end
      end else begin
        if (_T_253) begin
          if (io_m0_writeData_ready) begin
            stateWriteMem <= 3'h6;
          end else begin
            if (_T_245) begin
              if (io_m0_writeAddr_ready) begin
                stateWriteMem <= 3'h5;
              end else begin
                stateWriteMem <= _GEN_37;
              end
            end else begin
              stateWriteMem <= _GEN_37;
            end
          end
        end else begin
          if (_T_245) begin
            if (io_m0_writeAddr_ready) begin
              stateWriteMem <= 3'h5;
            end else begin
              stateWriteMem <= _GEN_37;
            end
          end else begin
            stateWriteMem <= _GEN_37;
          end
        end
      end
    end
  end
endmodule
