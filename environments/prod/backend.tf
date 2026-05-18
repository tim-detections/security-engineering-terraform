terraform {
  backend "azurerm" {
    resource_group_name  = "Prod_Environment"
    storage_account_name = "timterraformstateprod"
    container_name       = "tfstate"
    key                  = "sentinel-prod.tfstate"
  }
}
