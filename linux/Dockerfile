# A Dockerfile for ROS2 build
FROM ubuntu:16.04

# Change work dir
WORKDIR /root

RUN apt-get update

RUN apt-get install -y locales lsb-release
RUN locale-gen en_US en_US.UTF-8
RUN update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'

# Add the ROS apt repository
RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu `lsb_release -cs` main" > /etc/apt/sources.list.d/ros-latest.list'
RUN apt-key adv --keyserver ha.pool.sks-keyservers.net --recv-keys 421C365BD9FF1F717815A3895523BAEEB01FA116
# RUN apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 421C365BD9FF1F717815A3895523BAEEB01F


RUN apt-get update
#RUN apt-get install -y apt-utils
RUN apt-get install -y git wget
RUN apt-get install -y build-essential cppcheck cmake libopencv-dev python-empy python3-catkin-pkg-modules python3-dev python3-empy python3-nose python3-pip python3-pyparsing python3-setuptools python3-vcstool python3-yaml libtinyxml-dev libeigen3-dev libassimp-dev libpoco-dev
# [Ubuntu 16.04] you will need a newer setuptools version than the one available from Debian
RUN python3 -m pip install -U setuptools
RUN apt-get install -y python3-colcon-common-extensions
# dependencies for testing
RUN apt-get install -y clang-format pydocstyle pyflakes python3-coverage python3-mock python3-pep8 uncrustify
# Install argcomplete for command-line tab completion from the ROS2 tools.
# Install from pip rather than from apt the version in Ubuntu is too old:
RUN python3 -m pip install argcomplete
# additional testing dependencies from pip (because not available on Ubuntu)
RUN python3 -m pip install flake8 flake8-blind-except flake8-builtins flake8-class-newline flake8-comprehensions flake8-deprecated flake8-docstrings flake8-import-order flake8-quotes
# [Ubuntu 18.04] Install pytest and pytest plugins
RUN apt-get install -y python3-pytest python3-pytest-cov python3-pytest-runner
# [Ubuntu 16.04] Install pytest and pytest plugins from pip
RUN python3 -m pip install pytest pytest-cov pytest-runner
# additional pytest plugins unavailable from Debian
RUN python3 -m pip install pytest-repeat pytest-rerunfailures
# dependencies for FastRTPS
RUN apt-get install -y libasio-dev libtinyxml2-dev
# [Ubuntu 16.04] install dependencies for building poco
RUN apt-get install -y libexpat1-dev libpcre3-dev libsqlite3-dev zlib1g-dev
# dependencies for RViz
RUN apt-get install -y libcurl4-openssl-dev libfreetype6-dev libgles2-mesa-dev libglu1-mesa-dev libqt5core5a libqt5gui5 libqt5opengl5 libqt5widgets5 libxaw7-dev libxrandr-dev qtbase5-dev

RUN apt-get install -y gdbserver

# Upgrade pip
RUN pip3 install --upgrade pip

# Upgrade pytest
RUN pip3 install -U pytest


# Install tools
RUN apt-get -y install valgrind gcovr libssl-dev software-properties-common

# Install java
RUN add-apt-repository -y ppa:webupd8team/java && apt -y update && \
    echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections && \
    echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 seen true" | debconf-set-selections && \
    apt -y install oracle-java8-installer
ENV JAVA_HOME "/usr/lib/jvm/java-8-oracle/"
