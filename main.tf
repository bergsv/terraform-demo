# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.72.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "tfstate"
    storage_account_name = "tfstate17896"
    container_name       = "tfstate"
    key                  = "prod.terraform.tfstate"
    use_oidc             = true
    subscription_id      = "dbbf7928-cbf2-4ffd-80d1-3c35b6cce5aa"
    tenant_id            = "0e3d417e-c425-4353-92d0-406535d8b62b"
  }
}

provider "azurerm" {
  use_oidc = true
  features {}
}

resource "azurerm_resource_group" "example10" {
  name     = "rg-${var.rg_name}"
  location = "westeurope"
}

/* resource "azurerm_virtual_network" "example" {
  name                = "vnet-terraform-demo"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
}

resource "azurerm_subnet" "example" {
  name                 = "subnet-terraform-demo"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_network_interface" "example" {
  name                = "nic-terraform-demo"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.example.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "example" {
  name                = "vm-terraform-demo"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  network_interface_ids = [
    azurerm_network_interface.example.id,
  ]

  size = "Standard_B1s"

  admin_username = "adminuser"
  admin_password = "AdminPassword12345!"

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
} */
