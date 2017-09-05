import os
import sys

variables_name = {
 "io_m0_writeAddr_ready" : "M_AXI_AWREADY",
 "io_m0_writeAddr_valid" : "M_AXI_AWVALID",
 "io_m0_writeAddr_bits_addr" : "M_AXI_AWADDR",
 "io_m0_writeAddr_bits_size" : "M_AXI_AWSIZE",
 "io_m0_writeAddr_bits_len" : "M_AXI_AWLEN",
 "io_m0_writeAddr_bits_burst" : "c0_s1_axi_awburst",
 "io_m0_writeAddr_bits_id" : "c0_s1_axi_awid", 
 "io_m0_writeAddr_bits_lock" : "c0_s1_axi_awlock",
 "io_m0_writeAddr_bits_cache" : "c0_s1_axi_awcache",
 "io_m0_writeAddr_bits_prot" : "c0_s1_axi_awprot",
 "io_m0_writeAddr_bits_qos" : "c0_s1_axi_awqos",
 "io_m0_writeData_ready" : "c0_s1_axi_wready",
 "io_m0_writeData_valid" : "c0_s1_axi_wvalid",
 "io_m0_writeData_bits_data" : "c0_s1_axi_wdata",
 "io_m0_writeData_bits_strb" : "c0_s1_axi_wstrb",
 "io_m0_writeData_bits_last" : "c0_s1_axi_wlast",
 "io_m0_writeResp_ready" : "c0_s1_axi_bready",
 "io_m0_writeResp_valid" : "c0_s1_axi_bvalid",
 "io_m0_writeResp_bits_id" : "c0_s1_axi_bid",
 "io_m0_writeResp_bits_resp" : "c0_s1_axi_bresp",
 "io_m0_readAddr_ready" : "c0_s1_axi_arready",
 "io_m0_readAddr_valid" : "c0_s1_axi_arvalid",
 "io_m0_readAddr_bits_addr" : "c0_s1_axi_araddr",
 "io_m0_readAddr_bits_size" : "c0_s1_axi_arsize",
 "io_m0_readAddr_bits_len" : "c0_s1_axi_arlen",
 "io_m0_readAddr_bits_burst" : "c0_s1_axi_arburst",
 "io_m0_readAddr_bits_id" : "c0_s1_axi_arid",
 "io_m0_readAddr_bits_lock" : "c0_s1_axi_arlock",
 "io_m0_readAddr_bits_cache" : "c0_s1_axi_arcache",
 "io_m0_readAddr_bits_prot" : "c0_s1_axi_arprot",
 "io_m0_readAddr_bits_qos" : "c0_s1_axi_arqos",
 "io_m0_readData_ready" : "c0_s1_axi_rready",
 "io_m0_readData_valid" : "c0_s1_axi_rvalid",
 "io_m0_readData_bits_data" : "c0_s1_axi_rdata",
 "io_m0_readData_bits_id" : "c0_s1_axi_rid", 
 "io_m0_readData_bits_last" : "c0_s1_axi_rlast",
 "io_m0_readData_bits_resp" : "c0_s1_axi_rresp",
 "clock": "clk", 
 "reset": "rst"
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
