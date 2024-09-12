# Traffic manager FQDN outputs
output "traffic_manager_fqdn" {
  description = "Traffic Manager FQDN"
  value = azurerm_traffic_manager_profile.tm-profile.fqdn
}