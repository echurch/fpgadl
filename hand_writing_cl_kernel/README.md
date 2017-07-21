OpenCL Network CL Example
--------------------------------------------------------------------------------
This build basically gets bbbear's cafe-fpga-opencl code to build and VERY NEARLY run
on our PNNL Micron FPGA board.... 

It starts with the Micron mmult example's Makefile and does what bbbear's now-obsolesced-by-Xylinx tcl build script did.

Files in the Example
-------------------------------------------------------------------------------
Application host code
* *.cpp

Kernel code
* net.cl

Compilation File
* sdaccel.mk : Makefile for compiling SDAccel application
* common.mk in ../common directory is also required for compilation

Compilation and Emulation, from this directory
---------------------------
Set up environment for SDAccel:
* run setup.sh (edit as needed first)



* make -f sdaccel.mk host
* make -f sdaccel.mk xbin_hw
* Run "make -f sdaccel.mk help" for further instructions, though they mostly have bearing on the Micron mmult example.

Executing the Application on FPGA
---------------------------------


 This very nearly works on the Micron board. It runs through the first ~6 of the ~9 layer/module network encapsulated in the bbbear json file 
 using gdb causes crashes in non-intuitive places!

* [echurch@voyager hand_writing_cl_kernel]$ ./mnist_exe -f ./bin_mnist_hw.xclbin  -k convLayer,paddingLayer,poolingLayer,dataLayer,outputLayer,reluLayer  -n  /home/echurch/dl/caffe-fpga-opencl/convertor/output/mnist.json  -v 12 -l debug -i 1