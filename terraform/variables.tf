variable "esxi_hostname" {
  description = "ESXi host address"
  type        = string
  default     = "192.168.1.3"
}

variable "esxi_hostport" {
  description = "ESXi SSH port"
  type        = number
  default     = 22
}

variable "esxi_hostssl" {
  description = "ESXi HTTPS port"
  type        = number
  default     = 443
}

variable "esxi_username" {
  description = "ESXi username"
  type        = string
  default     = "root"
}

variable "esxi_password" {
  description = "ESXi password"
  type        = string
  # sensitive = true   # zet dit gerust aan als je secrets niet via Secrets-doorzet
  default     = "Welkom01!"
}

variable "disk_store" {
  description = "Datastore name"
  type        = string
  default     = "datastore1"
}

variable "ovf_source" {
  description = "URL to Ubuntu 24.04 OVA/OVF"
  type        = string
  default     = "https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.ova"
}

variable "network_name" {
  description = "Virtual network name"
  type        = string
  default     = "VM Network"
}

variable "memory" {
  description = "Memory size in MB"
  type        = number
  default     = 2048
}

variable "vcpu" {
  description = "Number of virtual CPUs"
  type        = number
  default     = 1
}

variable "ssh_public_key" {
  description = "Your ED25519 SSH public key"
  type        = string
  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAe8Ilbjo2qjAKgneNmebSczNm06KuTrUbhZTlOj9PQe student@DESKTOP-1NUD89T"
}

variable "vm_user" {
  description = "Username to create on VMs"
  type        = string
  default     = "terraformuser"
}
