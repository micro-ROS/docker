# A Dockerfile for the micro-ROS simulation environment
FROM ubuntu:16.04
WORKDIR /root

# Install NuttX dependencies
RUN apt-get update
RUN apt-get install libssl-dev libxml2-dev pkg-config picocom screen libusb-1.0-0-dev gcc-arm-none-eabi -y
RUN apt-get install -y autotools-dev autoconf gperf flex bison libncurses5-dev libtool
RUN apt-get install python-serial openocd \
    flex bison libncurses5-dev autoconf texinfo \
    libftdi-dev libtool zlib1g-dev -y
RUN apt-get install git -y


# Set up related tools
RUN git clone https://bitbucket.org/nuttx/tools
RUN cd tools/kconfig-frontends && ./bootstrap && ./configure && make
RUN cd tools/kconfig-frontends && make install

# clone the code
RUN git clone https://github.com/microROS/apps
RUN git clone https://github.com/microROS/NuttX

# Update libraries
RUN /sbin/ldconfig -v

# select the simulator, make it and run it
RUN cd NuttX && tools/configure.sh sim/nsh
RUN cd NuttX && make

# login: admin
# password: Administrator
