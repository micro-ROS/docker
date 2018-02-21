# Environment for micro-ROS STM32L152 platform (as a Docker container)

- Target board: STM32L1DISCOVERY
- Target microcontroller: STM132L152RCT6

Build the container and compile a simple `nsh` aplication for the `STM32L1Discovery` board:
```
sudo docker build -t stm32l1discovery:lastest .
```
Access the container with privileges so that we can flash the board from within:
```
sudo docker run -it -v /dev/bus/usb:/dev/bus/usb --privileged stm32l1discovery:lastest /bin/bash
```
Flash the board:
```
# inside the docker container
cd nuttx
openocd -f interface/stlink-v2.cfg -f target/stm32l1.cfg -c init -c "reset halt" -c "flash write_image erase nuttx.bin 0x08000000"
```
if successful, you should see something like this:
```
...
Info : STM32L flash has dual banks. Bank (0) size is 192kb, base address is 0x8000000
target state: halted
target halted due to breakpoint, current mode: Thread 
xPSR: 0x61000000 pc: 0x20000012 msp: 0x20000a58
target state: halted
target halted due to breakpoint, current mode: Thread 
xPSR: 0x61000000 pc: 0x20000012 msp: 0x20000a58
target state: halted
target halted due to breakpoint, current mode: Thread 
xPSR: 0x61000000 pc: 0x20000012 msp: 0x20000a58
target state: halted
target halted due to breakpoint, current mode: Thread 
xPSR: 0x61000000 pc: 0x20000012 msp: 0x20000a58
wrote 36864 bytes from file nuttx.bin in 4.693865s (7.670 KiB/s)

```
