# kineticPi

> Installing ROS-Kinetic for Raspbian Buster requires a lot of patience. But here is the script files which will save your time buddies!

Here are the steps for installing ROS-Kinetic on Raspbian Buster:
1. git clone https://github.com/KhairulIzwan/kineticPi.git
2. cd kineticPi/
3. ./installROSkineticPi.sh

> IF ERROR PERSIST! -- OpenCV
>> 1. gedit /home/pi/ros_catkin_ws/src/opencv3/modules/python/src2/cv2.cpp
>> 2. Find line 885
>> Replace:
>> 
>>> char* str = PyString_AsString(obj);
>> 
>> with
>> 
>>> const char* str = PyString_AsString(obj);
>> 3. cd ~/ros_catkin
>> 4. ./installROSkineticPi_resume.sh

> IF ERROR PERSIST! -- camera_calibration_parser
>> 1. cd ~/ros_catkin_ws/src/image_common/camera_calibration_parsers
>> 2. gedit CMakelist.txt
>> 3. Add on:
>> 
>>> add_compile_options(-std=c++11)
>> 4. cd ~/ros_catkin
>> 5. ./installROSkineticPi_resume.sh

> IF ERROR PERSIST! -- qt_gui_core
>> 1. cd ~/ros_catkin_ws/src
>> 2. sudo rm -rf qt_gui_core
>> 3. git clone https://github.com/ros-visualization/qt_gui_core.git
>> 4. cd ~/ros_catkin
>> 5. ./installROSkineticPi_resume.sh

> IF ERROR PERSIST! -- python_qt_binding
>> 1. cd ~/ros_catkin_ws/src
>> 2. sudo rm -rf qt_gui_core
>> 3. git clone https://github.com/ros-visualization/python_qt_binding.git
>> 4. cd ~/ros_catkin
>> 5. ./installROSkineticPi.sh

**INSTALLING GEDIT**
1. sudo apt-get install gedit

> Creating the ROS Workspace
Here is the step:
1. ./setupROSworkspace.sh
