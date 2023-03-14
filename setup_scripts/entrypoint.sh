#!/bin/bash


# DO NOT EDIT BELOW!
./setup_can.sh

if [ $? -ne 0 ]; then
  exit 1
fi


echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
source /opt/ros/noetic/setup.bash
cd /home/putm/catkin_ws/
rm -r build/
rm -r devel/
catkin_make
rm -r src/
mkdir src/
echo "source /home/putm/catkin_ws/devel/setup.bash" >> ~/.bashrc

roscore