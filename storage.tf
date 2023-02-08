terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

resource "azurerm_storage_account" "sa-one" {
  name                     = "abc-storage-account"
  resource_group_name      = azurerm_resource_group.test-rg.name
  location                 = azurerm_resource_group.test-rg.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    "name" = "first-sa"
  }
}

resource "azurerm_storage_account" "sa-two" {
  name                     = "xyz-storage-account"
  resource_group_name      = azurerm_resource_group.test-rg.name
  location                 = azurerm_resource_group.test-rg.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  depends_on = [azurerm_storage_account.sa-one]
  
  tags = {
    "name" = "second-sa"
  }
}