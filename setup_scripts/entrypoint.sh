#!/bin/bash


# DO NOT EDIT BELOW!
./setup_can.sh

if [ $? -ne 0 ]; then
  exit 1
fi


echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
cd /home/putm/catkin_ws
source /opt/ros/noetic/setup.bash
rm -r build/
rm -r devel/
catkin_make
mkdir src/
echo "source /home/putm/catkin_ws/devel/setup.bash" >> ~/.bashrc
roscore