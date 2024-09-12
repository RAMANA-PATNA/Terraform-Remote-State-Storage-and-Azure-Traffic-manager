# Terraform block
terraform {
  required_version = ">= 1.0"
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = ">= 2.0"
    }

    random = {
        source = "hashicorp/random"
        version = ">= 3.0"
    }

    
  }
  backend "azurerm" {
    resource_group_name  = "terraform-storage-rg"
    storage_account_name = "terraformstate201"
    container_name       = "tfstatefiles"
    key                  = "project2-westus2-terraform.tfstate"
  }

}

# Provider block
provider "azurerm" {
  features {
  }
}