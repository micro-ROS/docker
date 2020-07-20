FROM microros/micro-ros-agent:dashing

WORKDIR /uros_ws

RUN apt-get update

RUN git clone --depth 1 https://github.com/micro-ROS/micro-ROS_kobuki_demo \
    src/micro-ROS_kobuki_demo
RUN git clone --depth 1 https://github.com/micro-ROS/drive_base \
    src/drive_base

# install deps -- but skip agent, it's already in here
RUN rosdep install -y --from-paths src -i src --skip-keys micro_ros_agent

RUN . ./install/setup.sh && \
    colcon build --symlink-install --packages-select drive_base_msgs \ 
    base_info_handler  \
    micro-ros_kobuki_demo_remote \
    micro-ros_kobuki_demo_robot-description && \
    rm -rf build log

    # setup entrypoint
COPY ./demo_kobuki_entrypoint.sh /
ENTRYPOINT ["/bin/sh", "/demo_kobuki_entrypoint.sh"]
