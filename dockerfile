FROM ros:noetic-ros-base-focal as base

ENV TZ=Europe/Warsaw
RUN ln -snf "/usr/share/zoneinfo/$TZ" /etc/localtime
RUN echo "$TZ" > /etc/timezone

# DEPENDENCIES
RUN apt-get update
RUN apt-get install -y tzdata
RUN apt-get install g++ -y && apt install git -y && apt install vim -y && apt install g++ -y && apt install build-essential -y
RUN apt-get install build-essential cmake -y --no-install-recommends 
RUN apt-get install libboost-all-dev -y
RUN apt-get install apt-utils can-utils kmod udev net-tools gdb nano ros-noetic-joy -y


# SETUP CONTAINER ON BOOT
COPY setup_scripts/setup_can.sh /
COPY setup_scripts/entrypoint.sh /
RUN chmod +x /setup_can.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]


