FROM microros/base:Crystal

WORKDIR /uros_ws/src

RUN apt update && apt install -y liblog4cxx-dev clang 

RUN . /opt/ros/crystal/setup.sh && . install/local_setup.sh && ros2 run micro_ros_setup create_host_client_ws.sh

RUN . /opt/ros/crystal/setup.sh && rosdep install -y --from-paths src -i src --skip-keys="microxrcedds_client microcdr rosidl_typesupport_connext_cpp rosidl_typesupport_connext_c rosidl_typesupport_opensplice_cpp rosidl_typesupport_opensplice_c rmw_connext_cpp rmw_opensplice_cpp"

RUN . /opt/ros/crystal/setup.sh && . install/local_setup.sh &&  colcon build --metas src --cmake-args -DBUILD_SHARED_LIBS=ON

# setup entrypoint
COPY ./micro-ros_entrypoint.sh /
ENTRYPOINT ["/bin/sh", "/micro-ros_entrypoint.sh"]
