# Overview
This image contains `megad-cfg.php` utility for updating `megad-328` devices. Find more details on [site](http://www.ab-log.ru/smart-house/ethernet/megad-328-firmware-upgrade).

# Usage CLI

## Build image
```
docker build --rm --no-cache --tag=dmitriy/megad-cfg .
```

## Run as container
```
docker run -it --rm --network=host dmitriy/megad-cfg
```

## Update devices
Scan all devices
```
/opt/megad # php megad-cfg.php --scan
192.168.0.22
192.168.0.21
192.168.0.25
192.168.0.24
192.168.0.26
```
Repeat steps below for each IP address:

1. Backup configuration (optional step)

	```
	/opt/megad # php megad-cfg.php --ip 192.168.0.22 --read-conf megad22.cfg -p sec
	Reading configuration... OK
	```
1. Update firmware

	```
	/opt/megad # php megad-cfg.php --ip 192.168.0.22 -p sec -w --ee --read-conf megad.cfg --write-conf megad.cfg
	Reading configuration... OK
	Downloading firmware... OK
	Connecting... OK
	Checking firmware... OK
	Erasing firmware... OK
	Writing firmware... OK
	Erasing EEPROM... OK
	Restarting device... OK
	Waiting...OK
	IP address was successfully changed!
	Writing configuration... OK
	```
