## Dockerised transmission and nginx http file sharing

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

### Install docker-compose [as in the documentation](https://docs.docker.com/compose/install/#install-compose-on-linux-systems)
```
sudo curl -L "https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
```

```
sudo chmod +x /usr/local/bin/docker-compose
```

### To auto mount the usb HDD add the following to `/etc/fstab` 

UUID=2A704240704212CD /home/pi/raspberry-docker/downloads ntfs defaults,auto,users,rw,nofail,umask=000 0 0
