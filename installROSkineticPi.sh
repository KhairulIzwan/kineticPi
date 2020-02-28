#!/bin/bash
# Install Robot Operating System (ROS) on Raspbian Buster
# Information from:
# https://wiki.ros.org/ROSberryPi/Installing%20ROS%20Kinetic%20on%20the%20Raspberry%20Pi

# Let's start installing!

echo "Setup ROS Repositories"
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
sudo apt-get update
sudo apt-get upgrade

echo "Install Bootstrap Dependencies"
sudo apt-get install -y python-rosdep python-rosinstall-generator python-wstool python-rosinstall build-essential cmake

echo "Initializing rosdep"
sudo rosdep init
rosdep update

echo "Create a catkin Workspace"
mkdir -p ~/ros_catkin_ws
cd ~/ros_catkin_ws
rosinstall_generator ros_comm common_msgs image_common image_transport_plugins diagnostics nodelet_core rqt --rosdistro kinetic --deps --wet-only --tar > kinetic-ros_comm-common_msgs-image_common-image_transport_plugins-diagnostics-nodelet_core-rqt.rosinstall
wstool init src kinetic-ros_comm-common_msgs-image_common-image_transport_plugins-diagnostics-nodelet_core-rqt.rosinstall

echo "Resolving Unavailable Dependencies"
mkdir -p ~/ros_catkin_ws/external_src
cd ~/ros_catkin_ws/external_src
wget http://sourceforge.net/projects/assimp/files/assimp-3.1/assimp-3.1.1_no_test_models.zip/download -O assimp-3.1.1_no_test_models.zip
unzip assimp-3.1.1_no_test_models.zip
cd assimp-3.1.1
cmake .
make
sudo make install

echo "Resolving Dependencies with rosdep"
cd ~/ros_catkin_ws
$ rosdep install -y --from-paths src --ignore-src --rosdistro kinetic -r --os=debian:buster

echo "Building the catkin Workspace"
sudo apt remove libboost1.67-dev
sudo apt autoremove
sudo apt install -y libboost1.58-dev libboost1.58-all-dev
sudo apt install -y g++-5 gcc-5
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-5 10
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-5 20
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-5 10
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-5 20
sudo update-alternatives --install /usr/bin/cc cc /usr/bin/gcc 30
sudo update-alternatives --set cc /usr/bin/gcc
sudo update-alternatives --install /usr/bin/c++ c++ /usr/bin/g++ 30
sudo update-alternatives --set c++ /usr/bin/g++
sudo apt install -y python-rosdep python-rosinstall-generator python-wstool python-rosinstall build-essential cmake

gedit /home/pi/ros_catkin_ws/src/opencv3/modules/python/src2/cv2.cpp


sudo ./src/catkin/bin/catkin_make_isolated --install -DCMAKE_BUILD_TYPE=Release --install-space /opt/ros/kinetic

echo "Source the new ROS installation"
source /opt/ros/kinetic/setup.bash
echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc

echo "Installation complete!"
