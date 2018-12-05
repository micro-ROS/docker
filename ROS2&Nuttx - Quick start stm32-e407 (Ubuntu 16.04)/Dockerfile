FROM ubuntu:16.04

# Change work dir
WORKDIR /root


# Upgrade apt
RUN apt update
RUN apt upgrade -y

# Install required packages for the below steps
RUN apt install -y  wget \
                    curl \
                    gnupg \
                    gnupg2 \
                    lsb-core \
                    locales \
                    software-properties-common

# Add ROS2 repo key
RUN wget http://repo.ros2.org/repos.key 
RUN apt-key add repos.key 
RUN rm repos.key 
RUN sh -c 'echo "deb [arch=amd64,arm64] http://repo.ros2.org/ubuntu/main `lsb_release -cs` main" > /etc/apt/sources.list.d/ros2-latest.list'

# Configure locale
RUN locale-gen en_US en_US.UTF-8 
RUN update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8 
ENV LANG='en_US.UTF-8'
ENV LANGUAGE='en_US:en'
ENV LC_ALL='en_US.UTF-8'
ENV DEBIAN_FRONTEND=noninteractive

# Install essential dependencies
RUN apt update
RUN apt install -y  build-essential \
                    cmake \
                    git \
                    python3-colcon-common-extensions \
                    python3-pip \
                    python-rosdep \
                    python3-vcstool \
                    clang-tidy

# Upgrade pip
RUN python3 -m pip install --upgrade pip
RUN python3 -m pip install -U   argcomplete \
                                flake8 \
                                flake8-blind-except \
                                flake8-builtins \
                                flake8-class-newline \
                                flake8-comprehensions \
                                flake8-deprecated \
                                flake8-docstrings \
                                flake8-import-order \
                                flake8-quotes \
                                pytest \
                                pytest-cov \
                                pytest-runner \
                                pytest-repeat \
                                pytest-rerunfailures \
                                setuptools \
                                mock \
                                git+https://github.com/lark-parser/lark.git@0.7b

# Install asio (For fastrtps)
RUN apt install --no-install-recommends -y \
                libasio-dev \
                libtinyxml2-dev

# Micellanus
RUN apt install -y  libpcre3 \
                    libpcre3-dev \
                    zlibc \
                    zlib1g \
                    zlib1g-dev \
                    xorg \
                    openbox \
                    libxaw7-dev \
                    libfreetype6-dev \
                    libglu1-mesa-dev freeglut3-dev mesa-common-dev \
                    qt5-default \
                    libogre-1.9-dev \
                    libxrandr-dev \
                    libopencv-dev \
                    libcurl4-openssl-dev

# Install eigen lib
RUN wget http://bitbucket.org/eigen/eigen/get/3.3.5.tar.bz2 -O eigen.tar.bz2
RUN tar -jxvf  eigen.tar.bz2 --one-top-level=eigen
RUN (cd eigen/* && mkdir build && cd build && cmake .. && make && make install)
RUN rm eigen eigen.tar.bz2 -rf


#--------


# Install java (For Jenkins)
RUN (add-apt-repository -y ppa:webupd8team/java && apt -y update && \
    echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections && \
    echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 seen true" | debconf-set-selections && \
    apt -y install oracle-java8-installer)
ENV JAVA_HOME "/usr/lib/jvm/java-8-oracle/"


#--------


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
RUN git clone https://bitbucket.com/nuttx/nuttx.git ~/nuttx


# Clone nuttx apps repo.
RUN git clone https://github.com/microROS/apps.git ~/apps 
RUN git -C ~/apps checkout feature/Ubuntu18Update


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
RUN (cd ~/nuttx && tools/configure.sh ../apps/configs/olimex-stm32-e407/uros/)
RUN (. ~/uros_build_ws/install/local_setup.sh && cd ~/nuttx && make)
