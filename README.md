# Docker

This repository contains docker-related material to setup, configure and develop with [micro-ROS](https://microros.github.io/)
These set of dockerfiles provide ready-to-use environments and applications.
The docker images can be found in [dockerhub](https://hub.docker.com/u/microros).

Avaiable images are listed below:

| Image | Description |
|-------|-------------|
| Base  | Base image with ROSDISTRO installation + micro-ROS specific build system. Used as base of any other micro-ROS image |
|  micro-ROS-Agent | Image containing a pre-compiled micro-ROS-Agent, ready to use as standalone application |
|  micro-ROS-demos | Contains precompiled micro-ROS-demos, ready to use to view micro-ROS funcionality |
|  micro-ROS-NuttX | Contains a firmware ws ready to configure and build micro-ROS |
|   micro-ROS-NuttX-Olimex | Contains a ready to flash example for  Olimex STM32 E407 |

## Pre-requisite

You need to have docker in your system.
For installing docker, refer to https://www.docker.com/.

## Status

Images are automatically build in dockerhub, here you can find the current status of each image

**Base:** [![Docker Automated build](https://img.shields.io/docker/automated/microros/linux.svg?logo=docker)](https://hub.docker.com/r/microros/linux/)
[![Docker Build Status](https://img.shields.io/docker/cloud/build/microros/linux.svg?logo=docker)](https://hub.docker.com/r/microros/linux/)
[![Compare Images](https://images.microbadger.com/badges/image/microros/linux.svg)](https://microbadger.com/images/microros/linux)

**micro-ROS-Agent:** [![Docker Automated build](https://img.shields.io/docker/automated/microros/client_linux.svg?logo=docker)](https://hub.docker.com/r/microros/client_linux/)
[![Docker Build Status](https://img.shields.io/docker/cloud/build/microros/client_linux.svg?logo=docker)](https://hub.docker.com/r/microros/client_linux/)
[![Compare Images](https://images.microbadger.com/badges/image/microros/client_linux.svg)](https://microbadger.com/images/microros/client_linux)

**micro-ROS-demos:** [![Docker Automated build](https://img.shields.io/docker/automated/microros/agent_linux.svg?logo=docker)](https://hub.docker.com/r/microros/agent_linux/)
[![Docker Build Status](https://img.shields.io/docker/cloud/build/microros/agent_linux.svg?logo=docker)](https://hub.docker.com/r/microros/agent_linux/)
[![Compare Images](https://images.microbadger.com/badges/image/microros/agent_linux.svg)](https://microbadger.com/images/microros/agent_linux)

## NuttX

**micro-ROS-firmware:** [![Docker Automated build](https://img.shields.io/docker/automated/microros/stm32-e407.svg?logo=docker)](https://hub.docker.com/r/microros/stm32-e407/)
[![Docker Build Status](https://img.shields.io/docker/cloud/build/microros/stm32-e407.svg?logo=docker)](https://hub.docker.com/r/microros/stm32-e407/)
[![Compare Images](https://images.microbadger.com/badges/image/microros/stm32-e407.svg)](https://microbadger.com/images/microros/stm32-e407)

**micro-ROS-NuttX-:nt stm32-e407:** [![Docker Automated build](https://img.shields.io/docker/automated/microros/client_stm32-e407.svg?logo=docker)](https://hub.docker.com/r/microros/client_stm32-e407/)
[![Docker Build Status](https://img.shields.io/docker/cloud/build/microros/client_stm32-e407.svg?logo=docker)](https://hub.docker.com/r/microros/client_stm32-e407/)
[![Compare Images](https://images.microbadger.com/badges/image/microros/client_stm32-e407.svg)](https://microbadger.com/images/microros/client_stm32-e407/)
