## Terraform tfvars file place holder
business_devision       = "hr"
envirnoment             = "dev"
resource_group          = "rg"
resource_group_location = "centralindia"

vnet_name          = "Vnet"
vnet_address_space = [ "10.1.0.0/16" ]

web_subnet_name    = "websubnet"
web_subnet_address = [ "10.1.1.0/24" ]

app_subnet_name     = "appsubnet"
app_subnet_address  = [ "10.1.11.0/24" ]

db_subnet_name     = "dbsubnet"
db_subnet_address  =  [ "10.1.22.0/24" ]

bastion_subnet_name    = "bastionsubnet"
bastion_subnet_address = [ "10.1.100.0/24" ]




web_vmss_nsg_inbound_ports = [22, 80, 443]
