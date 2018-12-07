# A Dockerfile for the micro-ROS simulation environment
FROM ubuntu:16.04
WORKDIR /root

RUN apt update --fix-missing
RUN apt install -y locales lsb-release
RUN locale-gen en_US en_US.UTF-8
RUN update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
RUN LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'

RUN apt install -y \
        build-essential \
        cmake \
        git \
        python3-pip \
        python-rosdep \
        wget

RUN pip3 install --upgrade pip

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

RUN python3 -m pip install -U \
        pytest \
        pytest-cov \
        pytest-runner \
        setuptools

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

RUN apt install -y \
        remake \
        vim \
        screen \
        ranger \
        automake \
        pkg-config \
        libtool

RUN rm -rf /var/lib/apt/lists/*


RUN cd && \
  git clone https://github.com/microROS/NuttX nuttx && \
  git clone https://bitbucket.org/nuttx/tools.git tools && \
  git clone https://github.com/microROS/apps.git apps && \
  git clone https://bitbucket.org/nuttx/uclibc.git uclibc

RUN cd tools/kconfig-frontends && \
    autoreconf -f -i && \
    ./configure --enable-mconf --disable-nconf --disable-gconf --disable-qconf && \
    LD_RUN_PATH=/usr/local/lib && \
    make && \
    make install && \
    ldconfig

RUN cd nuttx && \
    tools/configure.sh ../configs/stm32ldiscovery/nsh && \
    make
