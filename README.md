# motion-docker
Docker files and documentation for use in motion applications. This is a boilerplate example.

DO NOT RUN THE SHELL SCRIPTS. THEY ARE EXAMPLES OF THE COMMANDS NEEDED.

# Getting started
This boilerplate uses the system ID from one of the Alienware desktops. It allows us to run 
cubemos on multiple computers since the licenses cannot be reset once activated.

## Notes on the file tree

- ``.cubemos``: Contains the license file and links to the 

## Install Docker

Run ``bootstrap/bootstrap.sh`` or do the following:

```shell
sudo apt-get -y remove docker docker-engine docker.io containerd runc

sudo apt-get update

sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
    
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    
sudo add-apt-repository \
  "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) \
  stable"
 
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose


```
## Download the Cubemos SDK 
Download the SDK to the repo directory. It should be named ``cubemos_SDK.zip``. 
This is a large file and is added to the ``.gitignore``.

## Build docker image with compose

```shell
sudo docker-compose up -d
```

## Run the Docker Container

```shell
sudo docker start -ai cubemos-test
```

## Chenge the entrypoint
```shell
docker run -ti --entrypoint=/src/skeleton-tracking-realsense.py --volumes-from=cubemos-test --mac-address e4:b9:7a:e8:b1:86 --device=/dev/video0:/dev/video0 --device=/dev/video1:/dev/video1 --device=/dev/video2:/dev/video2 --device=/dev/video3:/dev/video3 --device=/dev/video4:/dev/video4 --device=/dev/video5:/dev/video5 --rm --mac-address=e4:b9:7a:e5:af:e6 realsense-test
```


### System information:
```text
BIOS_ID: 
HDD_IDs: 19372B800837 001CC0EC34A2BBA057090067 19372B800276 
MAC_ADDR: e4:b9:7a:e5:af:e6 04:d5:90:0d:ae:50 
OS_info: Linux 5.4.0-56-generic #62~18.04.1-Ubuntu SMP Tue Nov 24 10:07:50 UTC 2020
```