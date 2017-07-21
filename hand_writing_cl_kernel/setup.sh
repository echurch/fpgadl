export XILINX_SDACCEL=/home/echurch/xlnx-2016.3/SDx/2016.3
# FPGA=xilinx:tul-pcie3-ku115:2ddr:3.0
export XILINXD_LICENSE_FILE=/home/echurch/.Xilinx/Xilinx.lic
export SDACCEL_HOME=/home/echurch/xlnx-2016.3/SDx/2016.3
export XILINX_OPENCL=/home/echurch/dl
export XILINX_SDX=/home/echurch/xlnx-2016.3/SDx/2016.3

export LD_LIBRARY_PATH=/home/echurch/xlnx-2016.3/SDx/2016.3/runtime/lib/x86_64:/home/echurch/xlnx-2016.3/SDx/2016.3/Vivado_HLS/lnx64/tools/opencv:/home/echurch/xlnx-2016.3/SDx/2016.3/Vivado_HLS/lnx64/tools/opencv:/home/echurch/xlnx-2016.3/SDx/2016.3/lib/lnx64.o
export PATH=/usr/lib64/qt-3.3/bin:/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/src/picocomputing-5.6.0.0/bin:/home/echurch/bin:/home/echurch/xlnx-2016.3/SDx/2016.3/bin

# Must do below to force the xilinx libstdc++.so usage. LIBRARY_PATH and rpath don't get it done.
export LD_PRELOAD=/home/echurch/xlnx-2016.3/SDx/2016.3/runtime/lib/x86_64/libstdc++.so
export FPGA=xilinx:adm-pcie-ku3:2ddr-xpr:3.1

export XILINX_OPENCL=/home/echurch/pico/micron_ac510_sdaccel_release.20170221/runtime/xbinst/pkg/pcie
export LD_LIBRARY_PATH=$XILINX_OPENCL/runtime/lib/x86_64:$LD_LIBRARY_PATH
export XCL_PLATFORM=micron_ac510_sdaccel_16_0


