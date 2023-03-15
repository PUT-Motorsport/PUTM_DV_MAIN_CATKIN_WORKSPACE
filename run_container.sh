#!/bin/bash

PATH_TO_SHARE_WITH_CONTAINER="$PWD/catkin_ws/"
#PATH_TO_SHARE_WITH_CONTAINER="<your_path_to_this_folder>/PUTM_DV_MAIN_CATKIN_WORKSPACE/catkin_ws/"

IMAGE_NAME="putm_dv_main_catkin_workspace"
#IMAGE_NAME="<your_image_name>"

CONTAINER_NAME="putm_dv_main_catkin_workspace"
#CONTAINER_NAME="your_container_name"


set -e

docker build -t $IMAGE_NAME ./docker/

sudo docker run --privileged \
                --name $CONTAINER_NAME \
                -v /dev:/dev \
                --cap-add=ALL \
                --network=host \
                -v $PATH_TO_SHARE_WITH_CONTAINER:/home/putm/catkin_ws \
                -v /lib/modules:/lib/modules \
                -v /run/udev:/run/udev:ro \
                -it $IMAGE_NAME