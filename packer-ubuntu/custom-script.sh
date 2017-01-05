#!/usr/bin/env bash

set -eux

# Sample custom configuration script - add your own commands here
# to add some additional commands for your environment
#
# For example:
# yum install -y curl wget git tmux firefox xvfb

echo "Installing Docker"
#Installing Docker
sudo apt-get update -y
sudo apt-get install apt-transport-https ca-certificates -y
sudo apt-key adv \
               --keyserver hkp://ha.pool.sks-keyservers.net:80 \
               --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
echo "deb https://apt.dockerproject.org/repo ubuntu-xenial main" | sudo tee /etc/apt/sources.list.d/docker.list
sudo apt-get update -y
sudo apt-get install linux-image-extra-$(uname -r) linux-image-extra-virtual -y
sudo apt-get install docker-engine -y
sudo service docker start

echo "Installing emacs git tree bzip2 ntp telnet inetutils-traceroute nmap"
#Installing emacs git tree bzip2 ntp telnet inetutils-traceroute nmap
apt-get install -y emacs git tree bzip2 ntp telnet inetutils-traceroute nmap

echo "Installing Docker-compose"
#Installing Docker-compose
curl -L "https://github.com/docker/compose/releases/download/1.8.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/bin/docker-compose

chmod +x /usr/bin/docker-compose

echo "Downloading docker images"
docker pull ubuntu:16.04
docker pull schoolofdevops/chef-controller:v1.1
docker pull schoolofdevops/chef-centos6-node:v1.1
docker pull schoolofdevops/chef-ubuntu14-node:v1.1

echo "copying codespace code"
#copying codespace code
mkdir -p /codespace
cp /tmp/*.yml /codespace/
