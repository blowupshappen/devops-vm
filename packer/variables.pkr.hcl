variable "vm_name" {
  type    = string
  default = "devops-vm2"
}

variable "ssh_username" {
  type        = string
  description = "The name of your user account"
}

variable "ssh_password" {
  type        = string
  description = "The password for your user account and the root account"
  sensitive   = true
}

variable "memsize" {
  type    = string
  default = "1024"
}

variable "numvcpus" {
  type    = string
  default = "1"
}

variable "boot_wait" {
  type    = string
  default = "5s"
}

variable "disk_size" {
  type    = number
  default = 40960
}
