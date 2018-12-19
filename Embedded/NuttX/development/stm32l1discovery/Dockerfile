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
                    autotools-dev



# Install utils and tools.
RUN apt install -y  remake \
                    vim \
                    screen \
                    ranger \
                    minicom


# Clone nuttx repo
RUN git clone https://github.com/microROS/NuttX


# Clone nuttx apps repo.
RUN git clone https://github.com/microROS/apps.git ~/apps


# Clone, Build and install kconfig-frontends repo
RUN git clone https://bitbucket.org/nuttx/tools.git ~/tools
RUN (cd tools/kconfig-frontends && \
        ./configure --enable-mconf --disable-nconf --disable-gconf --disable-qconf && \
        LD_RUN_PATH=/usr/local/lib && make && make install && ldconfig)

RUN cd NuttX && \
    tools/configure.sh ../configs/stm32ldiscovery/nsh && \
    make
