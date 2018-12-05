FROM qeyup/ros2_devtools:16.04

# Create work space
RUN mkdir -p ~/client_ws/src

# Import ros packages
RUN wget https://raw.githubusercontent.com/microROS/micro-ROS-doc/feature/doc_restructure_Installation/Installation/repos/client_minimum.repos -O ~/client_ws/micro_ros.repos
RUN vcs import ~/client_ws/src < ~/client_ws/micro_ros.repos

# Build CLient
RUN (cd ~/client_ws && colcon build --cmake-args -DBUILD_SHARED_LIBS=ON)

# Add examples into user bin folder
RUN ln -s ~/client_ws/install/int32_publisher_c/lib/int32_publisher_c/int32_publisher_c /usr/bin/
RUN ln -s ~/client_ws/install/int32_subscriber_c/lib/int32_subscriber_c/int32_subscriber_c /usr/bin/

RUN ln -s ~/client_ws/install/string_publisher_c/lib/string_publisher_c/string_publisher_c /usr/bin/
RUN ln -s ~/client_ws/install/string_subscriber_c/lib/string_subscriber_c/string_subscriber_c /usr/bin/

RUN ln -s ~/client_ws/install/complex_msg_publisher_c/lib/complex_msg_publisher_c/complex_msg_publisher_c /usr/bin/
RUN ln -s ~/client_ws/install/subscriber_publisher_c/lib/subscriber_publisher_c/subscriber_publisher_c /usr/bin/


# Add local setups
RUN echo . ~/client_ws/install/./local_setup.bash >> .bashrc
