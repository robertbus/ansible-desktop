#!/bin/bash

URL=https://github.com/robertbus/ansible-desktop.git
DEST=~/.ansible-desktop
PLAY=ubuntu/update.yml

SUDO=''
if (( $EUID != 0 )); then
    SUDO='sudo'
fi

$SUDO apt-get update
$SUDO apt-get -y install software-properties-common
$SUDO apt-add-repository -y ppa:ansible/ansible
$SUDO apt-get update
$SUDO apt-get -y install ansible git

mkdir -p $DEST

ansible-pull -d $DEST -i localhost -U $URL $PLAY

. $DEST/help.sh

