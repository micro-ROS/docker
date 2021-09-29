. "/opt/ros/$ROS_DISTRO/setup.sh"
. "/uros_ws/install/local_setup.sh"

if [ "$ROS_LOCALHOST_ONLY" = "1" ] ; then
    export FASTRTPS_DEFAULT_PROFILES_FILE=/tmp/disable_fastdds_shm_localhost_only.xml
else
    export FASTRTPS_DEFAULT_PROFILES_FILE=/tmp/disable_fastdds_shm.xml
fi

exec ros2 run micro_ros_agent micro_ros_agent "$@"
