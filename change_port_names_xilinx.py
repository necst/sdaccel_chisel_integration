import os
import sys

variables_name = {
 "io_m0_writeAddr_ready" : "m_axi_gmem_AWREADY",
 "io_m0_writeAddr_valid" : "m_axi_gmem_AWVALID",
 "io_m0_writeAddr_bits_addr" : "m_axi_gmem_AWADDR",
 "io_m0_writeAddr_bits_size" : "m_axi_gmem_AWSIZE",
 "io_m0_writeAddr_bits_len" : "m_axi_gmem_AWLEN",
 "io_m0_writeAddr_bits_burst" : "m_axi_gmem_AWBURST",
 "io_m0_writeAddr_bits_id" : "m_axi_gmem_AWID", 
 "io_m0_writeAddr_bits_lock" : "m_axi_gmem_AWLOCK",
 "io_m0_writeAddr_bits_cache" : "m_axi_gmem_AWCACHE",
 "io_m0_writeAddr_bits_prot" : "m_axi_gmem_AWPROT",
 "io_m0_writeAddr_bits_qos" : "m_axi_gmem_AWQOS",

 "io_m0_writeData_ready" : "m_axi_gmem_WREADY",
 "io_m0_writeData_valid" : "m_axi_gmem_WVALID",
 "io_m0_writeData_bits_data" : "m_axi_gmem_WDATA",
 "io_m0_writeData_bits_strb" : "m_axi_gmem_WSTRB",
 "io_m0_writeData_bits_last" : "m_axi_gmem_WLAST",

 "io_m0_writeResp_ready" : "m_axi_gmem_BREADY",
 "io_m0_writeResp_valid" : "m_axi_gmem_BVALID",
 "io_m0_writeResp_bits_id" : "m_axi_gmem_BID",
 "io_m0_writeResp_bits_resp" : "m_axi_gmem_BRESP",

 "io_m0_readAddr_ready" : "m_axi_gmem_ARREADY",
 "io_m0_readAddr_valid" : "m_axi_gmem_ARVALID",
 "io_m0_readAddr_bits_addr" : "m_axi_gmem_ARADDR",
 "io_m0_readAddr_bits_size" : "m_axi_gmem_ARSIZE",
 "io_m0_readAddr_bits_len" : "m_axi_gmem_ARLEN",
 "io_m0_readAddr_bits_burst" : "m_axi_gmem_ARBURST",
 "io_m0_readAddr_bits_id" : "m_axi_gmem_ARID",
 "io_m0_readAddr_bits_lock" : "m_axi_gmem_ARLOCK",
 "io_m0_readAddr_bits_cache" : "m_axi_gmem_ARCACHE",
 "io_m0_readAddr_bits_prot" : "m_axi_gmem_ARPROT",
 "io_m0_readAddr_bits_qos" : "m_axi_gmem_ARQOS",

 "io_m0_readData_ready" : "m_axi_gmem_RREADY",
 "io_m0_readData_valid" : "m_axi_gmem_RVALID",
 "io_m0_readData_bits_data" : "m_axi_gmem_RDATA",
 "io_m0_readData_bits_id" : "m_axi_gmem_RID", 
 "io_m0_readData_bits_last" : "m_axi_gmem_RLAST",
 "io_m0_readData_bits_resp" : "m_axi_gmem_RRESP",

 "io_s0_writeAddr_ready" : "S_AXI_CONTROL_AWREADY",
 "io_s0_writeAddr_valid" : "S_AXI_CONTROL_AWVALID",
 "io_s0_writeAddr_bits_addr" : "S_AXI_CONTROL_AWADDR",
 "io_s0_writeAddr_bits_prot" : "S_AXI_CONTROL_AWPROT",

 "io_s0_writeData_ready" : "S_AXI_CONTROL_WREADY",
 "io_s0_writeData_valid" : "S_AXI_CONTROL_WVALID",
 "io_s0_writeData_bits_data" : "S_AXI_CONTROL_WDATA",
 "io_s0_writeData_bits_strb" : "S_AXI_CONTROL_WSTRB",

 "io_s0_writeResp_ready" : "S_AXI_CONTROL_BREADY",
 "io_s0_writeResp_valid" : "S_AXI_CONTROL_BVALID",
 "io_s0_writeResp_bits" : "S_AXI_CONTROL_BRESP",

 "io_s0_readAddr_ready" : "S_AXI_CONTROL_ARREADY",
 "io_s0_readAddr_valid" : "S_AXI_CONTROL_ARVALID",
 "io_s0_readAddr_bits_addr" : "S_AXI_CONTROL_ARADDR",
 "io_s0_readAddr_bits_prot" : "S_AXI_CONTROL_ARPROT",

 "io_s0_readData_ready" : "S_AXI_CONTROL_RREADY",
 "io_s0_readData_valid" : "S_AXI_CONTROL_RVALID",
 "io_s0_readData_bits_data" : "S_AXI_CONTROL_RDATA",
 "io_s0_readData_bits_resp" : "S_AXI_CONTROL_RRESP",
 "clock": "ap_clk",
 "(reset)": "(!ap_rst_n)", 
 " reset": " ap_rst_n"
 
 }


or_file = open(sys.argv[1], "r")
dest_file = open(sys.argv[2], "w")

# print or_file.read()

lines = or_file.readlines()

#computationally sucks
for line in lines:
	keys_found = []
	for key in variables_name.keys():
		if key in line:
			keys_found.append(key)
	newline = line
	for key in keys_found:
		newline = newline.replace(key, variables_name[key])

	dest_file.write(newline)

dest_file.close()
or_file.close()
