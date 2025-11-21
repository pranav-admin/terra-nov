terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.52.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "2df30ff1-915d-4d35-974a-3d3155aaa413"
  client_id       = "1624bd86-8bac-41c7-9597-83a619e7faa2"
  client_secret   = "HVW8Q~PQTALBWovaJLo2QdPeEcGFPK.goVsOTcOr"
  tenant_id       = "cabf5d06-7e3a-4d14-b7f4-2b5819ed881e"

}