#!/bin/bash

echo "Updating dnf packages"
sudo dnf update -y

echo "Installing kernel-devel for vboxadditions support"
sudo dnf install kernel-devel -y

echo "Installing Python and Ansible"
sudo dnf install -y python3 python3-pip python3-setuptools python3-wheel

sudo python3 -m pip install --upgrade pip
pip3 install ansible --user

echo "Installing guest additions"
mkdir /tmp/isomount
sudo mount ~/VBoxGuestAdditions.iso /tmp/isomount
sudo /tmp/isomount/VBoxLinuxAdditions.run
sudo umount /tmp/isomount
sudo rm -rf /tmp/isomount
