FROM ros:crystal 

RUN apt update && apt install -y curl

RUN mkdir -p uros_ws/src
WORKDIR uros_ws
RUN git clone --recursive --single-branch --branch crystal https://github.com/micro-ROS/micro-ros-build.git 
RUN . /opt/ros/crystal/setup.sh && colcon build --packages-select micro_ros_setup
RUN . /opt/ros/crystal/setup.sh && rosdep update
