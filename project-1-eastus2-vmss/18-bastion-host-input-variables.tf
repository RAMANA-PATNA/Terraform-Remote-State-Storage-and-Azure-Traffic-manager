# Bastion linux VM place holder file
variable "bastion_service_host_name" {
  description = "Bastion Service host name"
  default = "AzureBastionSubnet"
}

variable "bastion_service_address_prefixes" {
  description = "Bastion Service Address prefixes"
  default = ["10.0.100.0/27"]
}