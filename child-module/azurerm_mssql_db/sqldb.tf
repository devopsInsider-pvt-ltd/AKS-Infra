resource "azurerm_mssql_database" "sql-db" {
  for_each = var.sqldb
  name         = each.value.db_name
  server_id    = data.azurerm_mssql_server.sql[each.key].id
  collation    = each.value.collation
  license_type = each.value.license_type
  max_size_gb  = each.value.max_size_gb
  sku_name     = each.value.sku_name
  enclave_type = each.value.enclave_type

}

variable "sqldb" {}

data "azurerm_mssql_server" "sql" {
  for_each = var.sqldb
  name = each.value.sql_name
  resource_group_name = each.value.rg_name
}
