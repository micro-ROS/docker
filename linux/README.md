# Linux

## Step 1: using docker container

As an alternative to the installation of the ROS 2 environment on Linux, the user can download and compile a [docker](https://docs.docker.com/install/linux/docker-ce/ubuntu/) image from [here](https://github.com/microROS/docker).

```bash
docker build -t ros2 DOCKER_FILE_PATH
```

## Step 2: create work space

For this step you have to create an empty folder.
Inside it, you have to create an empty folder for the sources files named 'src'.

```bash
mkdir ~/uros_WS
mkdir ~/uros_WS/src
```

`Important:` From this step, all following steps will be executed inside the workspace folder (~/uros_WS).

```bash
cd ~/uros_WS
```

## Step 3: import micro-ROS packages on Linux Debian

For using micro-ROS, You need a predefined group of ROS2 packages.
A [YAML](http://yaml.org/) file for [vcstool](https://github.com/dirk-thomas/vcstool) is provided to sync all the needed sources easily.

For this step you have to download a basic group of packages from [here](https://raw.githubusercontent.com/microROS/micro-ROS-doc/feature/repos/repos/uros_minimum.repos). 
Rename de downloaded file as 'micro_ros.repo' and place it in the same folder where you want to clone all the repositories.

```bash
curl https://raw.githubusercontent.com/microROS/micro-ROS-doc/feature/repos/repos/uros_minimum.repos > micro_ros.repos
```

Then, clone all repos.

```bash
vcs-import src < micro_ros.repos
```

## Step 4: Build micro-ROS on Linux Debian

Build all packages.  

```bash
colcon build --cmake-args -DBUILD_SHARED_LIBS=ON
```

## Step 5: Configure execution environment on Linux

Once colcon has finished building micro-ROS, you need to set up the environment, so it finds all the required DLLs to run applications.
For doing so, colcon has copied for us the following batch file.

```bash
. ./install/local_setup.bat
```

The previous batch, sets up the environment for the current shell session.
From now on we can run our [sample nodes](https://github.com/microROS/micro-ROS-demos/blob/master/README.md).
