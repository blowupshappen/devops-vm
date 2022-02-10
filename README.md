# Devopment VM
Creates a development Virtual Machine running Rocky Linux created with Virtualbox, Packer and Ansible

## Prerequisites
### Install VirtualBox

Install VirtualBox by following their instructions: https://www.virtualbox.org/wiki/Downloads

### Install Packer
Follow instructions on the hashicorp website: https://learn.hashicorp.com/tutorials/packer/get-started-install-cli

## Building the image

### Create a variables file

Copy the `vars.auto.pkrvars.hcl.sample` file and name it `vars.auto.pkrvars.hcl` (remove .sample from the end).

### run the packer build
Inside the cloned directory run:
```
cd packer
cp vars.auto.pkrvars.hcl.sample vars.auto.pkrvars.hcl
packer build .
```
This will take a little while as it pulls the centos image for the first time, and bootstraps the VM.  

## Ansible Playbook
The rest of the system is configured in Ansible. More details about this process and the customizations available is found in the playbook `README.md` file within the `data/dev-vm` directory.

In broad terms:
  * Installs gnome GUI
  * Installs VSCode and some popular extensions (configurable)
  * Installs OpenVPN, CAC Reader Software, Browsers, Docker, Remmina
### Customizations
There are several areas you can easily customize.

#### Credentials
Make sure to copy the `.env.sample` file to `.env` and fill out your credentials and settings. They will automatically be copied to the virtual machine. If you do not do so prior to provisioning the VM, you can do so afterwards by editing the file at `~/.env`. Bear in mind that re-running the provisioning will clobber this file.

#### Wallpaper & Lock Screen Background
You can replace the wallpaper by replacing wallpaper.jpg with your own image. If your image is not a jpg, _remove_ the wallpaper.jpg and place your image named `wallpaper.png` or `wallpaper.gif` in the same location.

#### Visual Studio Code
You can update the extensions installed for VSCode, change the themes installed / configured, update the settings.json file to match your preferences, or choose not to install VSCode entirely.

#### Change extensions
