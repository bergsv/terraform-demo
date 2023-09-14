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
      key                  = "IOMwUlqvogo8f2UJag8iUpT6Arg6SFL/JVSea/+0Lyl+LPkPb/+krvZG8FJglmEURhbqlHzhtOEt+ASttyQU6g=="
  }

}

provider "azurerm" {
  use_oidc = true
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "rg-terraform-demose"
  location = "westus2"
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
