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
  reg [31:0] regDataReceived;
  reg [31:0] _RAND_2;
  reg [2:0] stateSlaveWrite;
  reg [31:0] _RAND_3;
  wire  _T_102;
  wire [2:0] _GEN_1;
  wire [2:0] _GEN_3;
  wire  _T_103;
  wire  _T_105;
  wire  _T_106;
  wire [31:0] _GEN_4;
  wire  _GEN_5;
  wire [2:0] _GEN_6;
  wire [31:0] _GEN_8;
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
  wire [1:0] _GEN_36;
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
  wire  _T_206;
  wire  _T_207;
  wire  _T_209;
  wire [5:0] _T_211;
  wire [4:0] _T_212;
  wire [4:0] _GEN_30;
  wire [4:0] _GEN_31;
  wire  _GEN_32;
  wire  _T_216;
  wire  _T_218;
  wire  _T_219;
  wire [4:0] _GEN_34;
  wire  _T_227;
  wire  _T_229;
  wire  _T_230;
  wire  _GEN_35;
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
  assign _GEN_4 = io_s0_writeData_valid ? io_s0_writeData_bits_data : regDataReceived;
  assign _GEN_5 = io_s0_writeData_valid ? 1'h0 : regDone;
  assign _GEN_6 = io_s0_writeData_valid ? 3'h3 : _GEN_3;
  assign _GEN_8 = _T_106 ? _GEN_4 : regDataReceived;
  assign _GEN_9 = _T_106 ? _GEN_5 : regDone;
  assign _GEN_10 = _T_106 ? _GEN_6 : _GEN_3;
  assign _T_109 = stateSlaveWrite == 3'h3;
  assign _T_113 = _T_103 == 1'h0;
  assign _T_114 = _T_105 & _T_113;
  assign _T_115 = _T_114 & _T_109;
  assign _GEN_11 = io_s0_writeResp_ready ? 3'h4 : _GEN_10;
  assign _GEN_15 = _T_115 ? _GEN_11 : _GEN_10;
  assign _T_163 = stateSlaveWrite == 3'h4;
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
  assign _GEN_36 = {{1'd0}, regDone};
  assign _T_189 = _GEN_36 << 1'h1;
  assign _GEN_24 = io_s0_readData_ready ? 3'h4 : _GEN_23;
  assign _GEN_27 = _T_187 ? _GEN_24 : _GEN_23;
  assign _T_191 = stateSlaveRead == 3'h4;
  assign _T_195 = _T_184 == 1'h0;
  assign _T_196 = _T_186 & _T_195;
  assign _T_197 = _T_196 & _T_191;
  assign _GEN_28 = _T_197 ? 1'h0 : 1'h1;
  assign _GEN_29 = _T_197 ? 3'h0 : _GEN_27;
  assign _T_206 = regFlagStart == 1'h0;
  assign _T_207 = regStart & _T_206;
  assign _T_209 = value == 5'h1d;
  assign _T_211 = value + 5'h1;
  assign _T_212 = _T_211[4:0];
  assign _GEN_30 = _T_209 ? 5'h0 : _T_212;
  assign _GEN_31 = _T_207 ? _GEN_30 : value;
  assign _GEN_32 = _T_207 ? 1'h1 : regFlagStart;
  assign _T_216 = value > 5'h0;
  assign _T_218 = value < 5'h19;
  assign _T_219 = _T_216 & _T_218;
  assign _GEN_34 = _T_219 ? _GEN_30 : _GEN_31;
  assign _T_227 = value >= 5'h19;
  assign _T_229 = _T_219 == 1'h0;
  assign _T_230 = _T_229 & _T_227;
  assign _GEN_35 = _T_230 ? 1'h1 : _GEN_9;
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
  regDataReceived = _RAND_2[31:0];
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
      if (_T_230) begin
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
      regDataReceived <= 32'h0;
    end else begin
      if (_T_106) begin
        if (io_s0_writeData_valid) begin
          regDataReceived <= io_s0_writeData_bits_data;
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
            stateSlaveWrite <= 3'h4;
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
            stateSlaveRead <= 3'h4;
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
      if (_T_219) begin
        if (_T_209) begin
          value <= 5'h0;
        end else begin
          value <= _T_212;
        end
      end else begin
        if (_T_207) begin
          if (_T_209) begin
            value <= 5'h0;
          end else begin
            value <= _T_212;
          end
        end
      end
    end
    if (reset) begin
      regFlagStart <= 1'h0;
    end else begin
      if (_T_207) begin
        regFlagStart <= 1'h1;
      end
    end
  end
endmodule
