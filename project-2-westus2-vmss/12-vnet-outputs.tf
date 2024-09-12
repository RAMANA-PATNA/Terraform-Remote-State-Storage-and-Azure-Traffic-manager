# Virtual network outputs
##  Virtual Network Name
output "virtual_network_name" {
  description = "Virtual Network name"
  value = azurerm_virtual_network.vnet.name
}

## Virtual network  ID
output "virtual_network_id" {
  description = "Virtual Network ID"
  value = azurerm_virtual_network.vnet.id
}

# Subnet name
output "web_subnet_name" {
  description = "Web subnet name"
  value = azurerm_subnet.websubnet.name
}

# Subnet id
output "web_subnet_id" {
  description = "web subnet id"
  value = azurerm_subnet.websubnet.id
}

# Network Security Group outputs
## Web subnet nsg name
output "web_subnet_nsg_name" {
  description = "Web subnet nsg name"
  value = azurerm_network_security_group.web_subnet_nsg.name
}

# web subnet nsg id
output "web_subnet_nsg_id" {
  description = "Web subnet nsg ID"
  value = azurerm_network_security_group.web_subnet_nsg.id
}