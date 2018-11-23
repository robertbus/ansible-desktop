#!/bin/bash

SUDO=''
if (( $EUID != 0 )); then
    SUDO='sudo'
fi

$SUDO apt-get update
$SUDO apt-get -y install software-properties-common
$SUDO apt-add-repository -y ppa:ansible/ansible
$SUDO apt-get update
$SUDO apt-get -y install ansible git

ansible-pull -U https://github.com/robertbus/ansible-desktop.git -i localhost, ubuntu/update.yml
