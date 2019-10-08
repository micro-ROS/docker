FROM ros:dashing 

RUN apt update && apt install -y curl

RUN mkdir -p uros_ws/src
WORKDIR uros_ws
RUN git clone --recursive --single-branch --branch $ROS_DISTRO https://github.com/micro-ROS/micro-ros-build.git src/micro-ros-build 
RUN . /opt/ros/$ROS_DISTRO/setup.sh && colcon build --packages-select micro_ros_setup
RUN . /opt/ros/$ROS_DISTRO/setup.sh && rosdep update
