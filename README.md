# micro-ROS Dockers

This repository contains Docker-related material to setup, configure and develop a [micro-ROS](https://microros.github.io/)-based application.

This set of Dockerfiles provide ready-to-use environments to easily execute micro-ROS examples in your host machine, as well as use the standalone [micro-ROS build system]()https://github.com/micro-ROS/micro_ros_setup.
Plus, two additional images to use micro-ROS as an external library, both in [ESP-IDF](https://github.com/micro-ROS/micro_ros_espidf_component/tree/foxy/docker) and within [Arduino IDE](https://github.com/micro-ROS/micro_ros_arduino/tree/foxy/extras/library_generation), are provided.

The Docker images are available in [dockerhub](https://hub.docker.com/u/microros).

Avaiable images are listed below:

| Image | Description | Status
-|-|-:
| base  | Base image with a ROS 2 Foxy installation + micro-ROS specific build system tools. Used as base of any other micro-ROS image | [![Docker Automated build](https://img.shields.io/docker/cloud/automated/microros/base.svg?logo=docker)](https://hub.docker.com/r/microros/base/)[![Docker Build Status](https://img.shields.io/docker/cloud/build/microros/base.svg?logo=docker)](https://hub.docker.com/r/microros/base/)[![Compare Images](https://images.microbadger.com/badges/image/microros/base.svg)](https://microbadger.com/images/microros/base)
| micro-ros-agent | Image containing a pre-compiled micro-ROS-Agent, ready to use as a standalone application | [![Docker Automated build](https://img.shields.io/docker/cloud/automated/microros/micro-ros-agent.svg?logo=docker)](https://hub.docker.com/r/microros/micro-ros-agent/)[![Docker Build Status](https://img.shields.io/docker/cloud/build/microros/micro-ros-agent.svg?logo=docker)](https://hub.docker.com/r/microros/micro-ros-agent/)[![Compare Images](https://images.microbadger.com/badges/image/microros/micro-ros-agent.svg)](https://microbadger.com/images/microros/micro-ros-agent)
| micro-ros-demos | Contains pre-compiled micro-ROS demo applications, ready to use to get a taste of micro-ROS capabilities | [![Docker Automated build](https://img.shields.io/docker/cloud/automated/microros/micro-ros-demos.svg?logo=docker)](https://hub.docker.com/r/microros/micro-ros-demos/)[![Docker Build Status](https://img.shields.io/docker/cloud/build/microros/micro-ros-demos.svg?logo=docker)](https://hub.docker.com/r/microros/micro-ros-demos/)[![Compare Images](https://images.microbadger.com/badges/image/microros/micro-ros-demos.svg)](https://microbadger.com/images/microros/micro-ros-demos)
| micro-ros-olimex-nuttx | Contains a ready to flash example for  Olimex STM32 E407 |[![Docker Automated build](https://img.shields.io/docker/cloud/automated/microros/micro-ros-olimex-nuttx.svg?logo=docker)](https://hub.docker.com/r/microros/micro-ros-olimex-nuttx/)[![Docker Build Status](https://img.shields.io/docker/cloud/build/microros/micro-ros-olimex-nuttx.svg?logo=docker)](https://hub.docker.com/r/microros/micro-ros-olimex-nuttx/)[![Compare Images](https://images.microbadger.com/badges/image/microros/micro-ros-olimex-nuttx.svg)](https://microbadger.com/images/microros/micro-ros-olimex-nuttx)
| micro_ros_arduino_builder | Allows to use a pre-compiled micro-ROS library to develop applications using Arduino IDE |[![Docker Automated build](https://img.shields.io/docker/cloud/automated/microros/micro_ros_arduino_builder.svg?logo=docker)](https://hub.docker.com/r/microros/micro_ros_arduino_builder/)[![Docker Build Status](https://img.shields.io/docker/cloud/build/microros/micro_ros_arduino_builder.svg?logo=docker)](https://hub.docker.com/r/microros/micro_ros_arduino_builder/)[![Compare Images](https://images.microbadger.com/badges/image/microros/micro_ros_arduino_builder.svg)](https://microbadger.com/images/microros/micro_ros_arduino_builder)
| esp-idf-microros | Allows to use micro-ROS as a component of the ESP-IDF build system |[![Docker Automated build](https://img.shields.io/docker/cloud/automated/microros/esp-idf-microros.svg?logo=docker)](https://hub.docker.com/r/microros/esp-idf-microros/)[![Docker Build Status](https://img.shields.io/docker/cloud/build/microros/esp-idf-microros.svg?logo=docker)](https://hub.docker.com/r/microros/esp-idf-microros/)[![Compare Images](https://images.microbadger.com/badges/image/microros/esp-idf-microros.svg)](https://microbadger.com/images/microros/esp-idf-microros)

![](http://www.plantuml.com/plantuml/svg/VP71JiCm38RlUGfhzsXtn65lW0GFC6M9kreqpMHdWaeyF6v26b3HRlRt_wxzDoV9ZlCzJiQC510yiP-mrXXlUO68yO8incJA4q8apyc-lhn1IFuT6IYwAmgCXEpOZuinVd8YS42vCOhGSAGm7C09RAHPECdJa3wNece3JIXR51mlJh1RrcvdgHTfPVMGENTtQH_O0yRV-qlxl_sirTbnkDES-i0Fs8reJAkHRGDzGYaOemYUlsn87xCjaHfXkexPRjzTfMwiQVwoUlBsMxjG5vrm3klJVWC0)

## Pre-requisites

You need to have **Docker** in your system.
For installing Docker, refer to the official documentation at https://www.docker.com/.

## Usage

To get an image, you use `docker pull` command:

* e.g. `docker pull microros/base`

You can select the tag to use appending `:tag` to the image name

* e.g. `docker pull microros/base:foxy`

Once you have the image locally, to start it use `docker run`. It is not mandatory, although usually useful, to launch your containers using the `--rm` and `--net=host` flags

* e.g. `docker run -it --rm --net=host microros/micro-ros-agent:foxy`

`-it` allocates a pseudo-TTY for you and keeps stdin listening.
Another used command is `-v` to map local files with docker container ones.
`-v` is useful in case you may want to flash boards from within a Docker container.

#### base image

It is the base for the rest of the containers.
It contains the necessary micro-ROS setup tools and dependencies.
From this image, you can start any development targeting micro-ROS.


#### micro-ros-agent

This image purpose is being used as a stand-alone application.
It includes installation of the ROS 2 version selected by the tag along with a micro-ROS-Agent.
The entry point of this image is directly the micro-ROS-Agent, so upon execution of `docker run` you will be facing micro-ROS-Agent command line input.

* e.g. `docker run -it --net=host microros/micro-ros-agent:foxy udp4 -p 9999`

Will start micro-ROS-Agent listening UDP messages on port 9999.

#### micro-ros-demos

micro-ros-demos is one of the example images.
With this image, you can launch example applications using micro-ROS (Compiled for Linux machines).
This image entry point has a ROS 2 environment set up with micro-ROS examples.
You can run regular ros2 tool to launch the examples.

* eg: `docker run -it --net=host microros/micro-ros-demos bash`

The currently available examples are listed [here](https://github.com/micro-ROS/micro-ROS-demos/rclc):

#### micro-ros-olimex-nuttx

This image provides you with a ready-to-flash firmware for Olimex-stm32-e407 with demos embedded on it.
To flash your device you need to map your host machine devices to the Docker container

* e.g. `docker run -it --privileged -v /dev/bus/usb:/dev/bus/usb microros/micro-ros-olimex-nuttx:foxy`

Once inside the container you can flash the board runing `scripts/flash.sh` from `firmware/NuttX` directory.

There you can find a publisher and a subscriber examples.
Both examples use serial transport to communicate with a micro-ROS-Agent, so you should start one with the same transport (You can use the micro-ros-agent imagen to do so).
Once a client-agent communication is stablished you can use `ros2` tools to view the publications from the Olimex or to publish messages to it.

## Automated builds

These Dockerfiles are used for automatically create images on Docker Hub.
These builds are tagged with the ROS 2 version they will be compatible with: e.g. dashing, foxy...
The latest tag will always be the latest release of ROS 2.

These automatic builds have direct relationship with the content of the micro-ROS repositories:

 Image | Triggers
-|-
base | https://github.com/micro-ROS/micro-ROS-build
micro-ros-agent | https://github.com/micro-ROS/micro-ROS-Agent <br> https://github.com/eProsima/Micro-XRCE-DDS-Agent
micro-ros-demos | https://github.com/micro-ROS/micro-ROS-demos
micro_ros_arduino_builder | https://github.com/micro-ROS/micro_ros_arduino
esp-idf-microros | https://github.com/micro-ROS/micro_ros_espidf_component

Apart from GitHub repositories changes, a build could be triggered whenever the base image is updated on Docker Hub.
Base images are specified in the FROM: directive in the Dockerfile.

## Purpose of the Project

This software is not ready for production use. It has neither been developed nor
tested for a specific use case. However, the license conditions of the
applicable Open Source licenses allow you to adapt the software to your needs.
Before using it in a safety relevant setting, make sure that the software
fulfills your requirements and adjust it according to any applicable safety
standards, e.g., ISO 26262.

## License

This repository is open-sourced under the Apache-2.0 license. See the
[LICENSE](LICENSE) file for details.

For a list of other open-source components included in this repository,
see the file [3rd-party-licenses.txt](3rd-party-licenses.txt).

## Known Issues/Limitations

Please notice the following issues/limitations:

* There is an unknown issue when dealing with serial ports shared with the micro-ROS agent running inside a Docker. Sometimes it works with a remarkable packet loss.
