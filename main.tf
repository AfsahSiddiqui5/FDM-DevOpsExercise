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
  client_id = "123456789"
}

# Create a resource group
resource "azurerm_resource_group" "test-rg" {
  name     = "example-rg"
  location = "West Europe"
}