terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  #   skip_provider_registration = true # This is only required when the User, Service Principal, or Identity running Terraform lacks the permissions to register Azure Resource Providers.
  features {}
  client_id       = "b1cec3d8-e114-43bd-a612-74126f748e0a"
  client_secret   = "qlm8Q~z2-F_Q3MuGKcmXyMxmjfcD0WfUSx9h-cHm"
  tenant_id       = "7b09584e-1589-43d5-ab4e-9ffb4094db86"
  subscription_id = "cd08ac40-8cd5-41dd-8e2d-55dd005484d8"
}
