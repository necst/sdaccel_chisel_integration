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
  reg [2:0] stateSlaveWrite;
  reg [31:0] _RAND_0;
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
  wire  _GEN_10;
  wire [2:0] _GEN_13;
  reg [2:0] stateSlaveRead;
  reg [31:0] _RAND_1;
  reg  addrrd_handshake;
  reg [31:0] _RAND_2;
  reg [31:0] rdata;
  reg [31:0] _RAND_3;
  reg [5:0] raddr;
  reg [31:0] _RAND_4;
  wire  _T_179;
  wire  _T_180;
  wire [2:0] _GEN_15;
  wire [2:0] _GEN_19;
  wire  _T_183;
  wire  _T_185;
  wire  _T_186;
  wire [2:0] _GEN_20;
  wire  _GEN_21;
  wire [2:0] _GEN_23;
  wire  _T_191;
  wire [31:0] _GEN_25;
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
  assign io_s0_writeData_ready = _GEN_10;
  assign io_s0_writeResp_valid = _T_122;
  assign io_s0_writeResp_bits = 2'h0;
  assign io_s0_readAddr_ready = _GEN_21;
  assign io_s0_readData_valid = _T_186;
  assign io_s0_readData_bits_data = rdata;
  assign io_s0_readData_bits_resp = 2'h0;
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
  assign _GEN_10 = _T_122 ? 1'h0 : 1'h1;
  assign _GEN_13 = _T_122 ? _GEN_9 : _GEN_8;
  assign _T_179 = io_s0_readAddr_valid & io_s0_readAddr_ready;
  assign _T_180 = stateSlaveRead == 3'h0;
  assign _GEN_15 = io_s0_readAddr_valid ? 3'h2 : stateSlaveRead;
  assign _GEN_19 = _T_180 ? _GEN_15 : stateSlaveRead;
  assign _T_183 = stateSlaveRead == 3'h2;
  assign _T_185 = _T_180 == 1'h0;
  assign _T_186 = _T_185 & _T_183;
  assign _GEN_20 = io_s0_readData_ready ? 3'h7 : _GEN_19;
  assign _GEN_21 = _T_186 ? 1'h0 : 1'h1;
  assign _GEN_23 = _T_186 ? _GEN_20 : _GEN_19;
  assign _T_191 = raddr == 6'h0;
  assign _GEN_25 = addrrd_handshake ? {{31'd0}, _T_191} : rdata;
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{$random}};
  stateSlaveWrite = _RAND_0[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{$random}};
  stateSlaveRead = _RAND_1[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{$random}};
  addrrd_handshake = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{$random}};
  rdata = _RAND_3[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{$random}};
  raddr = _RAND_4[5:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      stateSlaveWrite <= 3'h0;
    end else begin
      if (_T_122) begin
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
      stateSlaveRead <= 3'h0;
    end else begin
      if (_T_186) begin
        if (io_s0_readData_ready) begin
          stateSlaveRead <= 3'h7;
        end else begin
          if (_T_180) begin
            if (io_s0_readAddr_valid) begin
              stateSlaveRead <= 3'h2;
            end
          end
        end
      end else begin
        if (_T_180) begin
          if (io_s0_readAddr_valid) begin
            stateSlaveRead <= 3'h2;
          end
        end
      end
    end
    if (reset) begin
      addrrd_handshake <= 1'h0;
    end else begin
      addrrd_handshake <= _T_179;
    end
    if (reset) begin
      rdata <= 32'h0;
    end else begin
      if (addrrd_handshake) begin
        rdata <= {{31'd0}, _T_191};
      end
    end
    if (reset) begin
      raddr <= 6'h0;
    end else begin
      raddr <= io_s0_readAddr_bits_addr[5:0];
    end
  end
endmodule
