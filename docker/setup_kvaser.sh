sudo modprobe can
sudo modprobe can_raw
sudo ip link set can0 type can bitrate 1000000
sudo ip link set up can0
