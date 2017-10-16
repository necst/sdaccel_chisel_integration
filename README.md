Chisel Wrapper for SDAccel RTL Flow
=======================

This project implements a wrapper in Chisel for using RTL kernels into SDAccel 2017.1+

This README file contains the following sections:
1. OVERVIEW
2. CHISEL TO VERILOG
3. NAMING CONVENTION
4. IP, XML GENERATION
5. XO GENERATION
6. HARDAWARE EMULATION


## 1. OVERVIEW
This is an example on how a Chisel Core can be integrated with SDAccel.
It is recommended to refer to the [SDAccel User Guide] on which interface requirements the Core need to met and the XML file convention.
The example we provide is a toy one, which has only an AXI-Lite port used to start the computation and signal to the host the end of the computation. In our case the computation ends after a simple increment.

## 2. CHISEL TO VERILOG

In order to generate the Verilog from the Chisel run the following command:
```
sbt "runMain <package>.<mainclass> --target-dir <path_to_target_dir> --top-name <top_module_name>"
```
For example we run:
```
sbt "runMain sdaccel_utils.AdderAxi --target-dir verilog_builds --top-name AdderAxi"
```

## 3. NAMING CONVENTION
In order to be compliant with SDAccel requirements you have to change the port name automatically generated from Chisel. Since the reset works with negative logic we have also to change how we reset our registers. 
This can be done all automatically through our python script 'change_port_names_xilinx.py':
```
python change_port_names_xilinx.py <verilog_file_path_from_chisel> <target_file_with_conventions>
```

For example we run:
```
python change_port_names_xilinx.py ./verilog_builds/AdderAxi.v ./verilog_xilinx/AdderAxi.v
```

## 4. IP, XML GENERATION

Now we have to package our Core as a Vivado® IP. We recommend to follow
[Vivado Design Suite User Guide: Creating and Packaging Custom IP].

Next step is the creation of the XML file necessary for the 5th step.
As is reported in the [SDAccel User Guide] the section 'vlnv' "must match the vendor,library,name and version attributes as in the component.xml of an IP". We provide our 'kernel.xml' example.

## 5. XO  GENERATION

In order to package our Core in .xo format compliant with SDAccel we run vivado in tcl mode:
```
vivado -mode tcl
```

And then we have to package all:
```
package_xo -xo_path <.xo_file> -kernel_name <kernel_name> -kernel_xml <xml_file_path> -ip_directory <path_to_ip_directory>
```

For example we run:
```
package_xo -xo_path AdderAxi.xo -kernel_name AdderAxi -kernel_xml kernel.xml -ip_directory ./ip_dir
```

## 6. HARDWARE EMULATION

The Core is now finally packaged, we should copy our .xo file in the 'xo_generated' folder and then run the hardware emulation:
```
make emulation TARGET=hw_emu
```
We can now change the 'main.cpp' host code in order to verify correctly the succesful execution of our core. 
If it is needed the there is also a 'sdacel.ini' file in order to see the waveform graph. Copy it in the "hw_emu/<target_platform>" folder and then run:
```
./host <core_name>.xclbin
```

For example we run:
```
./host AdderAxi.xclbin
```

[SDAccel User Guide]: https://www.xilinx.com/support/documentation/sw_manuals/xilinx2017_1/ug1023-sdaccel-user-guide.pdf 

[Vivado Design Suite User Guide: Creating and Packaging Custom IP]: https://www.xilinx.com/support/documentation/sw_manuals/xilinx2017_1/ug1118-vivado-creating-packaging-custom-ip.pdf
