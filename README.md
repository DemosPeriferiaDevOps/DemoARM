#infraestructura con terraform en AZURE

Para realizar la infaestructura necesitamos tener instalado
*Visual estudio = https://code.visualstudio.com/download
*Azure CLI = https://docs.microsoft.com/en-us/cli/azure/install-azure-cli
*Terraform = https://www.terraform.io/downloads

#Pasos
*como primer paso necesitamos crear un archivo .tf (Ejemplo: main.tf)
*editaremos el archivo comendo con el codigo para la creacion de grupos de recursos
``` 

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "ejemplo1"
  location = "Central US"
}

```     
