#!/bin/bash

################## DO NOT TOUCH ##################
echo 'source /opt/ros/noetic/setup.bash' >> ~/.bashrc
echo 'source /home/putm/catkin_ws/devel/setup.bash' >> ~/.bashrc
./setup_can.sh
./setup_joy.sh
./detect_xsens.sh
sleep 2
# if [ $? -ne 0 ]; then
#   exit 1
# fi
source /opt/ros/noetic/setup.bash
cd /home/putm/catkin_ws/
catkin_make
source devel/setup.bash

echo -e "\033[0;32m---> CONTAINER IS READY <---\033[0m"
roslaunch launch/main.launch
##################################################
