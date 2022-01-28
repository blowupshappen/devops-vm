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
