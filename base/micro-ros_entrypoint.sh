#!/bin/bash
set -e

echo ". /opt/ros/$ROS_DISTRO/setup.bash" >> ~/.bashrc
echo ". /uros_ws/install/setup.bash" >> ~/.bashrc

exec "$@"