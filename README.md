# Docker

This repository contains docker-related material to setup, configure and develop with [micro-ROS](https://microros.github.io/)
These set of Dockerfiles provide ready-to-use environments and applications.
The Docker images are available in [dockerhub](https://hub.docker.com/u/microros).

Avaiable images are listed below:

| Image | Description | Status
-|-|-:
| base  | Base image with ROSDISTRO installation + micro-ROS specific build system. Used as base of any other micro-ROS images | [![Docker Automated build](https://img.shields.io/docker/cloud/automated/microros/base.svg?logo=docker)](https://hub.docker.com/r/microros/base/)[![Docker Build Status](https://img.shields.io/docker/cloud/build/microros/base.svg?logo=docker)](https://hub.docker.com/r/microros/base/)[![Compare Images](https://images.microbadger.com/badges/image/microros/base.svg)](https://microbadger.com/images/microros/base)
| micro-ros-agent | Image containing a pre-compiled micro-ROS-Agent, ready to use as standalone application | [![Docker Automated build](https://img.shields.io/docker/cloud/automated/microros/micro-ros-agent.svg?logo=docker)](https://hub.docker.com/r/microros/micro-ros-agent/)[![Docker Build Status](https://img.shields.io/docker/cloud/build/microros/micro-ros-agent.svg?logo=docker)](https://hub.docker.com/r/microros/micro-ros-agent/)[![Compare Images](https://images.microbadger.com/badges/image/microros/micro-ros-agent.svg)](https://microbadger.com/images/microros/micro-ros-agent)
| micro-ros-demos | Contains precompiled micro-ROS-demos, ready to use to view micro-ROS funcionality | [![Docker Automated build](https://img.shields.io/docker/cloud/automated/microros/micro-ros-demos.svg?logo=docker)](https://hub.docker.com/r/microros/micro-ros-demos/)[![Docker Build Status](https://img.shields.io/docker/cloud/build/microros/micro-ros-demos.svg?logo=docker)](https://hub.docker.com/r/microros/micro-ros-demos/)[![Compare Images](https://images.microbadger.com/badges/image/microros/micro-ros-demos.svg)](https://microbadger.com/images/microros/micro-ros-demos)
| micro-ros-firmware | Contains a firmware ws ready to configure and build micro-ROS | [![Docker Automated build](https://img.shields.io/docker/cloud/automated/microros/firmware.svg?logo=docker)](https://hub.docker.com/r/microros/firmware/)[![Docker Build Status](https://img.shields.io/docker/cloud/build/microros/firmware.svg?logo=docker)](https://hub.docker.com/r/microros/firmware/)[![Compare Images](https://images.microbadger.com/badges/image/microros/firmware.svg)](https://microbadger.com/images/microros/firmware)
| micro-ros-olimex-nuttx | Contains a ready to flash example for  Olimex STM32 E407 |[![Docker Automated build](https://img.shields.io/docker/cloud/automated/microros/micro-ros-olimex-nuttx.svg?logo=docker)](https://hub.docker.com/r/microros/micro-ros-olimex-nuttx/)[![Docker Build Status](https://img.shields.io/docker/cloud/build/microros/micro-ros-olimex-nuttx.svg?logo=docker)](https://hub.docker.com/r/microros/micro-ros-olimex-nuttx/)[![Compare Images](https://images.microbadger.com/badges/image/microros/micro-ros-olimex-nuttx.svg)](https://microbadger.com/images/microros/micro-ros-olimex-nuttx)

![Imgea hierarchy](http://www.plantuml.com/plantuml/png/XOzFIoin5CNt-HHft-OzcCmyHn4K5yMs2r4iZAXBIPFRcT3y6MvksWf-UEqC0oCKkWd9oVcTU-uiaaHAphA9Xetnm1_cg-VNweatH6syBGgK-xmsrAHrYe0gU09FkGgkeDHAZPT5QwK_HWYZWXURu4d45Wr1B7PbVf7_PnFZbKqQ4jeXlr31kU3pzWSy-QzXLnOwg2rWRufRurk9qd44HTBN5kwbsjOOajVpO0FozyOGC4Q6B71d50PHhLvudyADapL4tXX0YQhvP6onV2i_5glvuxBwkvOHikweXlZiJtbrSxrS_Fjbt1XqUucG3PTpWAp1KpRj-s28eXEcvp0DBiGnrWbdiM2DWyEOwnNX4z7X9CwEQ_ExBo7uiDD8wjgEtbqDDXXxhH_1Pk1rSlOR)

## Pre-requisite

You need to have docker in your system.
For installing docker, refer to the official documentation at https://www.docker.com/.

## Usage

To get an image, you use `docker pull` command:

* e.g. ```docker pull microros/base```

You can select the tag to use appending `:tag` to the image name

* e.g. ```docker pull microros/base:crystal```

Once you have the image locally, to start it use `docker run`

* e.g. ```docker run -it microros/micro-ros-agent```

`-it` allocates a pseudo-TTY for you and keeps stdin listening.
Another used command is `-v` to map local files with docker container ones.
`-v` is useful in case you may want to flash boards from within a Docker container.

#### base image

It is the base for the rest of the containers.
It contains the necessary micro-ROS setup tools and dependencies.
From this image, you can start any development targeting micro-ROS.

#### firmware image

This image as the base one, it is used as a starting point to those images using firmware.
This image contains a firmware workspace setup and dependencies.


#### micro-ros-agent

This image purpose serves as a stand-alone application.
It includes installation of the ROS 2 version selected by the tag along with a micro-ROS-Agent.
The entry point of this image is directly the micro-ROS-Agent, so upon execution of `docker run` you will be facing micro-ROS-Agent command line input.

* e.g. `docker run -it --net=host microros/micro-ros-agent udp 9999`

Will start micro-ROS-Agent listening UDP messages on port 9999

#### micro-ros-demos

micro-ros-demos is one of the example images.
With this image, you can launch example applications using micro-ROS (Compiled for Linux boxes)
This image entry point has a ROS 2 environment set up with micro-ROS examples.
You can run regular ros2 tool to launch the examples.

* eg: `docker run -it --net=hot microros/micro-ros-demos ros2`

The currently avaiable examples are:
* complex_msg_publisher_c & complex_msg_publisher_cpp
* complex_msg_subscriber_c & complex_msg_subscriber_cpp
* int32_publisher_c & int32_publisher_cpp
* int32_subscriber_c & int32_subscriber_cpp
* string_publisher_c & string_publisher_cpp
* string_subscriber_c & string_subscriber_cpp
* rad0_actuator_c, rad0_altitude_sensor_c, rad0_control_cpp & rad0_display_c

#### micro-ros-olimex-nuttx

This image provides you with a ready-to-flash firmware for Olimex-stm32-e407 with demos embedded on it.
To flash your device you need to map your host machine devices to the Docker container

* e.g. `docker run -it --privileged -v /dev/bus/usb:/dev/bus/usb microros/micro-ros-olimex-nuttx:crystal`

Once inside the container you can flash the board runing `scripts/flash.sh` from `firmware/NuttX` directory.

There you can find a publisher and a subscriber examples.
Both examples use serial transport to communicate with a micro-ROS-Agent, so you should start one with the same transport (You can use the micro-ros-agent imagen to do so).
Once a client-agent communication is stablished you can use `ros2` tools to view the publications from the Olimex or to publish messages to it.

## Automated builds

These Docker files are used for automatically create images on Docker Hub.
These builds are tagged with the ROS 2 version they will be compatible with: e.g. crystal, dashing...
The latest tag will always be the latest release of ROS 2.

These automatic builds has direct relationship with the content of the micro-ROS repositories:

 Image | Triggers 
-|-
base | https://github.com/micro-ROS/micro-ROS-build 
firmware | https://github.com/micro-ROS/apps <br> https://github.com/micro-ROS/NuttX
micro-ros-agent | 
micro-ros-demos | https://github.com/micro-ROS/micro-ROS-demos 
micro-ros-olimex-nuttx |   

Apart from GitHub repositories changes, a build could be triggered whenever the base image is updated on Docker Hub.
Base images are specified in the FROM: directive in the Dockerfile.
