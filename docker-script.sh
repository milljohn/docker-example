#!/bin/bash

apt update
apt upgrade -y

# cubemos dependancies
apt install libboost-all-dev -y
apt install libboost-all-dev libilmbase-dev libopenexr-dev libgstreamer1.0-dev ffmpeg -y

#apt install udev -y