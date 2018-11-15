# Windows docker

This dockerfile, one built, generates a Windows image containing all the required dependencies to build micro-ROS.

## Step 1 Build a Docker container

As an alternative to the installation of the ROS 2 environment on Windows, the user can download and compile a [docker](https://docs.docker.com/docker-for-windows/) image from [here](https://github.com/microROS/docker).

```bash
docker build -t ros2 DOCKER_FILE_PATH
```

## Step 2: create workspace

For this step, you have to create an empty folder.
Inside it, you have to create an empty folder for the sources files named 'src'.

```bash
mkdir C:\W
mkdir C:\W\src
```

`Note:` To avoid the error of routes too long (due to the `.NET` library), it is advisable to create the working directory with the shortest route possible. This is, the name of the created folder has to be as short as possible, and the path of it has to be as close as possible to the root directory.

`Important:` From this step, all following steps will be executed inside the workspace folder (C:\W).

```bash
cd C:\W
```

## Step 3: import micro-ROS packages on Windows

For using micro-ROS, you need a predefined group of ROS2 packages.
A [YAML](http://yaml.org/) file for [vcstool](https://github.com/dirk-thomas/vcstool) is provided to sync all the needed sources easily.

For this step, you have to download a fundamental group of packages from [here](https://raw.githubusercontent.com/microROS/micro-ROS-doc/feature/repos/repos/uros_minimum.repos).
Rename de downloaded file as 'micro_ros.repo' and place it in the same folder where you want to clone all the repositories.

```bash
curl --basic https://raw.githubusercontent.com/microROS/micro-ROS-doc/feature/repos/repos/uros_minimum.repos > micro_ros.repos
```

Then, clone all repos.

```bash
vcs-import src < micro_ros.repos
```

## Step 4: Build micro-ROS on Windows

In windows, you need to run [colcon](https://colcon.readthedocs.io/en/released/) build command inside your Visual Studio command prompt ("x64 Native Tools Command Prompt for VS 2017" in our case)

Build all packages.

```bash
colcon build --cmake-args -DBUILD_SHARED_LIBS=ON --merge-install
```

`Note:` To avoid the error of routes too long (due to the `.NET` library), the '--merge-install' flag must be used.

## Step 5: Configure the execution environment on Windows

Once colcon has finished building micro-ROS, you need to set up the environment, so your applications could find all the required DLLs to run.
For doing so, colcon has copied for us the following batch file.

```bash
install\local_setup.bat
```

The previous batch sets up the environment for the current cmd session.
From now on we can run our [sample nodes](https://github.com/microROS/micro-ROS-demos/blob/master/README.md).