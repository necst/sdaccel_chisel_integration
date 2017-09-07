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
  input         clock,
  input         reset,
  input         io_m0_writeAddr_ready,
  output        io_m0_writeAddr_valid,
  output [63:0] io_m0_writeAddr_bits_addr,
  output [2:0]  io_m0_writeAddr_bits_size,
  output [7:0]  io_m0_writeAddr_bits_len,
  output [1:0]  io_m0_writeAddr_bits_burst,
  output        io_m0_writeAddr_bits_id,
  output        io_m0_writeAddr_bits_lock,
  output [3:0]  io_m0_writeAddr_bits_cache,
  output [2:0]  io_m0_writeAddr_bits_prot,
  output [3:0]  io_m0_writeAddr_bits_qos,
  input         io_m0_writeData_ready,
  output        io_m0_writeData_valid,
  output [31:0] io_m0_writeData_bits_data,
  output [3:0]  io_m0_writeData_bits_strb,
  output        io_m0_writeData_bits_last,
  output        io_m0_writeResp_ready,
  input         io_m0_writeResp_valid,
  input         io_m0_writeResp_bits_id,
  input  [1:0]  io_m0_writeResp_bits_resp,
  input         io_m0_readAddr_ready,
  output        io_m0_readAddr_valid,
  output [63:0] io_m0_readAddr_bits_addr,
  output [2:0]  io_m0_readAddr_bits_size,
  output [7:0]  io_m0_readAddr_bits_len,
  output [1:0]  io_m0_readAddr_bits_burst,
  output        io_m0_readAddr_bits_id,
  output        io_m0_readAddr_bits_lock,
  output [3:0]  io_m0_readAddr_bits_cache,
  output [2:0]  io_m0_readAddr_bits_prot,
  output [3:0]  io_m0_readAddr_bits_qos,
  output        io_m0_readData_ready,
  input         io_m0_readData_valid,
  input  [31:0] io_m0_readData_bits_data,
  input         io_m0_readData_bits_id,
  input         io_m0_readData_bits_last,
  input  [1:0]  io_m0_readData_bits_resp,
  output        io_s0_writeAddr_ready,
  input         io_s0_writeAddr_valid,
  input  [63:0] io_s0_writeAddr_bits_addr,
  input  [2:0]  io_s0_writeAddr_bits_prot,
  output        io_s0_writeData_ready,
  input         io_s0_writeData_valid,
  input  [31:0] io_s0_writeData_bits_data,
  input  [3:0]  io_s0_writeData_bits_strb,
  input         io_s0_writeResp_ready,
  output        io_s0_writeResp_valid,
  output [1:0]  io_s0_writeResp_bits,
  output        io_s0_readAddr_ready,
  input         io_s0_readAddr_valid,
  input  [63:0] io_s0_readAddr_bits_addr,
  input  [2:0]  io_s0_readAddr_bits_prot,
  input         io_s0_readData_ready,
  output        io_s0_readData_valid,
  output [31:0] io_s0_readData_bits_data,
  output [1:0]  io_s0_readData_bits_resp
);
  reg  regStart;
  reg [31:0] _RAND_0;
  reg  regDone;
  reg [31:0] _RAND_1;
  reg  regIdle;
  reg [31:0] _RAND_2;
  reg [63:0] regCtrAddrWrite;
  reg [63:0] _RAND_3;
  reg [2:0] stateSlaveWrite;
  reg [31:0] _RAND_4;
  wire  _T_147;
  wire [63:0] _GEN_0;
  wire [2:0] _GEN_1;
  wire [63:0] _GEN_2;
  wire [2:0] _GEN_3;
  wire  _T_148;
  wire  _T_150;
  wire  _T_151;
  wire  _T_152;
  wire  _T_154;
  wire  _T_155;
  wire  _T_156;
  wire  _GEN_5;
  wire  _GEN_6;
  wire  _GEN_7;
  wire [2:0] _GEN_8;
  wire  _GEN_11;
  wire  _GEN_12;
  wire  _GEN_13;
  wire [2:0] _GEN_14;
  wire  _T_158;
  wire [2:0] _GEN_15;
  wire  _GEN_18;
  wire  _GEN_19;
  wire  _GEN_20;
  wire [2:0] _GEN_21;
  wire  _T_159;
  wire  _T_163;
  wire  _T_164;
  wire  _T_165;
  wire [2:0] _GEN_22;
  wire [2:0] _GEN_26;
  wire  _T_168;
  wire  _T_175;
  wire  _T_176;
  wire  _T_177;
  wire  _GEN_27;
  wire [2:0] _GEN_29;
  wire  _GEN_30;
  reg [2:0] stateSlaveRead;
  reg [31:0] _RAND_5;
  reg [63:0] regCtrAddrRead;
  reg [63:0] _RAND_6;
  wire  _T_187;
  wire [63:0] _GEN_31;
  wire [2:0] _GEN_32;
  wire [63:0] _GEN_33;
  wire [2:0] _GEN_34;
  wire  _T_188;
  wire  _T_190;
  wire  _T_191;
  wire  _T_192;
  wire [1:0] _GEN_52;
  wire [1:0] _T_194;
  wire [1:0] _GEN_53;
  wire [1:0] _T_196;
  wire [1:0] _T_197;
  wire [3:0] _GEN_54;
  wire [3:0] _T_199;
  wire [3:0] _GEN_55;
  wire [3:0] _T_200;
  wire [2:0] _GEN_35;
  wire [2:0] _GEN_38;
  wire [2:0] _GEN_41;
  wire  _T_202;
  wire  _T_206;
  wire  _T_207;
  wire  _T_208;
  wire [2:0] _GEN_43;
  wire  _T_209;
  wire  _T_216;
  wire  _T_217;
  wire  _T_218;
  wire  _GEN_44;
  wire [2:0] _GEN_45;
  reg [4:0] value;
  reg [31:0] _RAND_7;
  reg  regFlagStart;
  reg [31:0] _RAND_8;
  wire  _T_227;
  wire  _T_228;
  wire  _T_230;
  wire [5:0] _T_232;
  wire [4:0] _T_233;
  wire [4:0] _GEN_46;
  wire [4:0] _GEN_47;
  wire  _GEN_48;
  wire  _T_237;
  wire  _T_239;
  wire  _T_240;
  wire [4:0] _GEN_50;
  wire  _T_248;
  wire  _T_250;
  wire  _T_251;
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
  assign io_m0_writeData_bits_data = 32'h0;
  assign io_m0_writeData_bits_strb = 4'h0;
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
  assign io_s0_writeAddr_ready = 1'h1;
  assign io_s0_writeData_ready = _GEN_27;
  assign io_s0_writeResp_valid = _GEN_27;
  assign io_s0_writeResp_bits = 2'h0;
  assign io_s0_readAddr_ready = 1'h1;
  assign io_s0_readData_valid = _GEN_44;
  assign io_s0_readData_bits_data = {{28'd0}, _T_200};
  assign io_s0_readData_bits_resp = 2'h0;
  assign _T_147 = stateSlaveWrite == 3'h0;
  assign _GEN_0 = io_s0_writeAddr_valid ? io_s0_writeAddr_bits_addr : regCtrAddrWrite;
  assign _GEN_1 = io_s0_writeAddr_valid ? 3'h1 : stateSlaveWrite;
  assign _GEN_2 = _T_147 ? _GEN_0 : regCtrAddrWrite;
  assign _GEN_3 = _T_147 ? _GEN_1 : stateSlaveWrite;
  assign _T_148 = stateSlaveWrite == 3'h1;
  assign _T_150 = _T_147 == 1'h0;
  assign _T_151 = _T_150 & _T_148;
  assign _T_152 = regCtrAddrWrite == 64'h0;
  assign _T_154 = io_s0_writeData_bits_data[0];
  assign _T_155 = io_s0_writeData_bits_data[1];
  assign _T_156 = io_s0_writeData_bits_data[2];
  assign _GEN_5 = io_s0_writeData_valid ? _T_154 : regStart;
  assign _GEN_6 = io_s0_writeData_valid ? _T_155 : regDone;
  assign _GEN_7 = io_s0_writeData_valid ? _T_156 : regIdle;
  assign _GEN_8 = io_s0_writeData_valid ? 3'h3 : _GEN_3;
  assign _GEN_11 = _T_152 ? _GEN_5 : regStart;
  assign _GEN_12 = _T_152 ? _GEN_6 : regDone;
  assign _GEN_13 = _T_152 ? _GEN_7 : regIdle;
  assign _GEN_14 = _T_152 ? _GEN_8 : _GEN_3;
  assign _T_158 = _T_152 == 1'h0;
  assign _GEN_15 = _T_158 ? 3'h4 : _GEN_14;
  assign _GEN_18 = _T_151 ? _GEN_11 : regStart;
  assign _GEN_19 = _T_151 ? _GEN_12 : regDone;
  assign _GEN_20 = _T_151 ? _GEN_13 : regIdle;
  assign _GEN_21 = _T_151 ? _GEN_15 : _GEN_3;
  assign _T_159 = stateSlaveWrite == 3'h3;
  assign _T_163 = _T_148 == 1'h0;
  assign _T_164 = _T_150 & _T_163;
  assign _T_165 = _T_164 & _T_159;
  assign _GEN_22 = io_s0_writeResp_ready ? 3'h4 : _GEN_21;
  assign _GEN_26 = _T_165 ? _GEN_22 : _GEN_21;
  assign _T_168 = stateSlaveWrite == 3'h4;
  assign _T_175 = _T_159 == 1'h0;
  assign _T_176 = _T_164 & _T_175;
  assign _T_177 = _T_176 & _T_168;
  assign _GEN_27 = _T_177 ? 1'h0 : 1'h1;
  assign _GEN_29 = _T_177 ? 3'h0 : _GEN_26;
  assign _GEN_30 = regDone ? 1'h1 : _GEN_20;
  assign _T_187 = stateSlaveRead == 3'h0;
  assign _GEN_31 = io_s0_readAddr_valid ? io_s0_readAddr_bits_addr : regCtrAddrRead;
  assign _GEN_32 = io_s0_readAddr_valid ? 3'h2 : stateSlaveRead;
  assign _GEN_33 = _T_187 ? _GEN_31 : regCtrAddrRead;
  assign _GEN_34 = _T_187 ? _GEN_32 : stateSlaveRead;
  assign _T_188 = stateSlaveRead == 3'h2;
  assign _T_190 = _T_187 == 1'h0;
  assign _T_191 = _T_190 & _T_188;
  assign _T_192 = regCtrAddrRead == 64'h0;
  assign _GEN_52 = {{1'd0}, regStart};
  assign _T_194 = _GEN_52 << 1'h0;
  assign _GEN_53 = {{1'd0}, regDone};
  assign _T_196 = _GEN_53 << 1'h1;
  assign _T_197 = _T_194 | _T_196;
  assign _GEN_54 = {{3'd0}, regIdle};
  assign _T_199 = _GEN_54 << 2'h2;
  assign _GEN_55 = {{2'd0}, _T_197};
  assign _T_200 = _GEN_55 | _T_199;
  assign _GEN_35 = io_s0_readData_ready ? 3'h3 : _GEN_34;
  assign _GEN_38 = _T_192 ? _GEN_35 : _GEN_34;
  assign _GEN_41 = _T_191 ? _GEN_38 : _GEN_34;
  assign _T_202 = stateSlaveRead == 3'h3;
  assign _T_206 = _T_188 == 1'h0;
  assign _T_207 = _T_190 & _T_206;
  assign _T_208 = _T_207 & _T_202;
  assign _GEN_43 = _T_208 ? 3'h4 : _GEN_41;
  assign _T_209 = stateSlaveRead == 3'h4;
  assign _T_216 = _T_202 == 1'h0;
  assign _T_217 = _T_207 & _T_216;
  assign _T_218 = _T_217 & _T_209;
  assign _GEN_44 = _T_218 ? 1'h0 : 1'h1;
  assign _GEN_45 = _T_218 ? 3'h0 : _GEN_43;
  assign _T_227 = regFlagStart == 1'h0;
  assign _T_228 = regStart & _T_227;
  assign _T_230 = value == 5'h1d;
  assign _T_232 = value + 5'h1;
  assign _T_233 = _T_232[4:0];
  assign _GEN_46 = _T_230 ? 5'h0 : _T_233;
  assign _GEN_47 = _T_228 ? _GEN_46 : value;
  assign _GEN_48 = _T_228 ? 1'h1 : regFlagStart;
  assign _T_237 = value > 5'h0;
  assign _T_239 = value < 5'h19;
  assign _T_240 = _T_237 & _T_239;
  assign _GEN_50 = _T_240 ? _GEN_46 : _GEN_47;
  assign _T_248 = value >= 5'h19;
  assign _T_250 = _T_240 == 1'h0;
  assign _T_251 = _T_250 & _T_248;
  assign _GEN_51 = _T_251 ? 1'h1 : _GEN_19;
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
  _RAND_2 = {1{$random}};
  regIdle = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {2{$random}};
  regCtrAddrWrite = _RAND_3[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{$random}};
  stateSlaveWrite = _RAND_4[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{$random}};
  stateSlaveRead = _RAND_5[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {2{$random}};
  regCtrAddrRead = _RAND_6[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{$random}};
  value = _RAND_7[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{$random}};
  regFlagStart = _RAND_8[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      regStart <= 1'h0;
    end else begin
      if (_T_151) begin
        if (_T_152) begin
          if (io_s0_writeData_valid) begin
            regStart <= _T_154;
          end
        end
      end
    end
    if (reset) begin
      regDone <= 1'h0;
    end else begin
      if (_T_251) begin
        regDone <= 1'h1;
      end else begin
        if (_T_151) begin
          if (_T_152) begin
            if (io_s0_writeData_valid) begin
              regDone <= _T_155;
            end
          end
        end
      end
    end
    if (reset) begin
      regIdle <= 1'h1;
    end else begin
      if (regDone) begin
        regIdle <= 1'h1;
      end else begin
        if (_T_151) begin
          if (_T_152) begin
            if (io_s0_writeData_valid) begin
              regIdle <= _T_156;
            end
          end
        end
      end
    end
    if (reset) begin
      regCtrAddrWrite <= 64'h0;
    end else begin
      if (_T_147) begin
        if (io_s0_writeAddr_valid) begin
          regCtrAddrWrite <= io_s0_writeAddr_bits_addr;
        end
      end
    end
    if (reset) begin
      stateSlaveWrite <= 3'h0;
    end else begin
      if (_T_177) begin
        stateSlaveWrite <= 3'h0;
      end else begin
        if (_T_165) begin
          if (io_s0_writeResp_ready) begin
            stateSlaveWrite <= 3'h4;
          end else begin
            if (_T_151) begin
              if (_T_158) begin
                stateSlaveWrite <= 3'h4;
              end else begin
                if (_T_152) begin
                  if (io_s0_writeData_valid) begin
                    stateSlaveWrite <= 3'h3;
                  end else begin
                    if (_T_147) begin
                      if (io_s0_writeAddr_valid) begin
                        stateSlaveWrite <= 3'h1;
                      end
                    end
                  end
                end else begin
                  if (_T_147) begin
                    if (io_s0_writeAddr_valid) begin
                      stateSlaveWrite <= 3'h1;
                    end
                  end
                end
              end
            end else begin
              if (_T_147) begin
                if (io_s0_writeAddr_valid) begin
                  stateSlaveWrite <= 3'h1;
                end
              end
            end
          end
        end else begin
          if (_T_151) begin
            if (_T_158) begin
              stateSlaveWrite <= 3'h4;
            end else begin
              if (_T_152) begin
                if (io_s0_writeData_valid) begin
                  stateSlaveWrite <= 3'h3;
                end else begin
                  if (_T_147) begin
                    if (io_s0_writeAddr_valid) begin
                      stateSlaveWrite <= 3'h1;
                    end
                  end
                end
              end else begin
                stateSlaveWrite <= _GEN_3;
              end
            end
          end else begin
            stateSlaveWrite <= _GEN_3;
          end
        end
      end
    end
    if (reset) begin
      stateSlaveRead <= 3'h0;
    end else begin
      if (_T_218) begin
        stateSlaveRead <= 3'h0;
      end else begin
        if (_T_208) begin
          stateSlaveRead <= 3'h4;
        end else begin
          if (_T_191) begin
            if (_T_192) begin
              if (io_s0_readData_ready) begin
                stateSlaveRead <= 3'h3;
              end else begin
                if (_T_187) begin
                  if (io_s0_readAddr_valid) begin
                    stateSlaveRead <= 3'h2;
                  end
                end
              end
            end else begin
              if (_T_187) begin
                if (io_s0_readAddr_valid) begin
                  stateSlaveRead <= 3'h2;
                end
              end
            end
          end else begin
            if (_T_187) begin
              if (io_s0_readAddr_valid) begin
                stateSlaveRead <= 3'h2;
              end
            end
          end
        end
      end
    end
    if (reset) begin
      regCtrAddrRead <= 64'h0;
    end else begin
      if (_T_187) begin
        if (io_s0_readAddr_valid) begin
          regCtrAddrRead <= io_s0_readAddr_bits_addr;
        end
      end
    end
    if (reset) begin
      value <= 5'h0;
    end else begin
      if (_T_240) begin
        if (_T_230) begin
          value <= 5'h0;
        end else begin
          value <= _T_233;
        end
      end else begin
        if (_T_228) begin
          if (_T_230) begin
            value <= 5'h0;
          end else begin
            value <= _T_233;
          end
        end
      end
    end
    if (reset) begin
      regFlagStart <= 1'h0;
    end else begin
      if (_T_228) begin
        regFlagStart <= 1'h1;
      end
    end
  end
endmodule
