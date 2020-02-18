#!/bin/bash
# Install Robot Operating System (ROS) on Raspbian Buster
# Information from:
# https://wiki.ros.org/ROSberryPi/Installing%20ROS%20Kinetic%20on%20the%20Raspberry%20Pi

# Let's resume installing!

sudo ./src/catkin/bin/catkin_make_isolated --install -DCMAKE_BUILD_TYPE=Release --install-space /opt/ros/kinetic

echo "Source the new ROS installation"
source /opt/ros/kinetic/setup.bash
echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc

echo "Installation complete!"
