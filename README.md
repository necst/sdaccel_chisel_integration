Chisel Wrapper for SDAccel RTL Flow
=======================

This project implements a wrapper in Chisel for using RTL kernels into SDAccel 2017.1+

## Lorenzo, remember this stuff!

in order to generate verilog :
```aidl
object HelloWorld extends App {
  chisel3.Driver.execute(args, () => new HelloWorld)
}
```

and then 
```
bash> sbt 'run-main intro.HelloWorld --target-dir buildstuff --top-name HelloWorld'
```
then, in Vivado, to wrap the verilog code and make it become an IP Core

```aidl
http://www.fpgadeveloper.com/2014/08/creating-a-custom-ip-block-in-vivado.html
```

