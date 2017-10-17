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

module AXILiteControl(
  input         clock,
  input         reset,
  output        io_slave_writeAddr_ready,
  input         io_slave_writeAddr_valid,
  input  [63:0] io_slave_writeAddr_bits_addr,
  output        io_slave_writeData_ready,
  input         io_slave_writeData_valid,
  input  [31:0] io_slave_writeData_bits_data,
  input  [3:0]  io_slave_writeData_bits_strb,
  input         io_slave_writeResp_ready,
  output        io_slave_writeResp_valid,
  output        io_slave_readAddr_ready,
  input         io_slave_readAddr_valid,
  input  [63:0] io_slave_readAddr_bits_addr,
  input         io_slave_readData_ready,
  output        io_slave_readData_valid,
  output [31:0] io_slave_readData_bits_data,
  output        io_ap_start,
  input         io_ap_done
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
  wire  _T_48;
  wire  ap_start_pulse;
  wire  _GEN_0;
  wire  _T_51;
  wire  _T_52;
  wire  _GEN_1;
  wire  _T_57;
  wire  _T_58;
  wire  _GEN_2;
  reg [2:0] stateSlaveWrite;
  reg [31:0] _RAND_5;
  reg [5:0] writeAddr;
  reg [31:0] _RAND_6;
  reg [2:0] stateSlaveRead;
  reg [31:0] _RAND_7;
  reg [31:0] readData;
  reg [31:0] _RAND_8;
  wire  _T_67;
  wire  _T_68;
  wire  _T_69;
  wire  _T_70;
  wire  _T_116;
  wire  addrwr_handshake;
  wire  write_handshake;
  wire [63:0] _GEN_3;
  wire [2:0] _GEN_4;
  wire  _T_119;
  wire [2:0] _GEN_5;
  wire [2:0] _GEN_6;
  wire  _T_122;
  wire  _T_123;
  wire [2:0] _GEN_7;
  wire  _T_125;
  wire [2:0] _GEN_8;
  wire [2:0] _GEN_9;
  wire  _T_130;
  wire  _T_131;
  wire  _T_132;
  wire [2:0] _GEN_10;
  wire  _T_134;
  wire [2:0] _GEN_11;
  wire [2:0] _GEN_12;
  wire  _T_141;
  wire  _T_142;
  wire [2:0] _GEN_13;
  wire  _T_145;
  wire  _T_146;
  wire  _T_147;
  wire  addrrd_handshake;
  wire [2:0] _GEN_14;
  wire  _T_150;
  wire [2:0] _GEN_15;
  wire [2:0] _GEN_16;
  wire  _T_153;
  wire  _T_154;
  wire  _T_155;
  wire [2:0] _GEN_17;
  wire  _T_157;
  wire [2:0] _GEN_18;
  wire [2:0] _GEN_19;
  wire  _T_161;
  wire  _T_162;
  wire [2:0] _GEN_20;
  wire  _T_164;
  wire [1:0] _GEN_27;
  wire [1:0] _T_165;
  wire [1:0] _GEN_28;
  wire [1:0] _T_166;
  wire [2:0] _GEN_29;
  wire [2:0] _T_167;
  wire [2:0] _GEN_30;
  wire [2:0] _T_168;
  wire [3:0] _GEN_31;
  wire [3:0] _T_169;
  wire [3:0] _GEN_32;
  wire [3:0] _T_170;
  wire [7:0] _GEN_33;
  wire [7:0] _T_171;
  wire [7:0] _GEN_34;
  wire [7:0] _T_172;
  wire [31:0] _GEN_21;
  wire [31:0] _GEN_22;
  wire  _T_174;
  wire  _T_175;
  wire  _T_176;
  wire  _T_177;
  wire  _T_178;
  wire  _T_179;
  wire  _GEN_23;
  wire  _T_182;
  wire  _T_183;
  wire  _GEN_24;
  wire  _T_186;
  wire  _GEN_25;
  wire  _T_193;
  wire  _GEN_26;
  assign io_slave_writeAddr_ready = _T_69;
  assign io_slave_writeData_ready = _T_70;
  assign io_slave_writeResp_valid = _T_116;
  assign io_slave_readAddr_ready = _T_146;
  assign io_slave_readData_valid = _T_147;
  assign io_slave_readData_bits_data = readData;
  assign io_ap_start = ap_start;
  assign _T_48 = ap_start_r == 1'h0;
  assign ap_start_pulse = ap_start & _T_48;
  assign _GEN_0 = ap_done ? 1'h1 : ap_idle;
  assign _T_51 = ap_done == 1'h0;
  assign _T_52 = _T_51 & ap_start_pulse;
  assign _GEN_1 = _T_52 ? 1'h0 : _GEN_0;
  assign _T_57 = ap_start_pulse == 1'h0;
  assign _T_58 = _T_51 & _T_57;
  assign _GEN_2 = _T_58 ? ap_idle : _GEN_1;
  assign _T_67 = reset == 1'h0;
  assign _T_68 = stateSlaveWrite == 3'h0;
  assign _T_69 = _T_67 & _T_68;
  assign _T_70 = stateSlaveWrite == 3'h1;
  assign _T_116 = stateSlaveWrite == 3'h2;
  assign addrwr_handshake = io_slave_writeAddr_valid & io_slave_writeAddr_ready;
  assign write_handshake = io_slave_writeData_valid & io_slave_writeData_ready;
  assign _GEN_3 = addrwr_handshake ? io_slave_writeAddr_bits_addr : {{58'd0}, writeAddr};
  assign _GEN_4 = io_slave_writeAddr_valid ? 3'h1 : stateSlaveWrite;
  assign _T_119 = io_slave_writeAddr_valid == 1'h0;
  assign _GEN_5 = _T_119 ? 3'h0 : _GEN_4;
  assign _GEN_6 = _T_68 ? _GEN_5 : stateSlaveWrite;
  assign _T_122 = _T_68 == 1'h0;
  assign _T_123 = _T_122 & _T_70;
  assign _GEN_7 = io_slave_writeData_valid ? 3'h2 : _GEN_6;
  assign _T_125 = io_slave_writeData_valid == 1'h0;
  assign _GEN_8 = _T_125 ? 3'h1 : _GEN_7;
  assign _GEN_9 = _T_123 ? _GEN_8 : _GEN_6;
  assign _T_130 = _T_70 == 1'h0;
  assign _T_131 = _T_122 & _T_130;
  assign _T_132 = _T_131 & _T_116;
  assign _GEN_10 = io_slave_writeResp_ready ? 3'h0 : _GEN_9;
  assign _T_134 = io_slave_writeResp_ready == 1'h0;
  assign _GEN_11 = _T_134 ? 3'h2 : _GEN_10;
  assign _GEN_12 = _T_132 ? _GEN_11 : _GEN_9;
  assign _T_141 = _T_116 == 1'h0;
  assign _T_142 = _T_131 & _T_141;
  assign _GEN_13 = _T_142 ? 3'h0 : _GEN_12;
  assign _T_145 = stateSlaveRead == 3'h0;
  assign _T_146 = _T_67 & _T_145;
  assign _T_147 = stateSlaveRead == 3'h3;
  assign addrrd_handshake = io_slave_readAddr_valid & io_slave_readAddr_ready;
  assign _GEN_14 = io_slave_readAddr_valid ? 3'h3 : stateSlaveRead;
  assign _T_150 = io_slave_readAddr_valid == 1'h0;
  assign _GEN_15 = _T_150 ? 3'h0 : _GEN_14;
  assign _GEN_16 = _T_145 ? _GEN_15 : stateSlaveRead;
  assign _T_153 = _T_145 == 1'h0;
  assign _T_154 = _T_153 & _T_147;
  assign _T_155 = io_slave_readData_valid & io_slave_readData_ready;
  assign _GEN_17 = _T_155 ? 3'h0 : _GEN_16;
  assign _T_157 = _T_155 == 1'h0;
  assign _GEN_18 = _T_157 ? 3'h3 : _GEN_17;
  assign _GEN_19 = _T_154 ? _GEN_18 : _GEN_16;
  assign _T_161 = _T_147 == 1'h0;
  assign _T_162 = _T_153 & _T_161;
  assign _GEN_20 = _T_162 ? 3'h0 : _GEN_19;
  assign _T_164 = io_slave_readAddr_bits_addr == 64'h0;
  assign _GEN_27 = {{1'd0}, ap_done};
  assign _T_165 = _GEN_27 << 1;
  assign _GEN_28 = {{1'd0}, ap_start};
  assign _T_166 = _GEN_28 | _T_165;
  assign _GEN_29 = {{2'd0}, ap_idle};
  assign _T_167 = _GEN_29 << 2;
  assign _GEN_30 = {{1'd0}, _T_166};
  assign _T_168 = _GEN_30 | _T_167;
  assign _GEN_31 = {{3'd0}, ap_done};
  assign _T_169 = _GEN_31 << 3;
  assign _GEN_32 = {{1'd0}, _T_168};
  assign _T_170 = _GEN_32 | _T_169;
  assign _GEN_33 = {{7'd0}, auto_restart};
  assign _T_171 = _GEN_33 << 7;
  assign _GEN_34 = {{4'd0}, _T_170};
  assign _T_172 = _GEN_34 | _T_171;
  assign _GEN_21 = _T_164 ? {{24'd0}, _T_172} : readData;
  assign _GEN_22 = addrrd_handshake ? _GEN_21 : readData;
  assign _T_174 = writeAddr == 6'h0;
  assign _T_175 = write_handshake & _T_174;
  assign _T_176 = io_slave_writeData_bits_strb[0];
  assign _T_177 = _T_175 & _T_176;
  assign _T_178 = io_slave_writeData_bits_data[0];
  assign _T_179 = _T_177 & _T_178;
  assign _GEN_23 = _T_179 ? 1'h1 : ap_start;
  assign _T_182 = _T_179 == 1'h0;
  assign _T_183 = _T_182 & ap_done;
  assign _GEN_24 = _T_183 ? auto_restart : _GEN_23;
  assign _T_186 = addrrd_handshake & _T_164;
  assign _GEN_25 = _T_186 ? 1'h0 : io_ap_done;
  assign _T_193 = io_slave_writeData_bits_data[7];
  assign _GEN_26 = _T_177 ? _T_193 : auto_restart;
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
      if (_T_183) begin
        ap_start <= auto_restart;
      end else begin
        if (_T_179) begin
          ap_start <= 1'h1;
        end
      end
    end
    if (reset) begin
      auto_restart <= 1'h0;
    end else begin
      if (_T_177) begin
        auto_restart <= _T_193;
      end
    end
    if (reset) begin
      ap_idle <= 1'h1;
    end else begin
      if (!(_T_58)) begin
        if (_T_52) begin
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
      if (_T_186) begin
        ap_done <= 1'h0;
      end else begin
        ap_done <= io_ap_done;
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
      if (_T_142) begin
        stateSlaveWrite <= 3'h0;
      end else begin
        if (_T_132) begin
          if (_T_134) begin
            stateSlaveWrite <= 3'h2;
          end else begin
            if (io_slave_writeResp_ready) begin
              stateSlaveWrite <= 3'h0;
            end else begin
              if (_T_123) begin
                if (_T_125) begin
                  stateSlaveWrite <= 3'h1;
                end else begin
                  if (io_slave_writeData_valid) begin
                    stateSlaveWrite <= 3'h2;
                  end else begin
                    if (_T_68) begin
                      if (_T_119) begin
                        stateSlaveWrite <= 3'h0;
                      end else begin
                        if (io_slave_writeAddr_valid) begin
                          stateSlaveWrite <= 3'h1;
                        end
                      end
                    end
                  end
                end
              end else begin
                if (_T_68) begin
                  if (_T_119) begin
                    stateSlaveWrite <= 3'h0;
                  end else begin
                    if (io_slave_writeAddr_valid) begin
                      stateSlaveWrite <= 3'h1;
                    end
                  end
                end
              end
            end
          end
        end else begin
          if (_T_123) begin
            if (_T_125) begin
              stateSlaveWrite <= 3'h1;
            end else begin
              if (io_slave_writeData_valid) begin
                stateSlaveWrite <= 3'h2;
              end else begin
                if (_T_68) begin
                  if (_T_119) begin
                    stateSlaveWrite <= 3'h0;
                  end else begin
                    if (io_slave_writeAddr_valid) begin
                      stateSlaveWrite <= 3'h1;
                    end
                  end
                end
              end
            end
          end else begin
            if (_T_68) begin
              if (_T_119) begin
                stateSlaveWrite <= 3'h0;
              end else begin
                if (io_slave_writeAddr_valid) begin
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
      if (_T_162) begin
        stateSlaveRead <= 3'h0;
      end else begin
        if (_T_154) begin
          if (_T_157) begin
            stateSlaveRead <= 3'h3;
          end else begin
            if (_T_155) begin
              stateSlaveRead <= 3'h0;
            end else begin
              if (_T_145) begin
                if (_T_150) begin
                  stateSlaveRead <= 3'h0;
                end else begin
                  if (io_slave_readAddr_valid) begin
                    stateSlaveRead <= 3'h3;
                  end
                end
              end
            end
          end
        end else begin
          if (_T_145) begin
            if (_T_150) begin
              stateSlaveRead <= 3'h0;
            end else begin
              if (io_slave_readAddr_valid) begin
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
        if (_T_164) begin
          readData <= {{24'd0}, _T_172};
        end
      end
    end
  end
endmodule
module MyKernel(
  input   clock,
  input   reset,
  input   io_ap_start,
  output  io_ap_done
);
  reg [4:0] value;
  reg [31:0] _RAND_0;
  reg  regFlagStart;
  reg [31:0] _RAND_1;
  reg  doneReg;
  reg [31:0] _RAND_2;
  wire  _T_18;
  wire  _T_19;
  wire  _T_21;
  wire [5:0] _T_23;
  wire [4:0] _T_24;
  wire [4:0] _GEN_0;
  wire [4:0] _GEN_1;
  wire  _GEN_2;
  wire  _T_28;
  wire  _GEN_3;
  assign io_ap_done = doneReg;
  assign _T_18 = regFlagStart == 1'h0;
  assign _T_19 = io_ap_start & _T_18;
  assign _T_21 = value == 5'h1d;
  assign _T_23 = value + 5'h1;
  assign _T_24 = _T_23[4:0];
  assign _GEN_0 = _T_21 ? 5'h0 : _T_24;
  assign _GEN_1 = _T_19 ? _GEN_0 : value;
  assign _GEN_2 = _T_19 ? 1'h1 : regFlagStart;
  assign _T_28 = value > 5'h0;
  assign _GEN_3 = _T_28 ? 1'h1 : doneReg;
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{$random}};
  value = _RAND_0[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{$random}};
  regFlagStart = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{$random}};
  doneReg = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      value <= 5'h0;
    end else begin
      if (_T_19) begin
        if (_T_21) begin
          value <= 5'h0;
        end else begin
          value <= _T_24;
        end
      end
    end
    if (reset) begin
      regFlagStart <= 1'h0;
    end else begin
      if (_T_19) begin
        regFlagStart <= 1'h1;
      end
    end
    if (reset) begin
      doneReg <= 1'h0;
    end else begin
      if (_T_28) begin
        doneReg <= 1'h1;
      end
    end
  end
endmodule
module SDAChiselWrapper(
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
  wire  slave_fsm_clock;
  wire  slave_fsm_reset;
  wire  slave_fsm_io_slave_writeAddr_ready;
  wire  slave_fsm_io_slave_writeAddr_valid;
  wire [63:0] slave_fsm_io_slave_writeAddr_bits_addr;
  wire  slave_fsm_io_slave_writeData_ready;
  wire  slave_fsm_io_slave_writeData_valid;
  wire [31:0] slave_fsm_io_slave_writeData_bits_data;
  wire [3:0] slave_fsm_io_slave_writeData_bits_strb;
  wire  slave_fsm_io_slave_writeResp_ready;
  wire  slave_fsm_io_slave_writeResp_valid;
  wire  slave_fsm_io_slave_readAddr_ready;
  wire  slave_fsm_io_slave_readAddr_valid;
  wire [63:0] slave_fsm_io_slave_readAddr_bits_addr;
  wire  slave_fsm_io_slave_readData_ready;
  wire  slave_fsm_io_slave_readData_valid;
  wire [31:0] slave_fsm_io_slave_readData_bits_data;
  wire  slave_fsm_io_ap_start;
  wire  slave_fsm_io_ap_done;
  wire  RTLKernel_clock;
  wire  RTLKernel_reset;
  wire  RTLKernel_io_ap_start;
  wire  RTLKernel_io_ap_done;
  wire  _T_88;
  AXILiteControl slave_fsm (
    .clock(slave_fsm_clock),
    .reset(slave_fsm_reset),
    .io_slave_writeAddr_ready(slave_fsm_io_slave_writeAddr_ready),
    .io_slave_writeAddr_valid(slave_fsm_io_slave_writeAddr_valid),
    .io_slave_writeAddr_bits_addr(slave_fsm_io_slave_writeAddr_bits_addr),
    .io_slave_writeData_ready(slave_fsm_io_slave_writeData_ready),
    .io_slave_writeData_valid(slave_fsm_io_slave_writeData_valid),
    .io_slave_writeData_bits_data(slave_fsm_io_slave_writeData_bits_data),
    .io_slave_writeData_bits_strb(slave_fsm_io_slave_writeData_bits_strb),
    .io_slave_writeResp_ready(slave_fsm_io_slave_writeResp_ready),
    .io_slave_writeResp_valid(slave_fsm_io_slave_writeResp_valid),
    .io_slave_readAddr_ready(slave_fsm_io_slave_readAddr_ready),
    .io_slave_readAddr_valid(slave_fsm_io_slave_readAddr_valid),
    .io_slave_readAddr_bits_addr(slave_fsm_io_slave_readAddr_bits_addr),
    .io_slave_readData_ready(slave_fsm_io_slave_readData_ready),
    .io_slave_readData_valid(slave_fsm_io_slave_readData_valid),
    .io_slave_readData_bits_data(slave_fsm_io_slave_readData_bits_data),
    .io_ap_start(slave_fsm_io_ap_start),
    .io_ap_done(slave_fsm_io_ap_done)
  );
  MyKernel RTLKernel (
    .clock(RTLKernel_clock),
    .reset(RTLKernel_reset),
    .io_ap_start(RTLKernel_io_ap_start),
    .io_ap_done(RTLKernel_io_ap_done)
  );
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
  assign io_s0_writeAddr_ready = slave_fsm_io_slave_writeAddr_ready;
  assign io_s0_writeData_ready = slave_fsm_io_slave_writeData_ready;
  assign io_s0_writeResp_valid = slave_fsm_io_slave_writeResp_valid;
  assign io_s0_writeResp_bits = 2'h0;
  assign io_s0_readAddr_ready = slave_fsm_io_slave_readAddr_ready;
  assign io_s0_readData_valid = slave_fsm_io_slave_readData_valid;
  assign io_s0_readData_bits_data = slave_fsm_io_slave_readData_bits_data;
  assign io_s0_readData_bits_resp = 2'h0;
  assign slave_fsm_clock = clock;
  assign slave_fsm_reset = _T_88;
  assign slave_fsm_io_slave_writeAddr_valid = io_s0_writeAddr_valid;
  assign slave_fsm_io_slave_writeAddr_bits_addr = io_s0_writeAddr_bits_addr;
  assign slave_fsm_io_slave_writeData_valid = io_s0_writeData_valid;
  assign slave_fsm_io_slave_writeData_bits_data = io_s0_writeData_bits_data;
  assign slave_fsm_io_slave_writeData_bits_strb = io_s0_writeData_bits_strb;
  assign slave_fsm_io_slave_writeResp_ready = io_s0_writeResp_ready;
  assign slave_fsm_io_slave_readAddr_valid = io_s0_readAddr_valid;
  assign slave_fsm_io_slave_readAddr_bits_addr = io_s0_readAddr_bits_addr;
  assign slave_fsm_io_slave_readData_ready = slave_fsm_io_slave_readData_ready;
  assign slave_fsm_io_ap_done = RTLKernel_io_ap_done;
  assign RTLKernel_clock = clock;
  assign RTLKernel_reset = _T_88;
  assign RTLKernel_io_ap_start = slave_fsm_io_ap_start;
  assign _T_88 = reset == 1'h0;
endmodule