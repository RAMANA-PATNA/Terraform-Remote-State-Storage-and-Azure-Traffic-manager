## Virtual Network Input placeholder file
# Virtual Network Name
variable "vnet_name" {
  description = "Virtual Network Name"
  type = string
  default = "vnet"
}

# Virtua lNetwork address space
variable "vnet_address_space" {
  description = "Virtual Network Address Space"
  type = list(string)
  default = [ "10.0.1.0/16" ]
}

## Subnet and Network Security Group inputs
# Web subnet name
variable "web_subnet_name" {
  description = "Web subnet name"
  type = string
  default = "websubnet"
}

# Web subnet address 
variable "web_subnet_address" {
  description = "Web subnet address"
  type = list(string)
  default = [ "10.0.1.0/24" ]
}

# App subnet name
variable "app_subnet_name" {
  description = "App subnet name"
  type = string
  default = "appsubnet"
}

# App subnet address
variable "app_subnet_address" {
  description = "App subnet address"
  type = list(string)
  default = [ "10.0.11.0/24" ]
}

# DB subnet name
variable "db_subnet_name" {
  description = "Db subnet name"
  type = string
  default = "dbsubnet"
}

# Db subnet address
variable "db_subnet_address" {
  description = "Db subnet address"
  type = list(string)
  default = [ "10.0.21.0/24" ]
}

# bastion subnet name
variable "bastion_subnet_name" {
  description = "Bastion subnet name"
  type = string
  default = "bastionsubnet"
}

# Bastion subnet address
variable "bastion_subnet_address" {
  description = "Bastion subnet address"
  type = list(string)
  default = [ "10.0.100.0/24" ]
}