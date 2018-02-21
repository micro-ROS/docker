# Environment for micro-ROS Hercules platform (as a Docker container)

- Target board: LAUNCHXL-TMS57004
- Target microcontroller: TMS570LS0432

Build the container and compile a simple `nsh` aplication for the `LAUNCHXL-TMS57004` board:
```
docker build -t microros_hercules:alpha .
```
Access the container:
```
docker run -it nuttx_hercules:alpha
```
Flash the board:
TODO
