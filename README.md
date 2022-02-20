# Devopment VM - Overview

Creates a development Virtual Machine running Rocky Linux created with Virtualbox, Packer and Ansible

# Prerequisites

## Install VirtualBox

Install VirtualBox by following their instructions: https://www.virtualbox.org/wiki/Downloads

## Install Packer

Follow instructions on the hashicorp website: https://learn.hashicorp.com/tutorials/packer/get-started-install-cli

# Building the image

## Create a variables file

Copy the `vars.auto.pkrvars.hcl.sample` file and name it `vars.auto.pkrvars.hcl` (remove .sample from the end). Update the variables as you'd like

## run the packer build

Inside the cloned directory run:
```
cd packer
copy vars.auto.pkrvars.hcl.sample vars.auto.pkrvars.hcl
packer build .
```
This will take a little while as it pulls the centos image for the first time, and bootstraps the VM.

# Ansible Playbook

The rest of the system is configured in Ansible.

In broad terms:
  * Sets us the Gnome GUI with customizable extensions
  * Installs a bunch of useful tools (configurable):
    * VSCode and some popular extensions (configurable)
    * OpenVPN
    * CAC Reader Software
    * Browsers
    * Docker
    * Remmina (RDP Client)
    * Terraform
    * Packer
    * AWS CLI
    * Azure CLI
    * Kubectl
    * Helm

## Running the playbook

### Step 1 - Environment configuration

Prior to running the Ansible playbook, make sure that you have copied the `data/envs/.env.sample` to `data/envs/.env` and updated the information to match your setup. Note that this can easily be changed after configuring the VM - but it must be present to successfully run the Ansible playbook.

### Step 2 - (Optionally) Customize your setup

See the [Customizations](#customizations) section below for options.

### Step 3 - Run the Ansible deploy

Instructions for running the playbook are found in the `~/Desktop/run-ansible.txt` file while logged into the VM. Assuming you've left the system configured with the shared folder mount as default:

```
cd /media/sf_devops-vm/ansible
ansible-galaxy install -r requirements.yaml --force --ignore-certs --ignore-errors
ANSIBLE_ENABLE_TASK_DEBUGGER=True ansible-playbook deploy.yaml -i environments/localhost/
```

## Customizations

There are several areas you can easily customize.

### Settings

The `ansible/environments/localhost/group_vars/all/settings.yaml` file has numerous configurations you can update - most are somewhat documented within that file.

### Credentials

Make sure to copy the `data/envs/.env.sample` file to `data/envs/.env` and fill out your credentials and settings. They will automatically be copied to the virtual machine. If you do not do so prior to provisioning the VM, you can do so afterwards by editing the file at `~/.env`. Bear in mind that re-running the provisioning will clobber this file.

You can include multiple files and all will be copied to the machine. (example: `.env-test`, `.env-prod`, etc)

### SSH Keys

Place your SSH Keys (or config) into `data/ssh_keys/` and Ansible will transfer it to the new VM.

### Certs

Place SSL Certificates into the `data/certs/` directory and they will be transferred to the new VM and trusted automatically.

### Wallpaper & Lock Screen Background

You can replace the wallpaper by replacing wallpaper.jpg with your own image. If your image is not a jpg, _remove_ the wallpaper.jpg and place your image named `data/wallpaper.png` or `data/wallpaper.gif` in the same location. The lockscreen image is replaced the same way.

### AWS Configs

Dropping your AWS profiles into `data/aws/` will cause them to be transferred to the new VM.

### Git

TODO: Ask Tim

### OpenVPN Profiles

Dropping your OpenVPN profiles into `data/openvpn` will cause them to be transferred to the new VM.

### Remmina

If you place your remmina connection config files in here, they will be transferred to the new VM.

### Visual Studio Code
You can update the extensions installed for VSCode, change the themes installed / configured, update the settings.json file to match your preferences, or choose not to install VSCode entirely. See `ansible/environments/localhost/group_vars/all/settings.yaml`.
