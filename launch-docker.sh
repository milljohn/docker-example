#!/bin/bash

echo starting Docker ...

UBUNTU18=0dd520526d87
UBUNTU181=2c047404e52d
UBUNTU20=3be1d07498f9

DOCKER_IMAGE=cubemos

BASE_PATH=/home/jmiller/repos/
REPO_NAME=minimal-motion
PROJECT_PATH=$BASE_PATH$REPO_NAME
MAC=04:d5:90:0d:ae:50

#echo Using MAC address: $MAC

#sudo docker run -it -v $PROJECT_PATH:/$REPO_NAME -v udev:/run/udev:ro --mac-address $MAC $DOCKER_IMAGE /bin/bash

sudo docker start $DOCKER_IMAGE

# https://superuser.com/questions/1294190/is-there-a-way-to-customize-the-docker-machine-uuid-and-vmid
# uuid is the mobo id
# in short:
# docker run --rm -ti -v /var/tmp/product_uuid:/sys/class/dmi/id/product_uuid centos bash
