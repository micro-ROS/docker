# A Dockerfile for the micro-ROS build environment
FROM ubuntu:16.04
WORKDIR /root

RUN apt update --fix-missing
RUN apt install -y locales lsb-release

RUN locale-gen en_US en_US.UTF-8
RUN update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'

#########################################################################################
# Install ROS dependencies
#########################################################################################
# # Add ROS2 repository.
RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu `lsb_release -cs` main" > /etc/apt/sources.list.d/ros-latest.list'
RUN apt-key adv --keyserver ha.pool.sks-keyservers.net --recv-keys 421C365BD9FF1F717815A3895523BAEEB01FA116
RUN apt update

# Essential dependencies.
RUN apt install -y \
        build-essential \
        cmake \
        git \
        python3-colcon-common-extensions \
        python3-pip \
        python-rosdep \
        python3-vcstool \
        wget

# Testing dependencies.
RUN python3 -m pip install -U \
        argcomplete \
        flake8 \
        flake8-blind-except \
        flake8-builtins \
        flake8-class-newline \
        flake8-comprehensions \
        flake8-deprecated \
        flake8-docstrings \
        flake8-import-order \
        flake8-quotes \
        pytest-repeat \
        pytest-rerunfailures

# Ubuntu 16.04 extra packages.
RUN python3 -m pip install -U \
        pytest \
        pytest-cov \
        pytest-runner \
        setuptools

#########################################################################################
# Install NuttX dependencies
#########################################################################################
RUN apt install -y \
        bison \
        flex \
        gperf \
        libgmp-dev \
        libmpc-dev \
        libmpfr-dev \
        libisl-dev \
        binutils-dev \
        libelf-dev \
        libexpat-dev \
        libz-dev \
        libncurses-dev \
        gettext \
        texinfo \
        wget \
        gcc-arm-none-eabi \
        gdb-arm-none-eabi \
        openocd \
        libusb-1.0.0-dev

#########################################################################################
# Install utils
#########################################################################################
RUN apt install -y \
        remake \
        vim \
        screen \
        ranger

#########################################################################################
# Clone repositories
#########################################################################################
RUN git clone https://bitbucket.com/nuttx/nuttx.git nuttx
RUN git clone https://bitbucket.org/nuttx/tools.git tools
RUN git clone https://github.com/microROS/apps.git apps && \
    cd apps \
    && git checkout feature/microROS_stm32-e407

RUN git clone https://bitbucket.org/nuttx/uclibc.git uclibc

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
# Install uclibc
#########################################################################################
RUN cd uclibc && \
    echo -e "Y\nY\nY\nY\n" | ./install.sh ../nuttx

#########################################################################################
# Install micro-ROS build system
#########################################################################################
RUN mkdir -p uros_build_ws/src && \
    cd uros_build_ws && \
    wget https://raw.githubusercontent.com/microROS/micro-ROS-doc/feature/repos/repos/mcu/uros_build.repos && \
    vcs import src < uros_build.repos && \
    colcon build --symlink-install --cmake-args -DBUILD_TESTING=OFF

#########################################################################################
# Install micro-ROS
#########################################################################################
RUN mkdir -p uros_ws/src && \
    cd uros_ws && \
    wget https://raw.githubusercontent.com/microROS/micro-ROS-doc/feature/repos/repos/mcu/uros_mcu.repos && \
    vcs import src < uros_mcu.repos
RUN touch uros_ws/src/uros/micro-ROS-demo/COLCON_IGNORE

# select the configuration of the OLIMEX board
RUN cd nuttx && \
    tools/configure.sh ../apps/configs/olimex-stm32-e407/uros/
RUN . ./uros_build_ws/install/local_setup.sh && \
    cd nuttx && \
    make
