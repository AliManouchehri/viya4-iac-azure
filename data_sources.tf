provider "azurerm" {
  alias           = "p"
  subscription_id = var.subscription_id
  features {}
}

#region Private DNS zones
data "azurerm_private_dns_zone" "pdns_aks" {
  provider            = azurerm.p
  name                = "privatelink.canadacentral.azmk8s.io"
  resource_group_name = var.vnet_resource_group_name
}

data "azurerm_private_dns_zone" "flexpsql" {
  provider            = azurerm.p
  name                = "privatelink.postgres.database.azure.com"
  resource_group_name = var.vnet_resource_group_name
}

#endregion Private DNS zones

# a pre-existing key vault
data "azurerm_key_vault" "sas-viya-keyvault" {
  name                = "${var.prefix}-kv-sasviya"
  resource_group_name = var.resource_group_name
}

#endregion Azure AD
