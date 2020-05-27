#!/bin/bash

# update & upgrade
apt-get update -y &&
apt-get upgrade -y &&

# get the repo
apt-get install git -y &&
apt-get install tmux -y &&
git clone https://github.com/kasznar/raspberry-docker.git &&

# install docker
curl -fsSL https://get.docker.com -o get-docker.sh &&
sh get-docker.sh &&
usermod -aG docker pi &&

# automount the hdd
MOUNT_HDD="UUID=2A704240704212CD /home/pi/raspberry-docker/downloads ntfs defaults,auto,users,rw,nofail,umask=000 0 0"
echo $MOUNT_HDD >> /etc/fstab &&

# setup docker containers
cd raspberry-docker &&

docker run -d \
  --name=transmission \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Europe/Budapest \
  -p 9091:9091 \
  -p 51413:51413 \
  -p 51413:51413/udp \
  -v /home/pi/raspberry-docker/config:/config \
  -v /home/pi/raspberry-docker/downloads:/downloads \
  --restart unless-stopped \
  linuxserver/transmission &&

docker run -d \
  --name=nginx \
  -p 80:80 \
  -v /home/pi/raspberry-docker/downloads:/usr/share/nginx/html:ro \
  -v /home/pi/raspberry-docker/nginx.conf:/etc/nginx/nginx.conf:ro \
  --restart unless-stopped \
  nginx &&

echo "setup finished, reboot && enjoy"
