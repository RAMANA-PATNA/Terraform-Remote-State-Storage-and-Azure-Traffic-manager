# Resource : public ip address for azure load balancer
resource "azurerm_public_ip" "web_publicip" {
  name = "${local.resource_name_prefix}-web-publicip"
  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
  tags = local.common_tags
  sku = "Standard"
  allocation_method = "Static"
}

# Resource : Azure Standard load balancer
resource "azurerm_lb" "web_lb" {
  name = "${local.resource_name_prefix}-web-lb"
  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
  sku = "Standard"

  frontend_ip_configuration {
    name = "web-lb-publicip-1"
    public_ip_address_id = azurerm_public_ip.web_publicip.id
  }
}

# Resource  : Create lb backend pool
resource "azurerm_lb_backend_address_pool" "web_lb_backend_address_pool" {
  name = "web-lb_backend"
  loadbalancer_id = azurerm_lb.web_lb.id
}

# Resource : Azure LB probe
resource "azurerm_lb_probe" "web_lb_probe" {
  name = "web-lb-probe"
  protocol = "Tcp"
  port = 80
  loadbalancer_id = azurerm_lb.web_lb.id
}

# Resource: Create LB rule
resource "azurerm_lb_rule" "web_lb_rule_app1" {
  name = "web-rule-app1"
  protocol = "Tcp"
  frontend_port = 80
  backend_port = 80
  probe_id = azurerm_lb_probe.web_lb_probe.id
  loadbalancer_id = azurerm_lb.web_lb.id
  frontend_ip_configuration_name = azurerm_lb.web_lb.frontend_ip_configuration[0].name
  backend_address_pool_ids = [azurerm_lb_backend_address_pool.web_lb_backend_address_pool.id]
}