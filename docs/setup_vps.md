# Setup server

## VPS

Create VPS instance: hetzner.com / fotbo.com / etc.

### Setup CloudFlare

* Add DNS record for `demo.yourserver.org`:
```
Type    Name                  IPv4 address        Proxy status    TTL
A       yourserver.org        1.2.3.4             No              Auto
A       demo                  1.2.3.4             Yes             Auto
```
* SSL/TLS encryption mode: Full
* SSL/TLS Recommender: true

### Add Docker image

Create an image in one of these services:
* https://hub.docker.com/
* https://github.com/usernamev?tab=packages
* https://gitlab.com/-/user_settings/personal_access_tokens
  * Token name: gitlab_docker_my_app_demo
  * Add permissions: read_registry, write_registry

## Pre-setup server

### Setup root access
```sh
ssh root@1.2.3.4
mkdir ~/.ssh
touch ~/.ssh/authorized_keys

local$ cat ~/.ssh/id_ed25519.pub | ssh root@1.2.3.4 'cat >> ~/.ssh/authorized_keys'
```

### Upgrade system
```sh
df -h /
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get autoclean
```

### Setup nauser access
```sh
adduser deployer
usermod -aG sudo deployer
exit
local$ ssh deployer@1.2.3.4
mkdir ~/.ssh
touch ~/.ssh/authorized_keys
exit
local$ cat ~/.ssh/id_ed25519.pub | ssh deployer@1.2.3.4 'cat >> ~/.ssh/authorized_keys'
```

### Install extra tools
```sh
# Docker
sudo apt install -y docker.io curl git
sudo docker --version
sudo usermod -a -G docker $USER

# Letsencrypt
sudo mkdir -p /letsencrypt && sudo touch /letsencrypt/acme.json && sudo chmod 600 /letsencrypt/acme.json

sudo reboot
```

## [Setup application](https://kamal-deploy.org/)

### Add env config files

```sh
# Create and fill ENV file for config/deploy.demo.yml
cp .default.env.demo .env.demo
```

### Setup app

```sh
# Build server 1st time
local$ gem install kamal
local$ kamal setup -d demo

# Add full read/write access for shared folders if need
sudo chmod 777 -R /data/storage
```
