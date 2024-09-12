# Resource : DB tier subnet
resource "azurerm_subnet" "dbsubnet" {
  name = "${local.resource_name_prefix}-${var.db_subnet_name}"
  resource_group_name = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes = var.db_subnet_address
}

# Resource : DB subnet network security Group
resource "azurerm_network_security_group" "db_subnet_nsg" {
  name = "${azurerm_subnet.dbsubnet.name}-nsg"
  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
}

# Resource : Associate subnet and Network Security group
resource "azurerm_subnet_network_security_group_association" "db_subnet_nsg_assocaite" {
  depends_on = [ azurerm_network_security_rule.db_nsg_rule_inbound ]
  subnet_id = azurerm_subnet.dbsubnet.id
  network_security_group_id = azurerm_network_security_group.db_subnet_nsg.id
}

# Resource: Network Security Group rule
# locals for security rule
locals {
  db_inbound_ports_map = {
    "100" : "83"
    "110" : "998"
    "120" : "243"
  }
}

resource "azurerm_network_security_rule" "db_nsg_rule_inbound" {
  for_each = local.db_inbound_ports_map
  name = "Rule-Ports-${each.value}"
  priority = each.key
  protocol = "Tcp"
  access = "Allow"
  direction = "Inbound"
  source_port_range = "*"
  destination_port_range = each.value
  source_address_prefix = "*"
  destination_address_prefix = "*"
  resource_group_name = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.db_subnet_nsg.name
}