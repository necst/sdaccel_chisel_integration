Chisel Wrapper for SDAccel RTL Flow
=======================

This project implements a wrapper in Chisel for using RTL kernels into SDAccel 2017.1+. The code implements the FSM used to manage the execution of the kernel via AXI-Lite, and allows the user to specify as many AXI4-Master ports to the memory as needed.

This README is organized as follows:
1. OVERVIEW
2. CHISEL TO VERILOG
3. NAMING CONVENTION
4. IP, XML GENERATION
5. XO GENERATION
6. HARDAWARE EMULATION
7. CONTRIBUTIONS


## 1. OVERVIEW
This is an example on how a Chisel Core can be integrated with SDAccel.
It is recommended to refer to the [SDAccel User Guide] on which interface requirements the Core need to met and the XML file convention. 
A basic example is provided too. In the example, the core receives the start signal and ends the computation after a simple increment.

N.B.: remember to source SDx settings before any of these step

## 2. CHISEL TO VERILOG

In order to generate the Verilog from the Chisel run the following command:
```
sbt "runMain <package>.<mainclass> --target-dir <path_to_target_dir> --top-name <top_module_name>"
```
For example we run:
```
sbt "runMain sdaccel_utils.SDAChiselWrapper --target-dir verilog_builds --top-name SDAChiselWrapper"
```

## 3. NAMING CONVENTION
In order to be compliant with SDAccel requirements you have to change the port name automatically generated from Chisel.
This can be done automatically through our python script 'change_port_names_xilinx.py':
```
python change_port_names_xilinx.py <verilog_file_path_from_chisel> <target_file_with_conventions>
```

For example we run:
```
python change_port_names_xilinx.py ./verilog_builds/SDAChiselWrapper.v ./verilog_xilinx/SDAChiselWrapper.v
```

## 4. IP, XML GENERATION

Now we have to package our Core as a Vivado® IP. We recommend to follow
[Vivado Design Suite User Guide: Creating and Packaging Custom IP].

Next step is the creation of the XML file necessary for the 5th step.
As is reported in the [SDAccel User Guide] the section 'vlnv' "must match the vendor, library, name and version attributes as in the component.xml of an IP". In the repository is provided a 'kernel.xml' example.

## 5. XO  GENERATION

In order to package the core in .xo format, first run vivado in tcl mode:
```
vivado -mode tcl
```

And then package all by typing:
```
package_xo -xo_path <.xo_file> -kernel_name <kernel_name> -kernel_xml <xml_file_path> -ip_directory <path_to_ip_directory>
```

For example we run:
```
package_xo -xo_path SDAChiselWrapper.xo -kernel_name SDAChiselWrapper -kernel_xml kernel.xml -ip_directory ./ip_dir
```

## 6. HARDWARE EMULATION

The core is now finally packaged. Copy the .xo file in the 'xo_generated' folder and then run the hardware emulation:
```
make emulation TARGET=hw_emu
```
Now it is possible to change the 'main.cpp' host code in order to verify the correct execution of the core. 

If it is needed it is provided also a 'sdacel.ini' file in order to generate the waveform graph. Copy it in the "hw_emu/<target_platform>" folder and then run:
```
./host <core_name>.xclbin
```

For example we run:
```
./host SDAChiselWrapper.xclbin
```

Refer to the Makefile source code to perform the build of the system, and to the Chisel3 repository for installation and dependencies.

## 7. CONTRIBUTION

Contributors and pull requests are more than welcome.

If you want to get in touch with us, do not hesitate to send an email:

	Lorenzo Di Tucci : lorenzo.ditucci at polimi.it
	Davide Conficconi : davide.conficconi at mail.polimi.it

[SDAccel User Guide]: https://www.xilinx.com/support/documentation/sw_manuals/xilinx2017_1/ug1023-sdaccel-user-guide.pdf 

[Vivado Design Suite User Guide: Creating and Packaging Custom IP]: https://www.xilinx.com/support/documentation/sw_manuals/xilinx2017_1/ug1118-vivado-creating-packaging-custom-ip.pdf
