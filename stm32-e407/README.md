# Environment for micro-ROS STM32F4 platform (as a Docker container)

- Target board: OLIMEX STM32-E407
- Target microcontroller: ?

Build the container and compile a simple `nsh` aplication for the `OLIMEX STM32-E407` board:
```bash
docker build -t microros_stm32f4 .
```
Access the container with privileges so that we can flash the board from within:
```bash
docker run -it -v /dev/bus/usb:/dev/bus/usb --privileged microros_stm32f4 /bin/bash
```
Flash the board:
```bash
# inside the docker container
cd nuttx
openocd -f interface/ftdi/olimex-arm-usb-tiny-h.cfg -f target/stm32f4x.cfg -c init -c "reset halt" -c "flash write_image erase nuttx.bin 0x08000000"
```
if successful, you should see something like this:
```bash
...
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
