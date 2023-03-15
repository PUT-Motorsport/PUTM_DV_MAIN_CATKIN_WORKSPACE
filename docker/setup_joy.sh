#!/bin/bash

JOY=""

JOY=$(ls /dev/input/js* 2> /dev/null)

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'
NAME="[JOY SETUP]"

if [ -z "$JOY" ]; then
    echo -e "${RED}${NAME} joystick is not connected${NC}"
    exit 1
else
    echo -e "${GREEN}${NAME} ${JOY} is a joystick${NC}"
    sudo chmod a+rw ${JOY}
    exit 0
fi