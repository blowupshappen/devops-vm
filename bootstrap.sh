#!/bin/bash

echo "Updating dnf packages"
sudo dnf update -y

#echo "Installing Docker..."
#sudo yum install -y yum-utils
#sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
#sudo yum install docker-ce docker-ce-cli containerd.io -y
#sudo systemctl start docker
#sudo systemctl enable docker
#sudo usermod -aG docker vagrant
#echo "Docker install complete"

echo "Installing kernel-devel for vboxadditions support"
sudo dnf install kernel-devel -y

echo "Installing Python and Ansible"
sudo dnf install -y python3 python3-pip
pip3 install ansible --user
cd /vagrant/dev-vm/automation/ansible
echo "Install ansible-galaxy requirements"
ansible-galaxy install --force -r requirements.yaml
echo "Run Ansible playbook"
export ANSIBLE_CONFIG=/vagrant/dev-vm/automation/ansible/ansible.cfg
ansible-playbook -i environments/localhost deploy.yaml -vvv
