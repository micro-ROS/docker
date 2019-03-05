# Environment for micro-ROS simulator platform (as a Docker container) WIP!

This is a Docker image to set the proper configuration and dependencies to run Qemu emulating a Cortex M3 MCU.
In this simulation we have NuttX + micro-ROS client.

-----

:warning: This is still a work in progress, the example is NOT running properly :warning:

------------

## Build

Build your own the image using the docker file:

    ```bash
    docker build -t microros_sim .
    ```


## Run

Access the container with privileges so that we can run the firmware in the simulator:

```bash
docker run -it -v /dev/bus/usb:/dev/bus/usb --privileged microros_sim /bin/bash
```

 Execute the simulator with the precompiled example of NuttX:

```bash
# inside the docker container
cd nuttx
qemu-system-arm -M stm32-f103c8 -serial pty -serial pty -kernel nuttx.bin
```

if success, you should see something like this:

```bash
root@6dd5e89da46e:~/nuttx# qemu-system-arm -M stm32-f103c8 -serial pty -serial pty -kernel nuttx.bin

(process:69): GLib-WARNING **: 17:15:28.972: ../../../../glib/gmem.c:489: custom memory allocation vtable not supported
char device redirected to /dev/pts/1 (label serial0)
char device redirected to /dev/pts/2 (label serial1)
VNC server running on `127.0.0.1:5900'
LED Off
```

At this point, the simulator is running. You can see how the simulator open two serial ports, the first one belongs to the NuttX Shell, where we are able to run commands and applications. The second's purpose is to have a communication channel between the client and the micro-ROS Agent.


If you want to try running micro-ROS client example, you need to follow the next steps:
- Open two auxiliary console doing the next steps:
  - In your PC type open a console and type: ``docker ps``
  - Find *microros_sim* and copy the *CONTAINER ID*
  - Open a new console and type in both: ``docker exec -it <container_id> /bin/bash ``
- In the first opened console, type: ``minicom -D /dev/pts/1``. This will stablish connections with the NuttX Shell session.

### ERROR

In the recently opened session, you can type `?` to see which are the available NuttX applications to run:

```
nsh> ?
help usage:  help [-v] [<cmd>]

  [           dd          help        mh          sleep       xd          
  ?           echo        hexdump     mw          test        
  cat         exec        kill        pwd         true        
  cd          exit        ls          set         unset       
  cp          false       mb          sh          usleep      

Builtin Apps:
  publisher                                                                                                                                         
  subscriber                                                                                                                                        
  ```

  If you try to to run the subscriber or the publisher, next error pops-up:

  ```
  nsh> subscriber                                                                          
[rclc_init] error in rcl_init: allocation failed, at /root/uros_ws/src/ros2/rcl/rcl/src/rcl/rcl.c:137
[rclc_create_node] error in rcl_node_init: rcl_init() has not been called, at /root/uros_ws/src/ros2/rcl/rcl/src/rcl/node.c:165
Issues creating node   
```
