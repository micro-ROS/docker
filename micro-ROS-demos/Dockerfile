FROM microros/base:dashing

WORKDIR /uros_ws

RUN apt update && apt install -y liblog4cxx-dev clang 

RUN . /opt/ros/$ROS_DISTRO/setup.sh && . install/local_setup.sh && ros2 run micro_ros_setup create_host_client_ws.sh

RUN . /opt/ros/$ROS_DISTRO/setup.sh && . install/local_setup.sh &&  colcon build --metas src --cmake-args -DBUILD_SHARED_LIBS=ON

# setup entrypoint
COPY ./micro-ros_entrypoint.sh /
ENTRYPOINT ["/bin/sh", "/micro-ros_entrypoint.sh"]
