output "backend_ressource_group_name" {
  value = azurerm_resource_group.this.name
}

output "backend_key_vault_name" {
  value = azurerm_key_vault.this.name
}

output "backend_account_name" {
  value = azurerm_storage_account.this.name
}

output "backend_container_name" {
  value = azurerm_storage_container.this.name
}

resource "azurerm_key_vault_secret" "backend_account_name" {
  name         = "backend-account-name"
  value        = azurerm_storage_account.this.name
  key_vault_id = azurerm_key_vault.this.id
}

resource "azurerm_key_vault_secret" "backend_container_name" {
  name         = "backend-container-name"
  value        = azurerm_storage_container.this.name
  key_vault_id = azurerm_key_vault.this.id
}
