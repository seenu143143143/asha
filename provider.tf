###########################
## Azure Provider - Main ##
###########################

# Define Terraform provider

terraform {
  required_version = ">= 0.14"
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~> 2.51.0"
    }
  }
}

# Configure the Azure provider

provider "azurerm" {

  skip_provider_registration = true
  environment = var.environment
  features {}
      subscription_id = var.azure-subscription-id
      client_id       = var.azure-client-id
      client_secret   = var.azure-client-secret
      tenant_id      = var.azure-tenant-id

}