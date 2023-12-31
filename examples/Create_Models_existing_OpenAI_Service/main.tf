terraform {
  #backend "azurerm" {}
  backend "local" { path = "terraform-example3.tfstate" }
}

provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy = true
    }
  }
}

#################################################
# PRE-REQS                                      #
#################################################
### Resource group to deploy the Key Vault into
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

##################################################
# MODULE TO TEST                                 #
##################################################
module "openai" {
  source  = "Pwd9000-ML/openai-service/azurerm"
  version = ">= 1.1.0"

  #common
  location = var.location
  tags     = var.tags

  #key vault (To store OpenAI Account and model details, if the KV needs to be created in a different resource group, create it first and pass the resource group name to the module)
  keyvault_resource_group_name                 = azurerm_resource_group.rg.name
  kv_config                                    = var.kv_config
  keyvault_firewall_default_action             = var.keyvault_firewall_default_action
  keyvault_firewall_bypass                     = var.keyvault_firewall_bypass
  keyvault_firewall_allowed_ips                = var.keyvault_firewall_allowed_ips
  keyvault_firewall_virtual_network_subnet_ids = var.keyvault_firewall_virtual_network_subnet_ids

  #Create OpenAI Service?
  create_openai_service      = var.create_openai_service
  openai_resource_group_name = var.openai_resource_group_name #Exisitng resource group name
  openai_account_name        = var.openai_account_name        #Exisitng openai account name

  #Create Model Deployment?
  create_model_deployment = var.create_model_deployment
  model_deployment        = var.model_deployment
}