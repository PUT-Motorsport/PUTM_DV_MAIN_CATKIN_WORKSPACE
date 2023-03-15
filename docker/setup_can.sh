#!/bin/bash

CAN_VENDOR_ID="0483"
CAN_MODEL_ID="5740"
CAN_TTY_PATH=""


RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'



for TTY in /dev/ttyACM* ; do
    VENDOR_ID=$(udevadm info $TTY | grep -oP "ID_VENDOR_ID=\K.*")
    if [ "$CAN_VENDOR_ID" = "$VENDOR_ID" ]; then
        MODEL_ID=$(udevadm info $TTY | grep -oP "ID_MODEL_ID=\K.*")
        if [ "$CAN_MODEL_ID" = "$MODEL_ID" ]; then
            CAN_TTY_PATH=$TTY
            break
        fi
    fi
done

if [ -z "$CAN_TTY_PATH" ]; then
    echo -e "${RED}[CANscript] USB-CAN is not connected${NC}"
    exit 1
else
    echo -e "${GREEN}[CANscript] $CAN_TTY_PATH is the USB-CAN dongle${NC}"
    modprobe can
    modprobe can-raw
    modprobe slcan
    
    #link serial interface with a virtual CAN device
    slcand -s8 -o $CAN_TTY_PATH slcan0 
    #slcand -s8 -o /dev/ttyACM0 slcan0 
    sleep 1
    
    #bring network interface up
    ifconfig slcan0 up && echo -e "${GREEN}[CANscript] slcan0 is up and running${NC}"
    exit 0
fi



