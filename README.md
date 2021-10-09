# verthashminer-docker
[![Docker Image CI](https://github.com/Migz93/verthashminer-docker/actions/workflows/main.yml/badge.svg)](https://github.com/Migz93/verthashminer-docker/actions/workflows/main.yml)  
Basic dockerized version of [VerthashMiner](https://github.com/CryptoGraphics/VerthashMiner)

Container will generate a new verthash.dat file if it does not already exist at /config/verthash.dat.  
Once verthash.dat file exists container will begin mining using your parameters below.

This release is running the VerthashMiner v0.7.2 release.


# Docker Command

## Using NVIDIA GPU

```bash
docker run -d \
  --name=verthashminer-docker \
  --runtime=nvidia \
  -e ALGO=verthash \
  -e URL=stratum+tcp://vtc.acidpool.co.uk:3052 \
  -e USER=YOUR_WALLET_ADDRESS.WORKERNAME \
  -e PASS=x \
  -e NVIDIA_VISIBLE_DEVICES=YOURGPUID \
  -v /path/to/data:/config \
  --restart unless-stopped \
   miguel1993/verthashminer-docker
```
## Using iGPU (Untested)
```bash
docker run -d \
  --name=verthashminer-docker \
  --device /dev/dri \
  -e ALGO=verthash \
  -e URL=stratum+tcp://vtc.acidpool.co.uk:3052 \
  -e USER=YOUR_WALLET_ADDRESS.WORKERNAME \
  -e PASS=x \
  -v /path/to/data:/config \
  --restart unless-stopped \
   miguel1993/verthashminer-docker
```

# Parameters

All parameters below are mandatory

| Parameter | Description |
| :--- | :--- |
| `-e ALGO` | Specify the algorithm to use. |
| `-e URL` | Set URL of mining server in format (address:port). |
| `-e USER` | Set username for mining server. |
| `-e PASS` | Set password for mining server. |
| `-v /config` | Location to store verthash.dat |


Parameters below are optional
| Parameter | Description |
| :--- | :--- |
| `-e NVIDIA_VISIBLE_DEVICES` | Specify NVIDIA GPU ID. |

# Versions
* 09/10/2021 - Initial release.

# Credits
https://github.com/CryptoGraphics/VerthashMiner  
http://acidpool.co.uk

# Notes
Tested and running with specifically:  
* Unraid Version: 6.10.0-rc1  
* NVIDIA GeForce GTX 1650 SUPER  
* [AcidPool](http://acidpool.co.uk) mining pool  

I have not tested any other kind of configuration