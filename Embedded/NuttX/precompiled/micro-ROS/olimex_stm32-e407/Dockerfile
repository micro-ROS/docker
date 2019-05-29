FROM microros_linux:latest
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
RUN git clone https://github.com/micro-ROS/NuttX.git --branch v0.0.2-alpha ~/nuttx 




# Clone nuttx apps repo.
RUN git clone https://github.com/micro-ROS/apps.git --branch v0.0.3-alpha ~/apps




# Clone, Build and install kconfig-frontends repo
RUN git clone https://bitbucket.org/nuttx/tools.git ~/tools
RUN (cd tools/kconfig-frontends && \
        ./configure --enable-mconf --disable-nconf --disable-gconf --disable-qconf && \
        LD_RUN_PATH=/usr/local/lib && make && make install && ldconfig)



# Clone and install uclibc
RUN git clone https://bitbucket.org/nuttx/uclibc.git ~/uclibc
RUN (cd ~/uclibc/ && echo -e "Y\nY\nY\nY\n" | ./install.sh ~/nuttx)


#--------


# Download, build and install `Micro-ROS build system`
RUN mkdir -p ~/uros_build_ws/src
RUN wget https://raw.githubusercontent.com/microROS/micro-ROS-doc/master/repos/mcu/uros_build.repos -O ~/uros_build_ws/uros_build.repos
RUN vcs import ~/uros_build_ws/src < ~/uros_build_ws/uros_build.repos
RUN (cd ~/uros_build_ws && colcon build --symlink-install --cmake-args -DBUILD_TESTING=OFF)


# Download `Micro-ROS`
RUN mkdir -p ~/uros_ws/src 
RUN wget https://raw.githubusercontent.com/microROS/micro-ROS-doc/master/repos/mcu/uros_mcu.repos -O ~/uros_ws/uros_mcu.repos 
RUN vcs import ~/uros_ws/src < ~/uros_ws/uros_mcu.repos
RUN touch ~/uros_ws/src/uros/micro-ROS-demo/COLCON_IGNORE
RUN sed -i s/"CONFIG_MICRO_XRCEDDS_TRANSPORT=.*"/"CONFIG_MICRO_XRCEDDS_TRANSPORT=serial"/g ~/uros_ws/src/uros/rmw-microxrcedds/rmw_microxrcedds_c/rmw_microxrcedds.config


# Build Nuttx binary
RUN (cd ~/nuttx && tools/configure.sh ./configs/olimex-stm32-e407/uros/)
 RUN (. ~/uros_build_ws/install/local_setup.sh && cd ~/nuttx && make)
