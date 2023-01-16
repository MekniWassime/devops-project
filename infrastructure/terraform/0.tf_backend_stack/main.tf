resource "azurerm_resource_group" "this" {
  name     = "backend-storage-ressource-group"
  location = "France Central"
}

resource "azurerm_storage_account" "this" {
  name                     = "devopsprojectbackend0000"
  resource_group_name      = azurerm_resource_group.this.name
  location                 = azurerm_resource_group.this.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "staging"
  }
}

resource "azurerm_storage_container" "this" {
  name                  = "tfstate"
  storage_account_name  = azurerm_storage_account.this.name
  container_access_type = "private"
}

data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "this" {
  name                        = "backendkeyvault0000"
  location                    = azurerm_resource_group.this.location
  resource_group_name         = azurerm_resource_group.this.name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get",
    ]

    secret_permissions = [
      "Get",
      "Set",
      "Delete",
      "List",
      "Purge"
    ]

    storage_permissions = [
      "Get",
    ]
  }
}

# resource "azurerm_management_lock" "resource-group-level" {
#   name       = "backend-ressource-group-lock"
#   scope      = azurerm_resource_group.this.id
#   lock_level = "ReadOnly"
#   notes      = "This Resource Group is Read-Only"
# }
