# Environment for micro-ROS STM32F4 platform (as a Docker container)

- Target board: OLIMEX STM32-E407
- Target microcontroller: STM32F4

This image contains all the dependencies to compile and run micro-ROS in an Olimex STM32-E407:

- NuttX environment.
- CrossCompile tools.
- Micro-ROS environment.

Along with all the dependencies, this image contains micro-ROS publish/subscribe pre-built examples ready to flash and run on the board.

## Build

There are two options to get the image.

1. Build your own the image using the docker file:

    ```bash
    docker build -t microros_hih6130pub .
    ```

1. Pull the image from DockerHub.
    ```bash
    docker pull microros_hih6130pub
    ```

## Run

Access the container with privileges so that we can flash the board from within:

```bash
docker run -it -v /dev/bus/usb:/dev/bus/usb --privileged microros_hih6130pub /bin/bash
```

 Flash the board:

```bash
# inside the docker container
cd nuttx
./script/flash.sh olimex-stm32-e407 uros_hih6130
```

if successful, you should see something like this:

```bash
.
.
.
Info : JTAG tap: stm32f4x.bs tap/device found: 0x06413041 (mfg: 0x020, part: 0x6413, ver: 0x0)
Info : stm32f4x.cpu: hardware has 6 breakpoints, 4 watchpoints
Info : JTAG tap: stm32f4x.cpu tap/device found: 0x4ba00477 (mfg: 0x23b, part: 0xba00, ver: 0x4)
Info : JTAG tap: stm32f4x.bs tap/device found: 0x06413041 (mfg: 0x020, part: 0x6413, ver: 0x0)
target state: halted
target halted due to debug-request, current mode: Thread
xPSR: 0x01000000 pc: 0x080004b4 msp: 0x20000de4
auto erase enabled
Info : device id = 0x10076413
Info : flash size = 1024kbytes
wrote 65536 bytes from file nuttx.bin in 2.157869s (29.659 KiB/s)

```

At this point the board is flashed and is been able to run ``micro-ROS HIH6130 publisher demo``.
