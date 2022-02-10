# Packer

## Pre-requisites

### Install VirtualBox

Install VirtualBox by following their instructions: https://www.virtualbox.org/wiki/Downloads

### Install Packer
Follow instructions on the hashicorp website: https://learn.hashicorp.com/tutorials/packer/get-started-install-cli

## Building the image

### Create a variables file

Copy the `vars.auto.pkvars.hcl.sample` file and name it `vars.auto.pkvars.hcl` (remove .sample from the end).

### Build the Virtual Box Image
To build the VM, navigate your terminal to this directory and type:
```
packer build .
```

### Bootstrap
The bootstrap shell script is a helper that mostly prepares the machine to run ansible, then runs the Ansible playbook.
  
  * Patches the machine
  * Installs kernel-devel for VBox Additions Support
  * Installs Python3 and Pip3 globally
  * Installs ansible as the vagrant user
  * Installs ansible-galaxy requirements