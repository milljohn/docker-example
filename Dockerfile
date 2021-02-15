

FROM ubuntu:18.04
COPY udev /run/udev/
WORKDIR /src

#VOLUME src:

# Metadata
LABEL author="John Miller"
LABEL project="motion"
LABEL application="motion-cubemos"



ENV CUBEMOS_SKEL_SDK=/opt/cubemos/skeleton_tracking

RUN apt-get update && \
  apt-get upgrade -y && \
  DEBIAN_FRONTEND=noninteractive apt install -y \
  wget apt-utils\
  libilmbase-dev libopenexr-dev libgstreamer1.0-dev ffmpeg \
  python3.7 python3.7-dev python3-pip unzip \
  libboost-all-dev libglib2.0-dev libcurl4-openssl-dev libgtk2.0-dev \
  vim

#RUN ln -s /usr/bin/python3.7 /usr/bin/python

RUN python3.7 -m pip install --upgrade pip

RUN python3.7 -m pip install numpy scipy matplotlib opencv-python pyrealsense2

# 12/29/2020 - ERROR 403: Forbidden
# There might also be an issue with minor updates, e.g. v3.1 vs v3.0
#RUN wget -P /tmp/ https://download-skeleton-tracking-sdk.s3.eu-central-1.amazonaws.com/cubemos_SDK.zip && \
#    unzip /tmp/cubemos_SDK.zip && \
#    rm /tmp/cubemos_SDK.zip && \
#    dpkg -i /tmp/cubemos_Skeleton_Tracking_v3.0/cubemos-SkeletonTracking_3.0.0.483f819.deb && \
#    rm -rf /tmp/cubemos_Skeleton_Tracking_v3.0/


# Use existing version for testing, bad for production
COPY cubemos_SDK.zip /tmp/
RUN unzip /tmp/cubemos_SDK.zip -d /tmp && \
    rm /tmp/cubemos_SDK.zip && \
    dpkg -i /tmp/cubemos_Skeleton_Tracking_v3.0/cubemos-SkeletonTracking_3.0.0.483f819.deb && \
    rm -rf /tmp/cubemos_Skeleton_Tracking_v3.0/


RUN python3.7 -m pip install /opt/cubemos/skeleton_tracking/wrappers/python/cubemos.skeletontracking-3.0.0-py3-none-any.whl

COPY .cubemos /root/.cubemos

# may not be needed?
# set_up_myriad.sh
#RUN echo $' \n\
#    SUBSYSTEM=="usb", ATTRS{idProduct}=="2150", ATTRS{idVendor}=="03e7", GROUP="users", MODE="0666", ENV{ID_MM_DEVICE_IGNORE}="1" \n\
#    SUBSYSTEM=="usb", ATTRS{idProduct}=="2485", ATTRS{idVendor}=="03e7", GROUP="users", MODE="0666", ENV{ID_MM_DEVICE_IGNORE}="1" \n\
#    SUBSYSTEM=="usb", ATTRS{idProduct}=="f63b", ATTRS{idVendor}=="03e7", GROUP="users", MODE="0666", ENV{ID_MM_DEVICE_IGNORE}="1" \n\
#    ' >> /etc/udev/rules.d/97-myriad-usbboot.rules
#RUN udevadm control --reload-rules
#RUN udevadm trigger

# This generates the activation_key.json
# This is not needed because it is copied in
#RUN ./opt/cubemos/skeleton_tracking/bin/cpp-activation



CMD /bin/bash