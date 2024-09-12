## Generic input variables placeholder file

# Business devision
variable "business_devision" {
  description = "Business devision"
  type = string
  default = "SAP"
}

# Envirnoment
variable "envirnoment" {
  description = "Business envirnoment"
  type = string
  default = "dev"
}

# Resource Group name
variable "resource_group" {
  description = "Resource Group"
  type = string
  default = "rg"
}

# Resource Group location
variable "resource_group_location" {
  description = "Resource Group location"
  type = string
  default = "centralindia"
}

