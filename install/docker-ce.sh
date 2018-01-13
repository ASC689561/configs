#!/bin/bash -e
# ubuntu-docker-install.sh
#
# Quick-usage:
#
# wget https://gist.githubusercontent.com/deanrather/9da36d690bd9b57c33fb3ddeb4321cc7/raw/ubuntu-docker-install.sh -O - | sh
#
# https://docs.docker.com/engine/installation/linux/ubuntulinux/
# https://github.com/docker/compose/releases
#
# TODO:
# Use this instead: https://get.docker.com/

DISTNAME=$(lsb_release -a | grep Codename | cut -d':' -f2 | tr -d "\t") &&
sudo apt-get update -y &&
sudo apt-get install apt-transport-https ca-certificates -y &&
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D &&
DEBLINE="deb https://apt.dockerproject.org/repo ubuntu-$DISTNAME main" &&
echo "$DEBLINE" | sudo tee /etc/apt/sources.list.d/docker.list &&
sudo apt-get update -y &&
sudo apt-get purge lxc-docker -y &&
sudo apt-cache policy docker-engine &&
sudo apt-get install linux-image-extra-$(uname -r) -y &&
sudo apt-get install apparmor -y &&
sudo apt-get install docker-engine -y &&
sudo usermod -aG docker $USER &&
sudo wget https://github.com/docker/compose/releases/download/1.8.0-rc2/docker-compose-`uname -s`-`uname -m` -O /usr/local/bin/docker-compose &&
sudo chmod +x /usr/local/bin/docker-compose &&
sudo su $USER

# That last bit makes a new terminal in which you re-login, to save logging out and in again
# To test it's working, try:
#
#   docker ps
#