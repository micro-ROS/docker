FROM microros/linux:latest


# Create work space
RUN mkdir -p ~/agent_ws/src

# Import ros packages
RUN wget https://raw.githubusercontent.com/micro-ROS/micro-ROS-doc/master/repos/agent_minimum.repos -O ~/agent_ws/micro_ros.repos
RUN vcs import ~/agent_ws/src < ~/agent_ws/micro_ros.repos

# Build Agent
RUN (cd ~/agent_ws && colcon build --cmake-args -DVERBOSE=ON)

# Add agent to user bin folder
RUN ln -s ~/agent_ws/install/uros_agent/lib/uros_agent/uros_agent /usr/bin/

# Add local setups
RUN echo . ~/agent_ws/install/./local_setup.bash >> .bashrc
