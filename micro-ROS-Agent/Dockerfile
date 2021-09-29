FROM microros/base:foxy

WORKDIR /uros_ws
RUN . /opt/ros/$ROS_DISTRO/setup.sh \
&&  . install/local_setup.sh \
&&  ros2 run micro_ros_setup create_agent_ws.sh \
&&  ros2 run micro_ros_setup build_agent.sh \
&&  rm -rf log/ build/ src/

# Disable shared memory
COPY disable_fastdds_shm.xml disable_fastdds_shm_localhost_only.xml /tmp/

# setup entrypoint
COPY ./micro-ros_entrypoint.sh /
ENTRYPOINT ["/bin/sh", "/micro-ros_entrypoint.sh"]
CMD ["--help"]
