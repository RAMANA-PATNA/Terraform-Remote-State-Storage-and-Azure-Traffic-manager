# VM scale set outputs
output "web_vmss_id" {
  description = "Web virtual machine scale set id"
  value = azurerm_linux_virtual_machine_scale_set.web_vmss.id
}