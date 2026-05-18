# ==========================================
# PROD ENVIRONMENT: AZURE PROVIDER
# ==========================================

terraform {
  required_version = ">= 1.0"
  
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

# Configures the Azure Resource Manager Provider
provider "azurerm" {
  features {}
  
}
