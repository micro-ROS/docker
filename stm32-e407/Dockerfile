#########################################################################################
# A Dockerfile for the micro-ROS simulation environment
#########################################################################################
FROM ubuntu:16.04
WORKDIR /root

#########################################################################################
# Install NuttX dependencies
#########################################################################################
RUN apt-get update 
RUN apt-get install -y build-essential && \ 
    apt-get install -y bison flex gperf && \
    apt-get install -y libgmp-dev libmpc-dev libmpfr-dev libisl-dev && \
    apt-get install -y binutils-dev libelf-dev && \
    apt-get install -y libexpat-dev libz-dev && \
    apt-get install -y libncurses-dev gettext texinfo wget && \
    apt-get install -y gcc-arm-none-eabi gdb-arm-none-eabi

#########################################################################################
# Install utils
#########################################################################################
RUN apt-get install -y git cmake remake vim && \
    apt-get install -y openocd screen libusb-1.0.0-dev

##########################################################################################
## Clone repositories
##########################################################################################
RUN git clone https://github.com/microROS/NuttX     nuttx
RUN git clone https://bitbucket.org/nuttx/tools     tools
RUN git clone https://github.com/microROS/apps      apps
RUN git clone https://bitbucket.org/nuttx/buildroot nuttx/buildroot

#########################################################################################
# Build kconfig-frontends
#########################################################################################
RUN cd tools/kconfig-frontends && \
    ./configure --enable-mconf --disable-nconf --disable-gconf --disable-qconf && \
    LD_RUN_PATH=/usr/local/lib && \
    make && \
    make install && \
    ldconfig 

#########################################################################################
# NuttX configuration
#########################################################################################
RUN cd nuttx && tools/configure.sh configs/olimex-stm32-e407/micrortps

#########################################################################################
# Build toolchain
#########################################################################################
RUN cd nuttx/buildroot && \
    cp configs/cortexm3-eabi-defconfig-4.8.5 .defconfig && \ 
    make defconfig ; exit 0
RUN cd nuttx/buildroot && make
ENV PATH="/root/nuttx/buildroot/build_arm_nofpu/staging_dir/bin/":$PATH 
RUN rm -r nuttx/archives
RUN rm -r nuttx/buildroot/toolchain_build_arm_nofpu

##########################################################################################
## Build NuttX
##########################################################################################
RUN cd nuttx && make

