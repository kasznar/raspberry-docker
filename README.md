## Dockerised transmission and nginx http file sharing

### wifi setup `wpa_supplicant.conf` and add `ssh` file
```
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
update_config=1
country=hu

network={
 ssid="<Name of your WiFi>"
 psk="<Password for your WiFi>"
}
```

## Install with `setup.sh`
```
curl -fsSL https://raw.githubusercontent.com/kasznar/raspberry-docker/master/setup.sh -o setup-docker.sh
sudo sh setup-docker.sh 
```
