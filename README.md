# infraestructura con terraform en AZURE

Para realizar la infaestructura necesitamos tener instalado
* Visual estudio = https://code.visualstudio.com/download
* Azure CLI = https://docs.microsoft.com/en-us/cli/azure/install-azure-cli
* Terraform = https://www.terraform.io/downloads

# Pasos
* como primer paso necesitamos crear un archivo .tf (Ejemplo: main.tf)
* editaremos el archivo comendo con el codigo para la creacion de grupos de recursos
``` 

provider "azurerm" {
  features {} #esta aprte es importante para que no nos genere error de que no se han declarado features
}

resource "azurerm_resource_group" "example" {
  name     = "ejemplo1" 
  location = "Central US"
}

```     

Aca debemos de cambiar el name y si se requiere la localizacion 

* ahora necesitaremos crear el codigo en el mismo archivo para un app service plan 

```  

resource "azurerm_app_service_plan" "example" {
  name                = "api-pro"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  sku {
    tier = "Free" #Cambiar si no se relizara en la capa gratuita
    size = "F1"   #Cambiar si no se relizara en la capa gratuita

  }
}

```  

en esta parte solo editaremos el name 

* por ultimo en el mismo archivo se agrega la aprte para creacion de un app service 
``` 

resource "azurerm_app_service" "example" {
  name                = "servicejemplo"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  app_service_plan_id = azurerm_app_service_plan.example.id
}

``` 
aca solo se cambiara el nombre  (Name)

# CODIGO COMPLETO
```

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

```

# Comandos terraform para realizar la infraestructura

* el primer comando que se usara sera ```terraform init``` , el cual comenzara a instalar los plugins necesarios para realizar el despliegue en el portal de AZURE
* Despues se usara el comando ```terraform fmt --recursive``` este comando nos ayudara a arrelgar sintaxis como espacios 
* Despues de este comando se realiza un  ```terraform plan``` con este comando se visualizara que se va a crear 
* iniciaremos sesion con el portal de AZURe con el comando ```az login```
* una vez iniciada sesion usaremos el comando ```terraform apply``` para crear nuestras secciones de codigo (Se crearan 3 recursos)
* una vez terminado de usar todos nuestros recursos es recomendado usar ```terraform destroy``` para dejar de gastar recursos 
