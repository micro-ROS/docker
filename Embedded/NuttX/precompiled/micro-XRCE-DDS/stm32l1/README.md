# Pre-compiled image of NuttX with micro-XRCE-DDS

- Target board: STM32L1Discovery Board
- Target microcontroller: STM32L152RCT6


Build the container and compile ready to work `micro XRCE-DDS` with a subscriber and a publisher for the `STM32L1Discovery` board:
```bash
docker build -t microros_uxdl1 .
```
Access the container with privileges so that we can flash the board from within:
```bash
docker run -it -v /dev/bus/usb:/dev/bus/usb --privileged microros_uxdl1 /bin/bash
```
Flash the board:
```bash
# inside the docker container
cd nuttx
./scripts/flash.sh stm32l1
```
if successful, you should see something like this:
```
Info : Device: STM32L1xx (Cat.3 - Medium+ Density)
Info : STM32L flash size is 256kb, base address is 0x8000000
target halted due to breakpoint, current mode: Thread
xPSR: 0x61000000 pc: 0x20000012 msp: 0x20000a58
target halted due to breakpoint, current mode: Thread
xPSR: 0x61000000 pc: 0x20000012 msp: 0x20000a58
target halted due to breakpoint, current mode: Thread
xPSR: 0x61000000 pc: 0x20000012 msp: 0x20000a58
target halted due to breakpoint, current mode: Thread
xPSR: 0x61000000 pc: 0x20000012 msp: 0x20000a58
target halted due to breakpoint, current mode: Thread
xPSR: 0x61000000 pc: 0x20000012 msp: 0x20000a58
target halted due to breakpoint, current mode: Thread
xPSR: 0x61000000 pc: 0x20000012 msp: 0x20000a58
target halted due to breakpoint, current mode: Thread
xPSR: 0x61000000 pc: 0x20000012 msp: 0x20000a58
target halted due to breakpoint, current mode: Thread
xPSR: 0x61000000 pc: 0x20000012 msp: 0x20000a58
target halted due to breakpoint, current mode: Thread
xPSR: 0x61000000 pc: 0x20000012 msp: 0x20000a58
target halted due to breakpoint, current mode: Thread
xPSR: 0x61000000 pc: 0x20000012 msp: 0x20000a58
wrote 86016 bytes from file nuttx.bin in 11.067871s (7.590 KiB/s)


```
