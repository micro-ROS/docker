FROM ros:dashing 

RUN mkdir -p uros_ws
WORKDIR uros_ws
RUN git clone --depth 1 -branch -b $ROS_DISTRO https://github.com/micro-ROS/micro-ros-build.git src/micro-ros-build \
&&  . /opt/ros/$ROS_DISTRO/setup.sh \
&&  apt update \
&&  rosdep update \
&&  rosdep install --from-paths src --ignore-src -y \
&&  colcon build \
&&  rm -rf log/ build/ src/* \
&&  rm -rf /var/lib/apt/list/*

COPY ./micro-ros_entrypoint.sh /micro-ros_entrypoint.sh
ENTRYPOINT ["/micro-ros_entrypoint.sh"]
CMD ["bash"]
