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
* Installs ansible as user
* Installs ansible-galaxy requirements

### Import the image
1. In VirtualBox, choose "Import".
2. Leave Source as `Local File System`
3. Browse to the `.ovf` file that was just output into the `output-devops-vm` directory
4. Click "Next"
5. Change any settings you'd like and then click "Import"

### Configure shared folder

To simplify configuration via Ansible scripts, create a shared folder between your VM and host machine.
1. Click "Settings"
2. Navigate to Shared Folders
3. Click the "Add Folder" icon
4. Navigate to your git files, or choose another directory to share.
5. Choose Auto Mount
