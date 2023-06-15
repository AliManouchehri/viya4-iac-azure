resource "random_password" "password_postgres_admin_password" {
  length  = 14
  lower   = true
  number  = true
  special = true
  upper   = true
}

resource "azurerm_key_vault_secret" "secret-postgres-admin-password" {
  name         = "${var.prefix}-postgres-admin-password"
  value        = random_password.password_postgres_admin_password.result
  key_vault_id = data.azurerm_key_vault.sas-viya-keyvault.id
  tags         = data.azurerm_key_vault.sas-viya-keyvault.tags
}