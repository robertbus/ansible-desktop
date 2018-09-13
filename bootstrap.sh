#!/bin/sh

apt-get update
apt-get -y install software-properties-common
apt-add-repository -y ppa:ansible/ansible
apt-get update
apt-get -y install ansible git

ansible-pull -U https://github.com/robertbus/ansible-desktop.git -i localhost, setup.yml
