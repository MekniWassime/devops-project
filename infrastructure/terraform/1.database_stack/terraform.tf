terraform {
  backend "azurerm" {
    resource_group_name  = "backend-storage-ressource-group"
    storage_account_name = "devopsprojectbackend0000"
    container_name       = "tfstate"
    key                  = "database_stack.json"
  }
}

provider "azurerm" {
  features {}
}
