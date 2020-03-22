## Dockerised transmission and nginx http file sharing

## Install with `setup.sh`

```
curl -fsSL https://raw.githubusercontent.com/kasznar/raspberry-docker/master/setup.sh -o setup-docker.sh &&
sudo sh setup-docker.sh &&
```


### wifi setup `wpa_supplicant.conf`

```
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
update_config=1
country=hu

network={
 ssid="<Name of your WiFi>"
 psk="<Password for your WiFi>"
}
```

### Install docker [as in the documentation](https://docs.docker.com/install/linux/docker-ce/debian/#install-using-the-convenience-script)

```
$ curl -fsSL https://get.docker.com -o get-docker.sh
$ sudo sh get-docker.sh

<output truncated>
```

```
sudo usermod -aG docker your-user
```

### Install docker-compose with pip, there's no script for arm

```
// pip is cursed
sudo apt update
sudo apt install -y python3-pip libffi-dev

sudo pip3 install docker-compose
```

### To auto mount the usb HDD add the following to `/etc/fstab` 

```
UUID=2A704240704212CD /home/pi/raspberry-docker/downloads ntfs defaults,auto,users,rw,nofail,umask=000 0 0
```

### Start with docker-compose in production mode

```
docker-compose -f docker-compose.yml -f production.yml up -d
```






