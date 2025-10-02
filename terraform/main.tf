provider "esxi" {
  esxi_hostname = var.esxi_hostname
  esxi_hostport = var.esxi_hostport
  esxi_hostssl  = var.esxi_hostssl
  esxi_username = var.esxi_username
  esxi_password = var.esxi_password
}
#effe test voro change
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
}
