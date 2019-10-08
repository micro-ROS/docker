. "/opt/ros/$ROS_DISTRO/setup.sh"
. "/uros_ws/install/local_setup.sh"
exec ros2 run micro_ros_agent micro_ros_agent $@
