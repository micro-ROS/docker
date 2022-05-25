^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Changelog for package micro_ros_dockers
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

2.0.0 (2022-05-25)
------------------
* Add Github Action for libgen (`#80 <https://github.com/micro-ROS/docker/issues/80>`_)
* Add Base Docker generation action
* Add Agent Docker generation action
* Add download of esp32 crosscompiler (`#73 <https://github.com/micro-ROS/docker/issues/73>`_)
* support ROS_LOCALHOST_ONLY variable (`#69 <https://github.com/micro-ROS/docker/issues/69>`_)
* Fix wget certificate (`#66 <https://github.com/micro-ROS/docker/issues/66>`_) (`#68 <https://github.com/micro-ROS/docker/issues/68>`_)
* Add agent to demo docker (`#65 <https://github.com/micro-ROS/docker/issues/65>`_)
* Updated entrypoint.sh to parse string arguments (`#62 <https://github.com/micro-ROS/docker/issues/62>`_)
* Initial Galactic
* Use FastDDS as default middleware (`#63 <https://github.com/micro-ROS/docker/issues/63>`_)
* Update to rolling
* Update foxy docker
* Disable shared memory (`#59 <https://github.com/micro-ROS/docker/issues/59>`_)
* Update Kobuki demo to Foxy (`#47 <https://github.com/micro-ROS/docker/issues/47>`_)
* Update static library builder
* Add GCC 9 to builder
* Add static library builder
* Add python-pip3 to base image
* Add issue template
* Add new docker images to readme (`#57 <https://github.com/micro-ROS/docker/issues/57>`_)
* Update micro_ros_setup repo in base image (`#56 <https://github.com/micro-ROS/docker/issues/56>`_)
* Update README.md
* Corrections to the README.md (`#55 <https://github.com/micro-ROS/docker/issues/55>`_)
* Update README with new docker images (`#53 <https://github.com/micro-ROS/docker/issues/53>`_)
* Update micro-ROS-Agent Dockerfile (`#54 <https://github.com/micro-ROS/docker/issues/54>`_)
* typo (`#51 <https://github.com/micro-ROS/docker/issues/51>`_)
* Update README.md
* Properly source micro-ROS/base environment when launching bash (`#50 <https://github.com/micro-ROS/docker/issues/50>`_)
* Add licensing (`#48 <https://github.com/micro-ROS/docker/issues/48>`_)
* Use correct branch when downloading "micro-ros-build" repo on base/Dockerfile (`#49 <https://github.com/micro-ROS/docker/issues/49>`_)
* Initial changes (`#46 <https://github.com/micro-ROS/docker/issues/46>`_)
* Use this docker for running the PC side
* Firmware docker file
* Initial dockerfile for Kobuki demo
* Fix ed dependency. (`#44 <https://github.com/micro-ROS/docker/issues/44>`_)
* Add entrypoint for base. (`#43 <https://github.com/micro-ROS/docker/issues/43>`_)
* Merge pull request `#42 <https://github.com/micro-ROS/docker/issues/42>`_ from micro-ROS/feature/ci
* Add CI base image.
* Merge pull request `#41 <https://github.com/micro-ROS/docker/issues/41>`_ from micro-ROS/feature/clean
* Remove not used dockers.
* Simplify and refactor DockerFiles. (`#40 <https://github.com/micro-ROS/docker/issues/40>`_)
* Fix sh pipe error.
* Hack build system to work with dashing.
* Change Docker tags to use dashing.
* Base firmware image.
* Host client demos working.
* Dashing agent working.
* Use Dashing in base image.
* Merge pull request `#36 <https://github.com/micro-ROS/docker/issues/36>`_ from micro-ROS/fix/paths
* Normalise directory structure.
* Merge pull request `#34 <https://github.com/micro-ROS/docker/issues/34>`_ from micro-ROS/master
* Merge pull request `#33 <https://github.com/micro-ROS/docker/issues/33>`_ from micro-ROS/fix/missing_deps
* Add automake dependency.
* Update links. (`#31 <https://github.com/micro-ROS/docker/issues/31>`_)
* Rework docker images. (`#30 <https://github.com/micro-ROS/docker/issues/30>`_)
* Fixing documentation instructions
* Adding documentation to the HIH6130 publisher demo
* Deleting deprecreated development options
* Merge remote-tracking branch 'origin/docker_sim'
* Adding hih6130 publisher demo
* Fixing Docker
* Update shields to point to docker cloud. (`#28 <https://github.com/micro-ROS/docker/issues/28>`_)
* Fixing micro-ROS docker
* Hotfix/docker build (`#27 <https://github.com/micro-ROS/docker/issues/27>`_)
* Fix Java ppa error. (`#26 <https://github.com/micro-ROS/docker/issues/26>`_)
* Updating the dockercontainer to the new simulation branch
* Make minor fixes
* Improvement of the Readme instructions
* Rework micro-xrce-dds simulation tutorial
* Adding netcat package
* Little changes in the instructions.
* Merge pull request `#25 <https://github.com/micro-ROS/docker/issues/25>`_ from microROS/feature/Crystal_update
* Updating instructions
* Rework Readme to better understanding
* Update Readme with the running error
* Update the Readme with instructions
* Update Readme
* Fix installation path of the simulator
* Update Readme.md
* Minor text change
* Minor text change
* Adding readme
* Adding readme for microros example
* Minor changes in the docker
* Changing the repo of Qemu in the dockerfile
* Adding microROS dockerfile and minor modification in the microXRCEDDS dockerfile
* Adding dockerfile for the simulation
* Add Clang to environment required package
* Update Dockerfile
* Added new required packages for ROS2 Crystal update
* Merge pull request `#24 <https://github.com/micro-ROS/docker/issues/24>`_ from microROS/microros_nuttx_master
* Changing to the microros nuttx/apps repository
* Merge pull request `#23 <https://github.com/micro-ROS/docker/issues/23>`_ from microROS/reorganize
* Solving an error in Olimex docker and adding new stm32l1discovery board docker file
* Changing the repository of NuttX
* Deprecating tms57004 board, adding micrxrcedds docker for L1 board and Olimex board
* Add badges
* Rename folder
* Update Olimex dockerfile
* Unify precompiled linux dockerfiles
* Unify NuttX precompiled dockerfiles
* Update latest ubuntu
* Update ubuntu version
* Unify all versions in one
* Add linux docker readme
* Remove duplicated dockerfile
* Add windows image
* Add README to Linux folder
* Add base Linux image
* Feature/linuximage (`#8 <https://github.com/micro-ROS/docker/issues/8>`_)
* Move micro-ROS Ubuntu 16.04 development Docker file
* Added gdbserver
* Added libcurlpp-dev apt package
* ROS2 - development tools using Ubuntu 16.04
* Add micro-ROS Ubuntu 18.04 development Docker file
* Added gdbserver
* Added libcurlpp-dev apt package
* ROS2 - development tools using Ubuntu 18.04
* Update README
* Add micro-ROS Ubuntu development Docker file
* Add micro-ROS Agent Ubuntu 16.04 file
* Added gdbserver
* Added libcurlpp-dev apt package
* Renamed folder
* ROS2 - development tools using Ubuntu latest
* Move micro-ROS Agent Ubuntu 16.04 Docker file
* Added ROS2 - Quick start agent for ubuntu 16.04
* Move micro-ROS Agent Ubuntu 18.04 Docker file
* Added ROS2 - Quick start agent for ubuntu 18.04
* Move micro-ROS Agent Docker file
* Update README
* Added Quick start Agent
* Move Ubuntu 16.04 micro-ROS client
* Added ROS2&Nuttx - Quick start client for ubuntu 16.04
* Move Ubuntu 18.04 micro-ROS client
* Added ROS2&Nuttx - Quick start client for ubuntu 18.04
* Update README
* Change micro-ROS Client Ubuntu latest
* Added ROS2&Nuttx - Quick start client for ubuntu
* Move NuttX Olimex Ubuntu 16.04 Docker file
* Added gdbserver
* Added libcurlpp-dev apt package
* ROS2 - development tools using Ubuntu 16.04
* Move NuttX Olimex Ubuntu 18.04 Docker file
* Added gdbserver
* Added libcurlpp-dev apt package
* ROS2 - development tools using Ubuntu 18.04
* Move NuttX Olimex Docker file
* Added gdbserver
* Added libcurlpp-dev apt package
* Renamed folder
* ROS2 - development tools using Ubuntu latest
* Restructure content
* Update README
* Reorganize docker containers into folders
* Merge pull request `#21 <https://github.com/micro-ROS/docker/issues/21>`_ from microROS/fix_olimex_stm32_e407
* Merge pull request `#22 <https://github.com/micro-ROS/docker/issues/22>`_ from microROS/fix_l1
* Update Olimex dockerfile
* Update L1 dockerfile
* Merge pull request `#2 <https://github.com/micro-ROS/docker/issues/2>`_ from BorjaOuterelo/master
* Fixes dockerfile and exp script errors
* define target uC for olimex board
* Add short README
* Initial commit
