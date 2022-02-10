source "virtualbox-iso" "devops-vm" {
  boot_command  = ["<tab><bs><bs><bs><bs><bs>text ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/ks.cfg<enter><wait>"]
  boot_wait     = var.boot_wait
  disk_size     = var.disk_size
  guest_os_type = "RedHat_64"
  headless      = false
  http_content = {
    "/ks.cfg" = templatefile("${path.root}/ks.pkrtpl", { username = var.ssh_username, password = var.ssh_password })
  }
  iso_url      = "https://download.rockylinux.org/pub/rocky/8/isos/x86_64/Rocky-8.5-x86_64-boot.iso"
  iso_checksum = "5a0dc65d1308e47b51a49e23f1030b5ee0f0ece3702483a8a6554382e893333c"
  #iso_url          = "https://download.rockylinux.org/pub/rocky/8/isos/x86_64/Rocky-8.5-x86_64-dvd1.iso"
  #iso_checksum     = "0081f8b969d0cef426530f6d618b962c7a01e71eb12a40581a83241f22dfdc25"
  ssh_username     = var.ssh_username
  ssh_password     = var.ssh_password
  shutdown_command = "echo '${var.ssh_password}' | sudo -S /sbin/halt -h -p"
  ssh_timeout      = "30m"
  vm_name          = var.vm_name
  gfx_vram_size    = var.vram
  gfx_controller   = var.gfx_controller
  vboxmanage = [
    ["modifyvm", "{{.Name}}", "--memory", var.memsize],
    ["modifyvm", "{{.Name}}", "--cpus", var.numvcpus],
    ["modifyvm", "{{.Name}}", "--clipboard", "bidirectional"]
    ["sharedfolder", "add", "{{.Name}}", "--name", "devops-vm", "--hostpath", "../", "--automount"],
  ]
  skip_export = var.skip_export
  keep_registered = var.keep_registered
}

build {
  sources = ["source.virtualbox-iso.devops-vm"]

  provisioner "shell" {
    script = "./bootstrap.sh"
  }
}

