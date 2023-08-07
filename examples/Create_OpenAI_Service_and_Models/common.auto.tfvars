### Common Variables ###
resource_group_name = "Terraform-Cognitive-Services-Example1"
location            = "uksouth"
tags = {
  Terraform   = "True"
  Description = "Azure OpenAI Service"
  Author      = "Marcel Lupo"
  GitHub      = "https://github.com/Pwd9000-ML/terraform-azurerm-openai-service"
}

# solution specific variables
kv_config = {
  name = "openaikv1001"
  sku  = "standard"
}
keyvault_firewall_default_action             = "Deny"
keyvault_firewall_bypass                     = "AzureServices"
keyvault_firewall_allowed_ips                = ["0.0.0.0/0"] #for testing purposes only - allow all IPs
keyvault_firewall_virtual_network_subnet_ids = []

### Create OpenAI Service ###
create_openai_service                     = true
openai_account_name                       = "pwd1001"
openai_custom_subdomain_name              = "pwd1001" #translates to 'pwd1001.openai.azure.com'
openai_sku_name                           = "S0"
openai_local_auth_enabled                 = true
openai_outbound_network_access_restricted = false
openai_public_network_access_enabled      = true
openai_identity = {
  type = "SystemAssigned"
}

### Create Model deployment ###
create_model_deployment = true
model_deployment = [
  {
    deployment_id = "gpt35turbo16k"
    model         = "gpt-35-turbo-16k"
    model_format  = "OpenAI"
    model_version = "0613"
    scale_type    = "Standard"
  },
  {
    deployment_id = "gpt35turbo"
    model         = "gpt-35-turbo"
    model_format  = "OpenAI"
    model_version = "0613"
    scale_type    = "Standard"
  }
]