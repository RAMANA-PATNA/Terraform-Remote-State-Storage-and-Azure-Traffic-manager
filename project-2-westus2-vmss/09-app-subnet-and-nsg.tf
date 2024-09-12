# Resource : AppTier subnet
resource "azurerm_subnet" "appsubnet" {
  name = "${local.resource_name_prefix}-${var.app_subnet_name}"
  resource_group_name = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes = var.app_subnet_address

}

# Resource : Create Network Security Group
resource "azurerm_network_security_group" "app_subnet_nsg" {
  name = "${azurerm_subnet.appsubnet}-nsg"
  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
}

# Resource : Associate Network security Group with subnet
resource "azurerm_subnet_network_security_group_association" "app_subnet_nsg_associate" {
  depends_on = [ azurerm_network_security_rule.app_nsg_rule_inbound ]
  subnet_id = azurerm_subnet.appsubnet.id
  network_security_group_id = azurerm_network_security_group.app_subnet_nsg.id
}

# Resource : Create Network Security Group rule
## Create locals for security rule
locals {
  app_inbound_ports_map = {
    "100" : "83"
    "110" : "1432"
    "120" : "5432"
  }
}
resource "azurerm_network_security_rule" "app_nsg_rule_inbound" {
  for_each = local.app_inbound_ports_map
  name = "Rule-Ports-${each.value}"
  priority = each.key
  protocol = "Tcp"
  direction = "Inbound"
  access = "Allow"
  source_port_range = "*"
  destination_port_range = each.key
  source_address_prefix = "*"
  destination_address_prefix = "*"
  resource_group_name = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.app_subnet_nsg.name
}