provider "esxi" {
  esxi_hostname = var.esxi_hostname
  esxi_hostport = var.esxi_hostport
  esxi_hostssl  = var.esxi_hostssl
  esxi_username = var.esxi_username
  esxi_password = var.esxi_password
}

# cloud-init user-data voor Ubuntu 24.04 OVA
locals {
  cloud_init = <<-EOT
    #cloud-config
    users:
      - name: ${var.vm_user}
        groups: [sudo]
        shell: /bin/bash
        sudo: ["ALL=(ALL) NOPASSWD:ALL"]
        ssh_authorized_keys:
          - ${var.ssh_public_key}
    ssh_pwauth: false
    package_update: true
    runcmd:
      - [ sh, -c, "echo 'Deployed via Terraform on ESXi' > /etc/motd" ]
  EOT
}

resource "esxi_guest" "vm" {
  guest_name = "tf-ubuntu-demo"
  disk_store = var.disk_store
  ovf_source = var.ovf_source

  memsize  = var.memory
  numvcpus = var.vcpu
  power    = "on"

  network_interfaces {
    virtual_network = var.network_name
  }

  ovf_properties {
    key   = "guestinfo.userdata"
    value = base64encode(local.cloud_init)
  }

  ovf_properties {
    key   = "guestinfo.userdata.encoding"
    value = "base64"
  }
}
