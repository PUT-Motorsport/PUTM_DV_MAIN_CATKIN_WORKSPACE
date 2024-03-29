#!/bin/bash

IF_NAME="can0"
CAN_VENDOR_ID="0483"
CAN_MODEL_ID="5740"
CAN_TTY_PATH=""


RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'
NAME="[CAN SETUP]"


for TTY in /dev/ttyACM* ; do
    VENDOR_ID=$(udevadm info $TTY | grep -oP "ID_VENDOR_ID=\K.*")
    if [ "$CAN_VENDOR_ID" = "$VENDOR_ID" ]; then
        MODEL_ID=$(udevadm info $TTY | grep -oP "ID_MODEL_ID=\K.*")
        if [ "$CAN_MODEL_ID" = "$MODEL_ID" ]; then
            CAN_TTY_PATH=$TTY
            break
        fi
    fi
done 2> /dev/null

if [ -z "$CAN_TTY_PATH" ]; then
    echo -e "${RED}${NAME} USB-CAN is not connected${NC}"
    exit 1
else
    echo -e "${GREEN}${NAME} USB-CAN is at: $CAN_TTY_PATH${NC}"
    modprobe can
    modprobe can-raw
    modprobe slcan
    
    #link serial interface with a virtual CAN device
    slcand -s8 -o $CAN_TTY_PATH $IF_NAME 
    sleep 1
    
    #bring network interface up
    ifconfig $IF_NAME up && echo -e "${GREEN}${NAME} $IF_NAME is up and running${NC}"
    exit 0
fi
