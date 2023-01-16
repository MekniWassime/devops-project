terraform {
  backend "azurerm" {
    resource_group_name  = "backend-storage-ressource-group"
    storage_account_name = "devopsprojectbackend0000"
    container_name       = "tfstate"
    key                  = "argocd_stack.json"
  }
}

data "azurerm_key_vault" "this" {
  name                = "backendkeyvault0000"
  resource_group_name = "backend-storage-ressource-group"
}

data "azurerm_key_vault_secret" "kube_config" {
  name         = "kube-config"
  key_vault_id = data.azurerm_key_vault.this.id
}

locals {
  kube_config            = yamldecode(data.azurerm_key_vault_secret.kube_config.value)
  host                   = local.kube_config.host
  username               = local.kube_config.username
  password               = local.kube_config.password
  client_certificate     = base64decode(local.kube_config.client_certificate)
  client_key             = base64decode(local.kube_config.client_key)
  cluster_ca_certificate = base64decode(local.kube_config.cluster_ca_certificate)
}

provider "kubernetes" {
  host                   = local.host
  username               = local.username
  password               = local.password
  client_certificate     = local.client_certificate
  client_key             = local.client_key
  cluster_ca_certificate = local.cluster_ca_certificate
}

provider "helm" {
  kubernetes {
    host                   = local.host
    username               = local.username
    password               = local.password
    client_certificate     = local.client_certificate
    client_key             = local.client_key
    cluster_ca_certificate = local.cluster_ca_certificate
  }
}

provider "azurerm" {
  features {}
}
