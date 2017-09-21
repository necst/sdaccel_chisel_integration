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
  wire [1:0] _GEN_24;
  wire [31:0] _GEN_25;
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
  assign S_AXI_CONTROL_AWREADY = _GEN_6;
  assign S_AXI_CONTROL_WREADY = _GEN_10;
  assign S_AXI_CONTROL_BVALID = _T_122;
  assign S_AXI_CONTROL_BRESP = 2'h0;
  assign S_AXI_CONTROL_ARREADY = _GEN_21;
  assign S_AXI_CONTROL_RVALID = _T_186;
  assign S_AXI_CONTROL_RDATA = rdata;
  assign S_AXI_CONTROL_RRESP = 2'h0;
  assign _T_107 = stateSlaveWrite == 3'h0;
  assign _GEN_1 = S_AXI_CONTROL_AWVALID ? 3'h1 : stateSlaveWrite;
  assign _GEN_4 = _T_107 ? _GEN_1 : stateSlaveWrite;
  assign _T_110 = stateSlaveWrite == 3'h1;
  assign _T_112 = _T_107 == 1'h0;
  assign _T_113 = _T_112 & _T_110;
  assign _GEN_5 = S_AXI_CONTROL_WVALID ? 3'h3 : _GEN_4;
  assign _GEN_6 = _T_113 ? 1'h0 : 1'h1;
  assign _GEN_8 = _T_113 ? _GEN_5 : _GEN_4;
  assign _T_116 = stateSlaveWrite == 3'h3;
  assign _T_120 = _T_110 == 1'h0;
  assign _T_121 = _T_112 & _T_120;
  assign _T_122 = _T_121 & _T_116;
  assign _GEN_9 = S_AXI_CONTROL_BREADY ? 3'h0 : _GEN_8;
  assign _GEN_10 = _T_122 ? 1'h0 : 1'h1;
  assign _GEN_13 = _T_122 ? _GEN_9 : _GEN_8;
  assign _T_179 = S_AXI_CONTROL_ARVALID & S_AXI_CONTROL_ARREADY;
  assign _T_180 = stateSlaveRead == 3'h0;
  assign _GEN_15 = S_AXI_CONTROL_ARVALID ? 3'h2 : stateSlaveRead;
  assign _GEN_19 = _T_180 ? _GEN_15 : stateSlaveRead;
  assign _T_183 = stateSlaveRead == 3'h2;
  assign _T_185 = _T_180 == 1'h0;
  assign _T_186 = _T_185 & _T_183;
  assign _GEN_20 = S_AXI_CONTROL_RREADY ? 3'h7 : _GEN_19;
  assign _GEN_21 = _T_186 ? 1'h0 : 1'h1;
  assign _GEN_23 = _T_186 ? _GEN_20 : _GEN_19;
  assign _T_191 = raddr == 6'h0;
  assign _GEN_24 = _T_191 ? 2'h2 : 2'h0;
  assign _GEN_25 = addrrd_handshake ? {{30'd0}, _GEN_24} : rdata;
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
  always @(posedge ap_clk) begin
    if (ap_rst_n) begin
      stateSlaveWrite <= 3'h0;
    end else begin
      if (_T_122) begin
        if (S_AXI_CONTROL_BREADY) begin
          stateSlaveWrite <= 3'h0;
        end else begin
          if (_T_113) begin
            if (S_AXI_CONTROL_WVALID) begin
              stateSlaveWrite <= 3'h3;
            end else begin
              if (_T_107) begin
                if (S_AXI_CONTROL_AWVALID) begin
                  stateSlaveWrite <= 3'h1;
                end
              end
            end
          end else begin
            if (_T_107) begin
              if (S_AXI_CONTROL_AWVALID) begin
                stateSlaveWrite <= 3'h1;
              end
            end
          end
        end
      end else begin
        if (_T_113) begin
          if (S_AXI_CONTROL_WVALID) begin
            stateSlaveWrite <= 3'h3;
          end else begin
            if (_T_107) begin
              if (S_AXI_CONTROL_AWVALID) begin
                stateSlaveWrite <= 3'h1;
              end
            end
          end
        end else begin
          if (_T_107) begin
            if (S_AXI_CONTROL_AWVALID) begin
              stateSlaveWrite <= 3'h1;
            end
          end
        end
      end
    end
    if (ap_rst_n) begin
      stateSlaveRead <= 3'h0;
    end else begin
      if (_T_186) begin
        if (S_AXI_CONTROL_RREADY) begin
          stateSlaveRead <= 3'h7;
        end else begin
          if (_T_180) begin
            if (S_AXI_CONTROL_ARVALID) begin
              stateSlaveRead <= 3'h2;
            end
          end
        end
      end else begin
        if (_T_180) begin
          if (S_AXI_CONTROL_ARVALID) begin
            stateSlaveRead <= 3'h2;
          end
        end
      end
    end
    if (ap_rst_n) begin
      addrrd_handshake <= 1'h0;
    end else begin
      addrrd_handshake <= _T_179;
    end
    if (ap_rst_n) begin
      rdata <= 32'h0;
    end else begin
      if (addrrd_handshake) begin
        rdata <= {{30'd0}, _GEN_24};
      end
    end
    if (ap_rst_n) begin
      raddr <= 6'h0;
    end else begin
      raddr <= S_AXI_CONTROL_ARADDR[5:0];
    end
  end
endmodule
