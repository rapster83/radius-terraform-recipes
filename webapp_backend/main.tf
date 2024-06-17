resource "azurerm_resource_group" "this" {
  name     = "rg-${var.project_name}-${var.location_short}-${var.stage}-001"
  location = var.location
}

resource "azurerm_virtual_network" "this" {
  name                = "vnet-${var.project_name}-${var.location_short}-${var.stage}-001"
  location            = var.location
  resource_group_name = azurerm_resource_group.this.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name           = "SubnetFrontend"
    address_prefix = "10.0.1.0/24"
  }

  subnet {
    name           = "SubnetBackend"
    address_prefix = "10.0.2.0/24"
  }
}

resource "azurerm_storage_account" "this" {
  count                    = var.create_storage_account ? 1 : 0
  name                     = "sa${var.project_name}${var.location_short}${var.stage}001"
  resource_group_name      = azurerm_resource_group.this.name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_redis_cache" "this" {
  count               = var.create_redis_cache ? 1 : 0
  name                = "rc-${var.project_name}-${var.location_short}-${var.stage}-001"
  location            = var.location
  resource_group_name = azurerm_resource_group.this.name
  capacity            = 2
  family              = "C"
  sku_name            = "Standard"
  enable_non_ssl_port = false
  minimum_tls_version = "1.2"
}
