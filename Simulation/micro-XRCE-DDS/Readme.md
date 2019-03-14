# Environment for micro-ROS simulator platform (as a Docker container)

This is a Docker image that sets the proper configuration and dependencies to run a Micro XRCE-DDS NuttX Client application in an emulated Cortex M3 MCU using Quemu.

This example uses NuttX RTOS, micro-XRCE-DDS client example code and micro-XRCE-DDS Agent.


## Build

Build your own the image using the docker file:

    ```bash
    docker build -t microxrcedds_sim .
    ```


## Run

_Note: the example explained here works with the [commit a495c65](https://github.com/eProsima/Micro-XRCE-DDS-Agent/commit/a495c65faa964ddc068ac6e1249f17f5c9f92787) of Micro XRCE-DDS Agent and NuttX "nuttx-sim-dev" branch [commit 54b0ca9](https://github.com/microROS/NuttX/commit/54b0ca954ae2a734ebef6d1dec589813bfd026a7)._

### Client 1: Micro XRCE-DDS publisher

Open a new terminal and access the container with privileges so that we can run the binary in simulated board at Quemu:

```bash
docker run -it -v /dev/bus/usb:/dev/bus/usb --privileged microxrcedds_sim /bin/bash
```

Execute the simulator running the NuttX binary that contains the RTOS and the client application:

```bash
# inside the docker container
qemu-system-arm -M stm32-f103c8 -serial pty -serial tcp::7777,server -kernel ~/nuttx/nuttx.bin
```

What does it means each argument:
- ``-M stm32-f103c8`` : We want to run the STM32-F103C8 MCU.
- ``-serial pty`` : The first UART will be redirected to a virtual port. This port will be use to connect with micro-XRCE-DDS.
- ``-serial tcp::7777,server`` : This redirect the second UART to a TCP server. If you connect to a this server, you will be able to have access to the console of NuttX.
- ``-kernel ~/nuttx/nuttx.bin`` : Where our binary file that we want to upload to the virtual MCU.

Once you type this command you should see somenthing like this:

```bash
root@80b9715bedfe:~/nuttx# qemu-system-arm -M stm32-f103c8 -serial pty -serial tcp::7777,server -kernel nuttx.bin

(process:118): GLib-WARNING **: 17:19:54.688: ../../../../glib/gmem.c:489: custom memory allocation vtable not supported
char device redirected to /dev/pts/7 (label serial0)
QEMU waiting for connection on: tcp:0.0.0.0:7777,server
VNC server running on `127.0.0.1:5900'
LED Off

```
From all of thoses message are important for us the next messages:
- ``char device redirected to /dev/pts/7 (label serial0)`` : This means that the auxilary port of the board is attached to /dev/pts/7
- ``QEMU waiting for connection on: tcp:0.0.0.0:7777,server`` :  The server is ready to accept a client connection to accept a client.

Open another console(Outside the docker) and type:
``
docker ps
``

The return should be somenthing like this:
```bash
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
69314bb3b922        microxrcedds_sim    "/bin/bash"         7 minutes ago       Up 7 minutes                            determined_volhard

```

Copy the value of **Container ID** and type the next command:
``docker exec -it <container_id> /bin/bash``

Writing in **<container_id>** the previous copy number. For this specific case, will be like this:
``docker exec -it 69314bb3b922 /bin/bash``

Now in this new console, we will execute MicroXRCEAgent. So we need to type the next command:
``./micro-XRCE-DDS-agent/build/MicroXRCEAgent serial /dev/pts/<port_number>``

Being  ``<port_number>`` the auxiliary port assigned when we run QEMU, in this case will be **1**. And this should return somenthing like this:
```bash
root@69314bb3b922:~# ./micro-XRCE-DDS-agent/build/MicroXRCEAgent serial /dev/pts/1
Serial agent initialization... OK
OK
Enter 'q' for exit

```

Now we need to open another console in which will connect to the console of the virtual machine to control it. We need to type the same commands used previously:
``
docker ps
``

The return should be somenthing like this:
```bash
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
69314bb3b922        microxrcedds_sim    "/bin/bash"         7 minutes ago       Up 7 minutes                            determined_volhard

```

Copy the value of **Container ID** and type the next command:
``docker exec -it <container_id> /bin/bash``

Writing in **<container_id>** the previous copy number. For this specific case, will be like this:
``docker exec -it 69314bb3b922 /bin/bash``

Once we are "inside the Docker image", we will connect to the TCP server using **netcat** typing the next comand:
``netcat 0.0.0.0 7777``

This should return the NuttX console:
```bash
root@69314bb3b922: netcat 0.0.0.0 7777

NuttShell (NSH)
nsh>

```

This console will be the publisher console, in the ahead steps will comeback to this console.

Open a new console and type the same command previosly used: ``docker exec -it 69314bb3b922 /bin/bash``
Run another simulation, but for this console we need to change the port, so type the next command:
```bash
# inside the docker container
qemu-system-arm -M stm32-f103c8 -serial pty -serial tcp::8888,server -kernel ~/nuttx/nuttx.bin
```

And should return somenthing like this:
```bash
root@69314bb3b922:~# qemu-system-arm -M stm32-f103c8 -serial pty -serial tcp::8888,server -kernel ~/nuttx/nuttx.bin

(process:80): GLib-WARNING **: 15:52:00.415: ../../../../glib/gmem.c:489: custom memory allocation vtable not supported
char device redirected to /dev/pts/5 (label serial0)
QEMU waiting for connection on: tcp:0.0.0.0:8888,server
```

Open a new console with the same command: ``docker exec -it 69314bb3b922 /bin/bash``
In this new console we will run another agent but connecting to the attached port of the new simulation. We need to type this command:
``./micro-XRCE-DDS-agent/build/MicroXRCEAgent serial /dev/pts/5``

This should return the next:
```bash
root@69314bb3b922: ./micro-XRCE-DDS-agent/build/MicroXRCEAgent serial /dev/pts/5
Serial agent initialization... OK.
OK
Enter 'q' for exit
```
Open a new console with the same command: ``docker exec -it 69314bb3b922 /bin/bash``
In this console we will connect to the console of the second simulation, typing the next command:
``netcat 0.0.0.0 8888``

This return the Nuttx console:
```bash
root@69314bb3b922:~# netcat 0.0.0.0 8888

NuttShell (NSH)
nsh>
```

This will be the subscriber console.

**At this point everything is set-up it left to initialize the Publisher and Subscriber app.**

It should look like this:
![]("images/consoles.png")

Go to the **publisher** console and execute the micro-XRCE-DDS client app, typing the next command: ``client --serial /dev/ttyS1``

Go to the **subscriber** console and execute the micro-XRCE-DDS client app, typing the next command: ``client --serial /dev/ttyS1``

### Creating the publisher and subscriber

_Note: the instructions have been taken from eProsima [documentation](https://micro-xrce-dds.readthedocs.io/en/latest/shapes_demo.html)_

Now that we have two Micro XRCE-DDS clients running, with one terminal attached to the NuttX shell and the Agent connected to the second serial, we are able to set the function of each one.

#### Publisher

Take one of the clients NuttX Shell session and type the next command: `create_session`. The output should be the next:

```bash
create_session
Status: OK

```

Now, type the command `create_participant 1`.The output should be the next:

```
create_participant 1
Status: OK
```

Now, create a topic `create_topic 1 1`.

Now, create publisher `create_publisher 1 1`, and a data writer, `create_datawriter 1 1`.

#### Subscriber

Once we have the publisher working , we need to attach a subscriber to it, using the Micro XRCE-DDS Agent.


Now that the client is running, use the next commands to attach to the client that is going to publish data:

+ `create_session`
+ `create_participant 1`

At this point, you should see in the terminal of both Agents that they have matched:

```
RTPS Participant matched 1.f.0.2.cb.0.0.0.0.0.0.0|0.0.1.c1
```

+ `create_subscriber 1 1`
+ `create_datareader 1 1`

And finally, request data to the publisher:

+ `request_data 1 128 5`

#### Publish data

Now the subscriber is listening and the Agents are matched, publish data using the next command: `write_data 1 128 200 200 40 BLUE`

In the subscriber terminal, you should see how it receives the data:

```
Receiving... [SHAPE_TYPE | color: BLUE | x: 200 | y: 200 | size: 40]            
```
