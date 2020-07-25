# Devopment VM
A development Virtual Machine running on CentOS 8 created with Vagrant and Virtualbox, customized using Ansible.

## Prerequisites
You will first need to install [Vagrant](https://www.vagrantup.com/) and [Virtualbox](https://www.virtualbox.org/).

## Make sure to configure your credentials for git, AWS, etc
See [Customizations > Credentials](#credentials) below.

Inside the cloned directory (where you see the Vagrantfile), run:
```
vagrant up
```
This will take a little while as it pulls the centos image for the first time, and bootstraps the VM.  See [Details](#details) if you're interested in how it works.

## Customizations
There are several areas you can easily customize.

### Credentials
Make sure to copy the `.env.sample` file to `.env` and fill out your credentials and settings. They will automatically be copied to the virtual machine. If you do not do so prior to provisioning the VM, you can do so afterwards by editing the file at `~/.env`. Bear in mind that re-running the provisioning will clobber this file.

### Wallpaper & Lock Screen Background
You can replace the wallpaper by replacing wallpaper.jpg with your own image. If your image is not a jpg, _remove_ the wallpaper.jpg and place your image named `wallpaper.png` or `wallpaper.gif` in the same location.

### Visual Studio Code
You can update the extensions installed for VSCode, change the themes installed / configured, update the settings.json file to match your preferences, or choose not to install VSCode entirely.

#### Change extensions

TODO: Parameters

## Details
### Vagrant
This virtual machine is provisioned on VirtualBox by a tool called Vagrant using the included Vagrantfile.
In Vagrant, we:
  * Give the VM a hostname (default: devbox8) and private network IP address
  * Set up a shared folder between the `data` subfolder of this repository, and the `/vagrant` folder in the virtual machine itself
  * Enable guest additions: enable mouse pointer integration, shared folders, shared clipboard, better video support, etc.
  * Configure resources: CPU and RAM available to the VM
  * Finally: run the provisioning [bootstrap.sh](#bootstrap) shell script

Note, that the provisioner shell script is generally only run the first time the system comes up, though you can force it to rerun:
```
$ vagrant reload --provision
```

### Bootstrap
The bootstrap shell script is a helper that mostly prepares the machine to run ansible, then runs the Ansible playbook.
  
  * Patches the machine
  * Installs kernel-devel for VBox Additions Support
  * Installs Python3 and Pip3 globally
  * Installs ansible as the vagrant user
  * Installs ansible-galaxy requirements and runs the [Ansible playbook](#ansible-playbook) in this repo.

### Ansible Playbook
The rest of the system is configured in Ansible. More details about this process and the customizations available is found in the playbook `README.md` file within the `data/dev-vm` directory.

In broad terms:
  * Installs gnome GUI
  * Installs VSCode and some popular extensions (configurable)
  * Installs OpenVPN, CAC Reader Software, Browsers, Docker, Remmina