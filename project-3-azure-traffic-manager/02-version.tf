# Terrform block
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
  # Terraform State storage to Azure    Storage container
  backend "azurerm" {
    resource_group_name = "terraform-storage-rg"
    storage_account_name = "terraformstate201"
    container_name = "tfstatefiles"
    key = "project3-traffic-manager-terraform.tfstate"
  }
}

# Provider block
provider "azurerm" {
  features { }
}