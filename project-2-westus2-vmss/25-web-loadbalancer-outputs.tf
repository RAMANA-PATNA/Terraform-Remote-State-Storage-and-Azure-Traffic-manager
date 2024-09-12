# LB public ip
output "web_lb_public_ip_address" {
  description = "web loadbalancer public ip address"
  value = azurerm_public_ip.web_publicip.ip_address
}

#Load balancer ID
output "web_lb_id" {
  description = "Web Loadbalacer ID"
  value = azurerm_lb.web_lb.id
}

# Load balacer frontend ip configuration block
output "web_lb_frontend_ip_configuration" {
  description = "Web loadbalacner frontend ip configuration"
  value = [azurerm_lb.web_lb.frontend_ip_configuration]
}