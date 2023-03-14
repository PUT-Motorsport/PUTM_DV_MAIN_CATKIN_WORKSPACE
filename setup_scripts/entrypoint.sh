#!/bin/bash




# DO NOT EDIT BELOW!
./setup_can.sh


# move to dockerfile
echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
cd /home/putm/catkin_ws
catkin_make
mkdir src/
echo "source /home/putm/catkin_ws/devel/setup.bash" >> ~/.bashrc
source devel/setup.bash
#-------------------

roscore