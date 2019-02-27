# Environment for micro-ROS simulator platform (as a Docker container)

This is a Docker image to set the proper configuration and dependencies to run Qemu emulating a Cortex M3 MCU.
In this simulation we have NuttX+micro-XRCE-DDS client and micro-XRCE-DDS Agent.


## Build

There are two options to get the image.

1. Build your own the image using the docker file:

    ```bash
    docker build -t microXRCEDDS_sim .
    ```


## Run

Access the container with privileges so that we can flash the board from within:

```bash
docker run -it -v /dev/bus/usb:/dev/bus/usb --privileged microXRCEDDS_sim /bin/bash
```

 Execute the simulator:

```bash
# inside the docker container
cd nuttx
qemu-system-arm -M stm32-f103c8 -serial pty -serial pty -kernel nuttx.bin
```

If success, you should see something like this:

```bash
root@6dd5e89da46e:~/nuttx# qemu-system-arm -M stm32-f103c8 -serial pty -serial pty -kernel nuttx.bin

(process:69): GLib-WARNING **: 17:15:28.972: ../../../../glib/gmem.c:489: custom memory allocation vtable not supported
char device redirected to /dev/pts/1 (label serial0)
char device redirected to /dev/pts/2 (label serial1)
VNC server running on `127.0.0.1:5900'
LED Off

```

At this point, the simulator is running properly. You need to open two auxiliary consoles.
Follow the next steps:
- Obtain the container ID typing ``docker ps``.
- Find *microXRCEDDS_sim* and copy the *CONTAINER ID*
- Type the next command to run an auxilary  console: ``docker exec -it <container_id> /bin/bash ``
- Qemu creates two serial port "/dev/pts/x". The first one will be the NuttX console and the second port is the auxilary port of the board.
