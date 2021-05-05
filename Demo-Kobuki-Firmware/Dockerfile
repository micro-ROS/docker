FROM microros/base:foxy

WORKDIR /uros_ws

RUN apt-get update

RUN . ./install/setup.sh && \
    ros2 run micro_ros_setup create_firmware_ws.sh nuttx olimex-stm32-e407
RUN . ./install/setup.sh && \
    ros2 run micro_ros_setup configure_firmware.sh drive_base

RUN . ./install/setup.sh && \
    ros2 run micro_ros_setup build_firmware.sh