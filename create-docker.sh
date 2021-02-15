#!/bin/bash

echo You only need to run this once
sudo docker create -ti --name cubemos -l cubemosV3 ubuntu:18.04 /bin/bash

echo run this image with 'docker start cubemos'