## Generic input variables
# Business devision
variable "business_devision" {
  description = "Business devision in the large organization this infrastacure belong"
  type = string
  default = "sap"
}

# Envirnoment
variable "envirnoment" {
  description = "Envirnoment variables is used as prefix"
  type = string
  default = "dev"
}

# Resource Group Name
variable "resource_group_name" {
  description = "Resource Group name"
  type = string
  default = "rg"
}

# Resource Group location
variable "resource_group_location" {
  description = "Resource Group location"
  type = string
  default = "centralindia"
}