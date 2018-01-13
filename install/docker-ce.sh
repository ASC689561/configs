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
apt-get update -y &&
apt-get install apt-transport-https ca-certificates -y &&
apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D &&
DEBLINE="deb https://apt.dockerproject.org/repo ubuntu-$DISTNAME main" &&
echo "$DEBLINE" | tee /etc/apt/sources.list.d/docker.list &&
apt-get update -y &&
apt-get purge lxc-docker -y &&
apt-cache policy docker-engine &&
apt-get install linux-image-extra-$(uname -r) -y &&
apt-get install apparmor -y &&
apt-get install docker-engine -y &&
usermod -aG docker $USER &&
wget https://github.com/docker/compose/releases/download/1.8.0-rc2/docker-compose-`uname -s`-`uname -m` -O /usr/local/bin/docker-compose &&
chmod +x /usr/local/bin/docker-compose &&
su $USER

# That last bit makes a new terminal in which you re-login, to save logging out and in again
# To test it's working, try:
#
#   docker ps
#