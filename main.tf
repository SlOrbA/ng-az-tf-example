provider "azurerm" {
  features {}
}

# Create a resource group for the Angular app
resource "azurerm_resource_group" "example" {
  name     = "example-${random_string.example.result}"
  location = "westeurope"
}

resource "random_string" "example" {
  length  = 4 
  upper   = false
  special = false
}

resource "azurerm_storage_account" "example" {
  name                     = "example${random_string.example.result}"
  location                 = azurerm_resource_group.example.location
  resource_group_name      = azurerm_resource_group.example.name
  account_kind             = "StorageV2"
  account_tier             = "Standard"
  account_replication_type = "LRS"

  static_website {
    error_404_document = "index.html"
    index_document     = "index.html"
  }

}

#resource "azurerm_storage_container" "web" {
#  name                     = "$web"
#  storage_account_name     = azurerm_storage_account.example.name
#}

resource "null_resource" "example" {
  provisioner "local-exec" {
    command = "az storage blob upload-batch --destination '$web' --source example-app/dist/example-app"
    environment = {
      AZURE_STORAGE_ACCOUNT = azurerm_storage_account.example.name
      AZURE_STORAGE_KEY     = azurerm_storage_account.example.primary_access_key
    }
  }
  depends_on = [azurerm_storage_account.example]
}

resource "azurerm_cdn_profile" "example" {
  name                = "example-cdn"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  sku                 = "Standard_Microsoft"
}

resource "azurerm_cdn_endpoint" "example" {
  name                = "example-cdn-${random_string.example.result}"
  profile_name        = azurerm_cdn_profile.example.name
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  origin_host_header  = basename(azurerm_storage_account.example.primary_web_endpoint)

  origin {
    name      = azurerm_storage_account.example.name
    host_name = basename(azurerm_storage_account.example.primary_web_endpoint)
  }
}

resource "azurerm_application_insights" "example" {
  name                = "example-appinsights"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  application_type    = "web"
}
