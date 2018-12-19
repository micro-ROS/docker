# Environment for micro-ROS STM32F4 platform (as a Docker container)

- Target board: STM32L1Discovery Board
- Target microcontroller: STM32L152RCT6

Build the container and compile a simple `nsh` aplication for the `STM32L1Discovery` board:
```bash
docker build -t microros_stm32l1 .
```
Access the container with privileges so that we can flash the board from within:
```bash
docker run -it -v /dev/bus/usb:/dev/bus/usb --privileged microros_stm32l1 /bin/bash
```
Flash the board:
```bash
# inside the docker container
cd nuttx
./scripts/flash.sh stm32l1
```
if successful, you should see something like this:
```bash
auto erase enabled
Info : Device: STM32L1xx (Cat.3 - Medium+ Density)
Info : STM32L flash size is 256kb, base address is 0x8000000
target halted due to breakpoint, current mode: Thread
xPSR: 0x61000000 pc: 0x20000012 msp: 0x2000169c
target halted due to breakpoint, current mode: Thread
xPSR: 0x61000000 pc: 0x20000012 msp: 0x2000169c
target halted due to breakpoint, current mode: Thread
xPSR: 0x61000000 pc: 0x20000012 msp: 0x2000169c
target halted due to breakpoint, current mode: Thread
xPSR: 0x61000000 pc: 0x20000012 msp: 0x2000169c
target halted due to breakpoint, current mode: Thread
xPSR: 0x61000000 pc: 0x20000012 msp: 0x2000169c
target halted due to breakpoint, current mode: Thread
xPSR: 0x61000000 pc: 0x20000012 msp: 0x2000169c
wrote 49152 bytes from file nuttx.bin in 6.370747s (7.534 KiB/s)


```
