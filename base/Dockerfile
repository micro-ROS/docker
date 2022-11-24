FROM ros:rolling

WORKDIR /uros_ws

RUN git clone --depth 1 -b main https://github.com/micro-ROS/micro_ros_setup.git src/micro_ros_setup \
&&  . /opt/ros/$ROS_DISTRO/setup.sh \
&&  apt update \
&&  apt install -y ed python3-pip \
&&  apt install -y ros-$ROS_DISTRO-rmw-fastrtps-cpp \
&&  apt remove -y ros-$ROS_DISTRO-rmw-cyclonedds-cpp \
&&  apt autoremove -y \
&&  rosdep update --rosdistro $ROS_DISTRO\
&&  rosdep install --from-paths src --ignore-src -y \
&&  colcon build \
&&  rm -rf log/ build/ src/* \
&&  rm -rf /var/lib/apt/lists/*

COPY ./micro-ros_entrypoint.sh /micro-ros_entrypoint.sh

ENV RMW_IMPLEMENTATION=rmw_fastrtps_cpp

RUN echo ". /opt/ros/$ROS_DISTRO/setup.bash" >> ~/.bashrc
RUN echo ". /uros_ws/install/setup.bash" >> ~/.bashrc

ENTRYPOINT ["/micro-ros_entrypoint.sh"]
CMD ["bash"]
