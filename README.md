# kineticPi

> Installing ROS-Kinetic for Raspbian Buster requires a lot of patience. But here is the script files which will save your time buddies!

Here are the steps for installing ROS-Kinetic on Raspbian Buster:
1. git clone https://github.com/KhairulIzwan/kineticPi.git
2. cd kineticPi/
3. ./installROSkineticPi.sh

> IF ERROR PERSIST!
>> 1. gedit /home/pi/ros_catkin_ws/src/opencv3/modules/python/src2/cv2.cpp
>> 2. Find line 885
>> Replace:
>> char* str = PyString_AsString(obj);
>> with
>> const char* str = PyString_AsString(obj);

**INSTALLING GEDIT**
1. sudo apt-get install gedit

> Creating the ROS Workspace
Here is the step:
1. ./setupROSworkspace.sh
