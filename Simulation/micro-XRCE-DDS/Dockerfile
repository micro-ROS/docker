FROM microros/linux:latest
# Install essential required for Nuttx complilation
RUN apt install -y  bison \
                    flex \
                    gperf \
                    libgmp-dev \
                    libmpc-dev \
                    libmpfr-dev \
                    libisl-dev \
                    binutils-dev \
                    libelf-dev \
                    libexpat1-dev \
                    zlib1g-dev \
                    libncurses5-dev \
                    gettext \
                    texinfo \
                    gcc-arm-none-eabi \
                    gdb-multiarch \
                    openocd \
                    libusb-1.0-0-dev \
                    automake \
                    autotools-dev \
		    git \
		    build-essential \
		    python \
		    pkg-config \
		    zlib1g-dev \
		    libglib2.0-dev \
		    binutils-dev \
		    libboost-all-dev \
		    autoconf \
		    libtool \
		    libssl-dev \
		    libpixman-1-dev \
		    libpython-dev \
		    virtualenv \
		    libfdt-dev


# Install utils and tools.

RUN apt install -y  remake \
                    vim \
                    screen \
                    ranger \
		    nano \
                    minicom

RUN git clone -b nuttx-sim-dev  https://github.com/microROS/NuttX.git ~/nuttx 


RUN git clone  https://github.com/microROS/apps.git ~/apps

RUN git clone https://bitbucket.org/nuttx/tools.git ~/tools
RUN (cd tools/kconfig-frontends && \
        ./configure --enable-mconf --disable-nconf --disable-gconf --disable-qconf && \
        LD_RUN_PATH=/usr/local/lib && make && make install && ldconfig)

# Downloading and installing the custom simulator.

RUN git clone https://github.com/microROS/Simulator ~/Simulator
RUN (cd ~/Simulator/qemu_stm32 && git submodule update --init dtc && ./configure --extra-cflags="-w" --enable-debug --target-list="arm-softmmu" && make && make install)

# Downloading and installing Micro-XRCE-DDS Agent

RUN git clone https://github.com/eProsima/micro-XRCE-DDS-agent.git
RUN (cd micro-XRCE-DDS-agent && mkdir build && cd build && cmake -DTHIRDPARTY=ON .. && make && make install && ldconfig /usr/local/lib/ )

# Compiling NuttX
RUN (cd nuttx && ./tools/configure.sh stm32f103-minimum/microxrcedds && make)









		    
