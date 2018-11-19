# Environment for micro-ROS on Windows

* PLATFORM: Windows

This image contains all the requirements to compile and run micro-ROS in a Windows environment.

* ROS 2 build environment.
* Required windows installations.

## Build

Due to Docker Hub limitations the only change is to get the image is to build it yourself:

```cmd
docker build -t microros_windows .
```

## Run

Access the container with the following command:

```bash
docker run -it microros_windows
```

At this point, you should be in an environment ready to build and run micro-ROS.
Them you can start the [install and run guide](https://github.com/microROS/micro-ROS-doc/blob/master/docs/install_and_run.md).