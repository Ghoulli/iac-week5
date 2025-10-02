output "vm_name"       { value = esxi_guest.vm.guest_name }
output "vm_ip_address" { value = esxi_guest.vm.ip_address }
    description = "Vereist (open-)vm-tools in de guest om IP te detecteren."