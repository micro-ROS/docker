#!/bin/bash

if [ "$ROS_LOCALHOST_ONLY" = "1" ] ; then
    export FASTRTPS_DEFAULT_PROFILES_FILE=/tmp/disable_fastdds_shm_localhost_only.xml
else
    export FASTRTPS_DEFAULT_PROFILES_FILE=/tmp/disable_fastdds_shm.xml
fi

if [ "$MICROROS_STATIC_SOURCE" = "1" ] ; then
    export LD_LIBRARY_PATH=/uros_ws/install/micro_ros_agent/lib:/uros_ws/install/micro_ros_msgs/lib:/opt/ros/galactic/opt/yaml_cpp_vendor/lib:/opt/ros/galactic/lib/x86_64-linux-gnu:/opt/ros/galactic/lib:$LD_LIBRARY_PATH
    PYTHONPATH=/uros_ws/install/micro_ros_msgs/lib/python3.8/site-packages:/opt/ros/galactic/lib/python3.8/site-packages:$PYTHONPATH
    export ROS_DISTRO=galactic

    /uros_ws/install/micro_ros_agent/lib/micro_ros_agent/micro_ros_agent "$@"
else
    . "/opt/ros/$ROS_DISTRO/setup.sh"
    . "/uros_ws/install/local_setup.sh"
    exec ros2 run micro_ros_agent micro_ros_agent "$@"
fi
