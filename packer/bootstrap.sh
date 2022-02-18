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

echo "Adding our user to the virtualbox group"
sudo usermod -a -G vboxsf "$USER"

echo "Installing minimal gnome"
sudo dnf groupinstall "X Window System" -y
sudo dnf install gnome-classic-session gnome-terminal nautilus-open-terminal control-center liberation-mono-fonts -y
sudo unlink /etc/systemd/system/default.target
sudo ln -sf /lib/systemd/system/graphical.target /etc/systemd/system/default.target

echo "Dropping Notes on Desktop"
mkdir ~/Desktop/
echo "# Need to run Ansible 
cd /media/sf_devops-vm/ansible
ansible-galaxy install -r requirements.yaml --force --ignore-certs --ignore-errors
ANSIBLE_ENABLE_TASK_DEBUGGER=True ansible-playbook deploy.yaml -i environments/localhost/ -vvv" > ~/Desktop/run-ansible.txt
