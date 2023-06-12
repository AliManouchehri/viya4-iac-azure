provider "azurerm" {
  alias           = "p"
  subscription_id = var.subscription_id
  features {}
}

#region Private DNS zones
data "azurerm_private_dns_zone" "pdns_aks" {
  provider            = azurerm.p
  name                = "${var.private_dns_zone_name}.privatelink.canadacentral.azmk8s.io"
  resource_group_name = "rg_imsd_ops_dns_pr"
}

data "azurerm_private_dns_zone" "pdns_postgresql" {
  provider            = azurerm.p
  name                = "${var.server_name}.privatelink.postgres.database.azure.com"
  resource_group_name = "rg_imsd_ops_dns_pr"
}
#endregion Private DNS zones

#region Azure AD
data "azuread_group" "group_sas_viya_admin" {
  display_name = var.sas_viya_admin_group_name
}

data "azuread_group" "group_cloud_admin" {
  display_name = var.cloud_admin_group
}
#endregion Azure AD
