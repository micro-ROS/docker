# Environment for micro-ROS simulator platform (as a Docker container)

This is a Docker image to set the proper configuration and dependencies to run Qemu emulating a Cortex M3 MCU.
In this simulation we have NuttX+micro-XRCE-DDS client and micro-XRCE-DDS Agent.


## Build

There are two options to get the image.

1. Build your own the image using the docker file:

    ```bash
    docker build -t microros_sim .
    ```


## Run

Access the container with privileges so that we can flash the board from within:

```bash
docker run -it -v /dev/bus/usb:/dev/bus/usb --privileged microros_sim /bin/bash
```

 Execute the simulator:

```bash
# inside the docker container
cd nuttx
qemu-system-arm -M stm32-f103c8 -serial pty -serial pty -kernel nuttx.bin
```

if successful, you should see something like this:

```bash
root@6dd5e89da46e:~/nuttx# qemu-system-arm -M stm32-f103c8 -serial pty -serial pty -kernel nuttx.bin

(process:69): GLib-WARNING **: 17:15:28.972: ../../../../glib/gmem.c:489: custom memory allocation vtable not supported
char device redirected to /dev/pts/1 (label serial0)
char device redirected to /dev/pts/2 (label serial1)
VNC server running on `127.0.0.1:5900'
LED Off

```

At this point, the simulator is running properly. If you want to try properly microROS you need to follow the next steps:
- Open two auxilary console doing the next steps:
  - In your PC type open a console and type: ``docker ps``
  - Find *microxrcedds_sim* and copy the *CONTAINER ID*
  - Open a new console and type in both: ``docker exec -it <container_id> /bin/bash ``
- In the first opened console, type: ``minicom -D /dev/pts/2``. This will open the NuttX console.
- In the second console, type: `` cd ~/agent_ws/install/uros_agent/lib/uros_agent/ && ./uros_agent serial /dev/pts/1 `` to run Micro-XRCE-DDS Agent.
- Finally come back to the first one and type ``publisher`` to run the client in the simulation.

At this moment, everything is setup properly.


### Important!:
At this moment this is not working properly!
