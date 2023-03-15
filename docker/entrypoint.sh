#!/bin/bash

echo "source /home/putm/catkin_ws/devel/setup.bash" >> ~/.bashrc
source /opt/ros/noetic/setup.bash


./setup_can.sh
./setup_joy.sh
sleep 5
# if [ $? -ne 0 ]; then
#   exit 1
# fi


cd /home/putm/catkin_ws/
rm -r *
mkdir src/
touch .gitkeep
catkin_make

roscore