#!/bin/bash

./setup_can.sh

sleep 2

# if [ $? -ne 0 ]; then
#   exit 1
# fi

source /opt/ros/noetic/setup.bash
cd /home/putm/catkin_ws/
rm -r *
mkdir src/
catkin_make

echo "source /home/putm/catkin_ws/devel/setup.bash" >> ~/.bashrc

roscore