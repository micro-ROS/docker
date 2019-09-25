FROM microros/base:crystal

RUN apt install -y ed flex bison libncurses5-dev gcc-arm-none-eabi clang clang-tidy

WORKDIR /uros_ws/src
RUN . /opt/ros/crystal/setup.sh && . install/local_setup.sh && ros2 run micro_ros_setup create_firmware_ws.sh
