#!/bin/bash

XSENS_VENDOR_ID="2639"
XSENS_MODEL_ID="0300"
XSENS_TTY_PATH=""


RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'
NAME="[XSENS DETECT]"


for TTY in /dev/ttyUSB* ; do
    VENDOR_ID=$(udevadm info $TTY | grep -oP "ID_VENDOR_ID=\K.*")
    if [ "$XSENS_VENDOR_ID" = "$VENDOR_ID" ]; then
        MODEL_ID=$(udevadm info $TTY | grep -oP "ID_MODEL_ID=\K.*")
        if [ "$XSENS_MODEL_ID" = "$MODEL_ID" ]; then
            XSENS_TTY_PATH=$TTY
            break
        fi
    fi
done 2> /dev/null

if [ -z "$XSENS_TTY_PATH" ]; then
    echo -e "${RED}${NAME} Xsens is not connected${NC}"
    exit 1
else
    echo -e "${GREEN}${NAME} Xsens is at: $XSENS_TTY_PATH${NC}"
    exit 0
fi



