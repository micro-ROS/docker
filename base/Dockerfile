FROM ros:crystal 

RUN apt update && apt install -y curl

RUN mkdir -p uros_ws/src
WORKDIR uros_ws/src
RUN git clone --recursive --single-branch --branch feature/client_ws https://github.com/micro-ROS/micro-ros-build.git src/micro-ros-build 
RUN . /opt/ros/crystal/setup.sh && colcon build --packages-select micro_ros_setup
RUN . /opt/ros/crystal/setup.sh && rosdep update
