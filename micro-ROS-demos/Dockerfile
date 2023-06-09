FROM microros/base:iron

WORKDIR /uros_ws

RUN apt update \
&&  apt install -y liblog4cxx-dev clang \
&&  rm -rf /var/lib/apt/list/*

RUN . /opt/ros/$ROS_DISTRO/setup.sh \
&&  . install/local_setup.sh \
&&  ros2 run micro_ros_setup create_firmware_ws.sh host \
&&  ros2 run micro_ros_setup build_firmware.sh

# setup entrypoint
COPY ./micro-ros_entrypoint.sh /
ENTRYPOINT ["/bin/sh", "/micro-ros_entrypoint.sh"]
