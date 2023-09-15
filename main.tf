# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.73.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rg-tfstate"
    storage_account_name = "tfstate52343"
    container_name       = "tfstate"
    key                  = "foermchen.terraform.tfstate"
    use_oidc             = true
    subscription_id      = "dbbf7928-cbf2-4ffd-80d1-3c35b6cce5aa"
    tenant_id            = "0e3d417e-c425-4353-92d0-406535d8b62b"
  }
}

provider "azurerm" {
  use_oidc = true
  features {}
}

resource "azurerm_resource_group" "database" {
  name     = "rg-${var.environment}-database"
  location = "westeurope"
}

resource "azurerm_resource_group" "webapp" {
  name     = "rg-${var.environment}-webapp"
  location = "westeurope"
}