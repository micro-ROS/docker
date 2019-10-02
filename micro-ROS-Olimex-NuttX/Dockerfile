FROM microros/firmware:crystal

WORKDIR /uros_ws/src

RUN apt install -y gperf openocd 

RUN git clone https://bitbucket.org/nuttx/tools.git ~/tools
RUN (cd ~/tools/kconfig-frontends && \
        ./configure --enable-mconf --disable-nconf --disable-gconf --disable-qconf && \
        LD_RUN_PATH=/usr/local/lib && make && make install && ldconfig)

RUN cd firmware/NuttX && \
    tools/configure.sh configs/olimex-stm32-e407/uros && \
    cd ../..

RUN  find ./firmware/mcu_ws/ -name rmw_microxrcedds.config -exec sed -i "s/CONFIG_MICRO_XRCEDDS_TRANSPORT=udp/CONFIG_MICRO_XRCEDDS_TRANSPORT=serial/g" {} \;

RUN . /opt/ros/crystal/setup.sh && . install/local_setup.sh && ros2 run micro_ros_setup build_firmware.sh
