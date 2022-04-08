provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "ejemplo1"
  location = "Central US"
}

resource "azurerm_app_service_plan" "example" {
  name                = "api-pro"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  sku {
    tier = "Free"
    size = "F1"

  }
}

resource "azurerm_app_service" "example" {
  name                = "servicejemplo"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  app_service_plan_id = azurerm_app_service_plan.example.id
}
