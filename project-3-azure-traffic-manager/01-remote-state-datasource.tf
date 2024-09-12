# Project : 1 East US2 Datasource
data "terraform_remote_state" "project1_eastus2" {
  backend = "azurerm"

  config = {
    resource_group_name = "terraform-storage-rg"
    storage_account_name = "terraformstate201"
    container_name = "tfstatefiles"
    key = "project1-eastus2-terraform.tfstate"
  }
}

# Project : 2 West US2 database
data "terraform_remote_state" "project2_westus2" {
  backend = "azurerm"
  config = {
    resource_group_name = "terraform-storage-rg"
    storage_account_name = "terraformstate201"
    container_name = "tfstatefiles"
    key = "project2-westus2-terraform.tfstate"
  }
}

/*
1. Project 1 : web lb public ip ID
data.terraform_remote_state.project1_eastus2.outputs.web_lb_public_ip_address_id
2. Project 2 : Web lb public ip ID
data.terraform_remote_state.project2_westus2.outputs.web_lb_public_ip_address_id
*/