#! /bin/bash
source "/uros_ws/install/setup.sh"
exec ros2 launch micro-ros_kobuki_demo_remote remote_without_control.launch.py "$@"
