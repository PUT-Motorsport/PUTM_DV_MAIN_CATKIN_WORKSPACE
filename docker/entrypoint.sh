#!/bin/bash

echo "source /home/putm/catkin_ws/devel/setup.bash" >> ~/.bashrc
source /opt/ros/noetic/setup.bash

./setup_can.sh
./setup_joy.sh
sleep 3
# if [ $? -ne 0 ]; then
#   exit 1
# fi

cd /home/putm/catkin_ws/

catkin_make

echo -e "\033[0;32m---> CONTAINER IS READY <---\033[0m"

roscore