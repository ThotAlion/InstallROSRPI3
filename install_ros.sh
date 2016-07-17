#!/usr/bin/env bash


DISTRO=vivid  ## the basic tools from ROS's Ubuntu Vivid Distribution
              ## also work with Debian Stretch


## http://wiki.ros.org/jade/Installation/Ubuntu#jade.2BAC8-Installation.2BAC8-Sources.Setup_your_sources.list

sudo -E apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 0xB01FA116
sudo sh -c "echo \"deb http://packages.ros.org/ros/ubuntu $DISTRO main\" > /etc/apt/sources.list.d/ros-latest.list"

sudo apt-get update
sudo apt-get install cmake python-nose libgtest-dev ## needed to work on Beaglebone Black

## http://wiki.ros.org/jade/Installation/Source
sudo apt-get install python-rosdep python-rosinstall-generator python-wstool python-rosinstall build-essential

sudo -E rosdep init
rosdep update

mkdir ~/ros_catkin_ws
cd    ~/ros_catkin_ws

rosinstall_generator ros_comm --rosdistro jade --deps --wet-only --tar > jade-ros_comm-wet.rosinstall
wstool init -j8 src jade-ros_comm-wet.rosinstall

sudo apt-get install -y libboost-all-dev python-empy libconsole-bridge-dev libtinyxml-dev liblz4-dev libbz2-dev
./src/catkin/bin/catkin_make_isolated --install -DCMAKE_BUILD_TYPE=Release

sudo apt-get install python-netifaces
