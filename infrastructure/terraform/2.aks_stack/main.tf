resource "azurerm_resource_group" "this" {
  name     = "k8s-cluster-resource-group"
  location = "East US"
}

resource "azurerm_kubernetes_cluster" "this" {
  name                = "aks-cluster"
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  dns_prefix          = "aks-cluster"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Production"
  }
}

data "azurerm_key_vault" "this" {
  name                = "backendkeyvault0000"
  resource_group_name = "backend-storage-ressource-group"
}

resource "azurerm_key_vault_secret" "kube_config" {
  name         = "kube-config"
  value        = yamlencode(azurerm_kubernetes_cluster.this.kube_config.0)
  key_vault_id = data.azurerm_key_vault.this.id
}
