#!/bin/bash

PATH_TO_SHARE_WITH_CONTAINER="/home/mateusz/PUTM_DV_MAIN_CATKIN_WORKSPACE/catkin_ws/"

IMAGE_NAME="putm_dv_main_catkin_workspace"
CONTAINER_NAME="putm_dv_main_catkin_workspace"

docker build -t $IMAGE_NAME .

sudo docker run --privileged \
                --name $CONTAINER_NAME \
                -v /dev:/dev \
                --cap-add=ALL \
                --network=host \
                -v $PATH_TO_SHARE_WITH_CONTAINER:/home/putm/catkin_ws \
                -v /lib/modules:/lib/modules \
                -v /run/udev:/run/udev:ro \
                -it $IMAGE_NAME