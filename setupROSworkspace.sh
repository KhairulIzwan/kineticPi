#!/bin/bash
# Create a Catkin Workspace and setup ROS environment variables
# Usage setupCatkinWorkspace.sh dirName

source /opt/ros/kinetic/setup.bash
DEFAULTDIR=~/catkin_ws
CLDIR="$1"
if [ ! -z "$CLDIR" ]; then 
 DEFAULTDIR=~/"$CLDIR"
fi
if [ -e "$DEFAULTDIR" ] ; then
  echo "$DEFAULTDIR already exists; no action taken" 
  exit 1
else 
  echo "Creating Catkin Workspace: $DEFAULTDIR"
fi
echo "$DEFAULTDIR"/src
mkdir -p "$DEFAULTDIR"/src
cd "$DEFAULTDIR"/src
catkin_init_workspace
cd "$DEFAULTDIR"
catkin_make

echo "Set ROS Kinetic environment variables"
echo "#Set ROS Kinetic" >> ~/.bashrc
echo "export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH" >> ~/.bashrc
echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc
echo "source /home/pi/catkin_ws/devel/setup.bash" >> ~/.bashrc
echo "source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc

echo "#Set ROS Network"
echo "export ROS_HOSTNAME=localhost" >> ~/.bashrc
echo "export ROS_MASTER_URI=http://${ROS_HOSTNAME}:11311" >> ~/.bashrc

echo "#Set ROS alias command"
echo "alias cw='cd ~/catkin_ws && clear'" >> ~/.bashrc
echo "alias cs='cd ~/catkin_ws/src && clear'" >> ~/.bashrc
echo "alias cm='cd ~/catkin_ws && rosdep install -y --from-paths src --ignore-src --rosdistro kinetic -r --os=debian:buster && catkin_make && rospack profile && clear'" >> ~/.bashrc

echo "#Additional ROS alias command"
echo "alias eb='gedit ~/.bashrc'" >> ~/.bashrc
echo "alias sb='source ~/.bashrc'" >> ~/.bashrc
echo "alias gs='git status'" >> ~/.bashrc
echo "alias gp='git pull'" >> ~/.bashrc

echo "#Set ROS editor"
echo "export EDITOR='gedit -w'" >> ~/.bashrc

echo "alias git-up='git add . && git commit -m "Update on 'date'" && git push origin master'" >> ~/.bashrc

source ~/.bashrc
clear
echo "The Workspace is READY!"
