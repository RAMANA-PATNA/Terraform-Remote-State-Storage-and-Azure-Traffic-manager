## Web linux vmss input place holder file
variable "web_vmss_nsg_inbound_ports" {
  description = "web vmss nsg inbound ports"
  type = list(string)
  default = [ 22, 80, 443 ]
}