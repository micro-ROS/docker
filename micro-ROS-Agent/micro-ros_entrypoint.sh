#!/bin/bash

if [ "$ROS_LOCALHOST_ONLY" = "1" ] ; then
    export FASTRTPS_DEFAULT_PROFILES_FILE=/tmp/disable_fastdds_shm_localhost_only.xml
else
    export FASTRTPS_DEFAULT_PROFILES_FILE=/tmp/disable_fastdds_shm.xml
fi

if [ "$MICROROS_STATIC_SOURCE" = "1" ] ; then
    . /micro-ros_agent_static_source.sh

    /uros_ws/install/micro_ros_agent/lib/micro_ros_agent/micro_ros_agent "$@"
else
    . "/opt/ros/$ROS_DISTRO/setup.sh"
    . "/uros_ws/install/local_setup.sh"
    exec ros2 run micro_ros_agent micro_ros_agent "$@"
fi
