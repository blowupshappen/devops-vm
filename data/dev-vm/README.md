# Dev VM
A development Virtual Machine running on CentOS created with Vagrant and customized using Ansible.

## Usage
You will first need to install [Vagrant](https://www.vagrantup.com/) and [Virtualbox](https://www.virtualbox.org/).

## Make sure to configure your credentials for git, AWS, etc
See [Customizations > Credentials](#credentials) below.

Inside the cloned directory (where you see the Vagrantfile), run:
```
vagrant up
```
This will take a little while as it pulls the centos image for the first time, and bootstraps the VM.

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