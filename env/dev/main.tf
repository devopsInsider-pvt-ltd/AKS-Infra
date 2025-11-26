module "rg" {
  source = "../../child-module/azurerm_resource_group"
  rgs = var.rg-dev
}

module "aks" {
  depends_on = [ module.rg ]
  source = "../../child-module/azurerm_kubernates_cluster"
  aks = var.aks-dev
}

module "acr" {
  depends_on = [ module.rg ]
  source = "../../child-module/azurerm_container_registry"
  acr = var.acr-dev
}

module "sql" {
  depends_on = [ module.rg ]
  source = "../../child-module/azurerm_mssql_server"
  sql = var.sql-dev
}

module "sqldb" {
  depends_on = [ module.sql ]
  source = "../../child-module/azurerm_mssql_db"
  sqldb = var.sqldb-dev
}