Vagrant.configure("2") do |config|
  config.vm.box = "geerlingguy/centos8"
  config.vm.hostname = "devbox8"
  config.vm.network "private_network", ip: "10.9.8.100"
  config.vm.synced_folder "./data", "/vagrant", type: "virtualbox"
  config.vbguest.installer_options = { allow_kernel_upgrade: true, reboot_timeout: 5000 }

  # This next stuff and stuff at top may not be required...
  config.vagrant.plugins = ['vagrant-vbguest']
  config.vbguest.auto_update = true

  config.vm.provider "virtualbox" do |vb|
    vb.gui = true
    vb.memory = "2048"
    vb.cpus = 2
    vb.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
    vb.customize ["modifyvm", :id, "--mouse", "usbtablet"]
  end

  config.vm.provision "shell", path: "bootstrap.sh", privileged: false
end