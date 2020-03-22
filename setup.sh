#!/bin/bash

# update & upgrade
apt-get update -y &&
apt-get upgrade -y &&

# get the repo
apt-get install git -y &&
git clone https://github.com/kasznar/raspberry-docker.git &&

# install docker
curl -fsSL https://get.docker.com -o get-docker.sh &&
sudo sh get-docker.sh &&

# automount the hdd
MOUNT="UUID=2A704240704212CD /home/pi/raspberry-docker/downloads ntfs defaults,auto,users,rw,nofail,umask=000 0 0"
echo $MOUNT >> /etc/fstab &&

echo "setup finished, rebbot && enjoy"
