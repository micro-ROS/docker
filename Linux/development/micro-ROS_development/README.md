# Environment for micro-ROS on Linux

* PLATFORM: Linux Ubuntu

This image contains all the requirements to compile and run micro-ROS in a Linux environment.

* ROS 2 build environment.
* Linux required packages.

## Build

There are two options to get the image.

1. Build your own the image using the docker file:

    ```bash
    docker build -t microros_linux .
    ```

1. Pull the image from Docker Hub.
    ```bash
    docker pull microros/linux
    ```

## Run

Access the container with the following command:

```bash
docker run -it microros/linux
```

At this point, you should be in an environment ready to build and run micro-ROS.
Them you can start the [install and run guide](https://github.com/microROS/micro-ROS-doc/blob/master/docs/install_and_run.md).