import os
import sys

variables_name = {
 "io_m0_writeAddr_ready" : "M_AXI_AWREADY",
 "io_m0_writeAddr_valid" : "M_AXI_AWVALID",
 "io_m0_writeAddr_bits_addr" : "M_AXI_AWADDR",
 "io_m0_writeAddr_bits_size" : "M_AXI_AWSIZE",
 "io_m0_writeAddr_bits_len" : "M_AXI_AWLEN",
 "io_m0_writeAddr_bits_burst" : "M_AXI_AWBURST",
 "io_m0_writeAddr_bits_id" : "M_AXI_AWID", 
 "io_m0_writeAddr_bits_lock" : "M_AXI_AWLOCK",
 "io_m0_writeAddr_bits_cache" : "M_AXI_AWCACHE",
 "io_m0_writeAddr_bits_prot" : "M_AXI_AWPROT",
 "io_m0_writeAddr_bits_qos" : "M_AXI_AWQOS",

 "io_m0_writeData_ready" : "M_AXI_WREADY",
 "io_m0_writeData_valid" : "M_AXI_WVALID",
 "io_m0_writeData_bits_data" : "M_AXI_WDATA",
 "io_m0_writeData_bits_strb" : "M_AXI_WSTRB",
 "io_m0_writeData_bits_last" : "M_AXI_WLAST",

 "io_m0_writeResp_ready" : "M_AXI_BREADY",
 "io_m0_writeResp_valid" : "M_AXI_BVALID",
 "io_m0_writeResp_bits_id" : "M_AXI_BID",
 "io_m0_writeResp_bits_resp" : "M_AXI_BRESP",

 "io_m0_readAddr_ready" : "M_AXI_ARREADY",
 "io_m0_readAddr_valid" : "M_AXI_ARVALID",
 "io_m0_readAddr_bits_addr" : "M_AXI_ARADDR",
 "io_m0_readAddr_bits_size" : "M_AXI_ARSIZE",
 "io_m0_readAddr_bits_len" : "M_AXI_ARLEN",
 "io_m0_readAddr_bits_burst" : "M_AXI_ARBURST",
 "io_m0_readAddr_bits_id" : "M_AXI_ARID",
 "io_m0_readAddr_bits_lock" : "M_AXI_ARLOCK",
 "io_m0_readAddr_bits_cache" : "M_AXI_ARCACHE",
 "io_m0_readAddr_bits_prot" : "M_AXI_ARPROT",
 "io_m0_readAddr_bits_qos" : "M_AXI_ARQOS",

 "io_m0_readData_ready" : "M_AXI_RREADY",
 "io_m0_readData_valid" : "M_AXI_RVALID",
 "io_m0_readData_bits_data" : "M_AXI_RDATA",
 "io_m0_readData_bits_id" : "M_AXI_RID", 
 "io_m0_readData_bits_last" : "M_AXI_RLAST",
 "io_m0_readData_bits_resp" : "M_AXI_RRESP",

 "io_s0_writeAddr_ready" : "S_AXI_AWREADY",
 "io_s0_writeAddr_valid" : "S_AXI_AWVALID",
 "io_s0_writeAddr_bits_addr" : "S_AXI_AWADDR",
 "io_s0_writeAddr_bits_prot" : "S_AXI_AWPROT",

 "io_s0_writeData_ready" : "S_AXI_WREADY",
 "io_s0_writeData_valid" : "S_AXI_WVALID",
 "io_s0_writeData_bits_data" : "S_AXI_WDATA",
 "io_s0_writeData_bits_strb" : "S_AXI_WSTRB",

 "io_s0_writeResp_ready" : "S_AXI_BREADY",
 "io_s0_writeResp_valid" : "S_AXI_BVALID",
 "io_s0_writeResp_bits" : "S_AXI_BRESP",

 "io_s0_readAddr_ready" : "S_AXI_ARREADY",
 "io_s0_readAddr_valid" : "S_AXI_ARVALID",
 "io_s0_readAddr_bits_addr" : "S_AXI_ARADDR",
 "io_s0_readAddr_bits_prot" : "S_AXI_ARPROT",

 "io_s0_readData_ready" : "S_AXI_RREADY",
 "io_s0_readData_valid" : "S_AXI_RVALID",
 "io_s0_readData_bits_data" : "S_AXI_RDATA",
 "io_s0_readData_bits_resp" : "S_AXI_RRESP",
 "clock": "ap_clk", 
 "reset": "ap_rst_n"
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
