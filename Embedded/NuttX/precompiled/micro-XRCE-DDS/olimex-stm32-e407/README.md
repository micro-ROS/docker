# Pre-compiled image of NuttX with micro-XRCE-DDS

- Target board: OLIMEX STM32-E407
- Target microcontroller: STM32F4


Build the container and compile ready to work `micro XRCE-DDS` with a subscriber and a publisher for the `OLIMEX STM32-E407` board:
```bash
docker build -t microros_uxdf4 .
```
Access the container with privileges so that we can flash the board from within:
```bash
docker run -it -v /dev/bus/usb:/dev/bus/usb --privileged microros_uxdf4 /bin/bash
```
Flash the board:
```bash
# inside the docker container
cd nuttx
./scripts/flash.sh olimex-stm32-e407
```
if successful, you should see something like this:


```
cortex_m reset_config sysresetreq
Info : clock speed 2000 kHz
Info : JTAG tap: stm32f4x.cpu tap/device found: 0x4ba00477 (mfg: 0x23b (ARM Ltd.), part: 0xba00, ver: 0x4)
Info : JTAG tap: stm32f4x.bs tap/device found: 0x06413041 (mfg: 0x020 (STMicroelectronics), part: 0x6413, ver: 0x0)
Info : stm32f4x.cpu: hardware has 6 breakpoints, 4 watchpoints
adapter speed: 2000 kHz
Info : JTAG tap: stm32f4x.cpu tap/device found: 0x4ba00477 (mfg: 0x23b (ARM Ltd.), part: 0xba00, ver: 0x4)
Info : JTAG tap: stm32f4x.bs tap/device found: 0x06413041 (mfg: 0x020 (STMicroelectronics), part: 0x6413, ver: 0x0)
target halted due to debug-request, current mode: Thread
xPSR: 0x01000000 pc: 0x08000188 msp: 0x20006a70
auto erase enabled
Info : device id = 0x10076413
Info : flash size = 1024kbytes
wrote 131072 bytes from file nuttx.bin in 3.916489s (32.682 KiB/s)
```
