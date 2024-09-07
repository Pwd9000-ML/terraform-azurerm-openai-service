# Example: Create OpenAI Service and Models

This example module creates a new resource group, new cognitive OpenAI service, and two model deployments. It will then run a test to ensure the model deployment is working as expected and save the OpenAI Account and Model deployment details into an Azure Key Vault ready for consumption by other services.

## Workflow

**Step1:** Create a new resource group and Azure Key Vault to store secrets.  
**Step2:** Create a new cognitive OpenAI service in the same resource group as the Key Vault. A different resource group can be used if needed.  
**Step3:** Create model deployments on the newly created OpenAI service.  
**Step4:** Save the OpenAI Account and Model deployments details into the Key Vault.  

![image.png](https://raw.githubusercontent.com/Pwd9000-ML/terraform-azurerm-openai-service/master/assets/flow1.png)

## Resources Created

- **Key Vault** - Used to store OpenAI Service Account and Model Deployment secrets.
- **Cognitive OpenAI Service** - The OpenAI service/account.

![image.png](https://raw.githubusercontent.com/Pwd9000-ML/terraform-azurerm-openai-service/master/assets/resources1.png)

## Models Deployed

- **GPT-35-Turbo** - The GPT-3.5 Turbo model deployment.
- **GPT-35-Turbo-16K** - The GPT-3.5 Turbo 16K model deployment.

![image.png](https://raw.githubusercontent.com/Pwd9000-ML/terraform-azurerm-openai-service/master/assets/deployments1.png)

## Secrets Saved

![image.png](https://raw.githubusercontent.com/Pwd9000-ML/terraform-azurerm-openai-service/master/assets/secrets1.png)

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_openai"></a> [openai](#module\_openai) | Pwd9000-ML/openai-service/azurerm | >= 1.1.0 |

## Resources

| Name | Type |
|------|------|
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_model_deployment"></a> [create\_model\_deployment](#input\_create\_model\_deployment) | Create the model deployment. | `bool` | `false` | no |
| <a name="input_create_openai_service"></a> [create\_openai\_service](#input\_create\_openai\_service) | Create the OpenAI service. | `bool` | `false` | no |
| <a name="input_keyvault_firewall_allowed_ips"></a> [keyvault\_firewall\_allowed\_ips](#input\_keyvault\_firewall\_allowed\_ips) | value of key vault firewall allowed ip rules. | `list(string)` | `[]` | no |
| <a name="input_keyvault_firewall_bypass"></a> [keyvault\_firewall\_bypass](#input\_keyvault\_firewall\_bypass) | List of key vault firewall rules to bypass. | `string` | `"AzureServices"` | no |
| <a name="input_keyvault_firewall_default_action"></a> [keyvault\_firewall\_default\_action](#input\_keyvault\_firewall\_default\_action) | Default action for key vault firewall rules. | `string` | `"Deny"` | no |
| <a name="input_keyvault_firewall_virtual_network_subnet_ids"></a> [keyvault\_firewall\_virtual\_network\_subnet\_ids](#input\_keyvault\_firewall\_virtual\_network\_subnet\_ids) | value of key vault firewall allowed virtual network subnet ids. | `list(string)` | `[]` | no |
| <a name="input_kv_config"></a> [kv\_config](#input\_kv\_config) | Key Vault configuration object to create azure key vault to store openai account details. | <pre>object({<br>    name = string<br>    sku  = string<br>  })</pre> | <pre>{<br>  "name": "kvname",<br>  "sku": "standard"<br>}</pre> | no |
| <a name="input_location"></a> [location](#input\_location) | Azure region where resources will be hosted. | `string` | `"uksouth"` | no |
| <a name="input_model_deployment"></a> [model\_deployment](#input\_model\_deployment) | type = list(object({<br>  deployment\_id   = (Required) The name of the Cognitive Services Account `Model Deployment`. Changing this forces a new resource to be created.<br>  model\_name = {<br>    model\_format  = (Required) The format of the Cognitive Services Account Deployment model. Changing this forces a new resource to be created. Possible value is OpenAI.<br>    model\_name    = (Required) The name of the Cognitive Services Account Deployment model. Changing this forces a new resource to be created.<br>    model\_version = (Required) The version of Cognitive Services Account Deployment model.<br>  }<br>  scale = {<br>    scale\_type     = (Required) Deployment scale type. Possible value is Standard. Changing this forces a new resource to be created.<br>    scale\_tier     = (Optional) Possible values are Free, Basic, Standard, Premium, Enterprise. Changing this forces a new resource to be created.<br>    scale\_size     = (Optional) The SKU size. When the name field is the combination of tier and some other value, this would be the standalone code. Changing this forces a new resource to be created.<br>    scale\_family   = (Optional) If the service has different generations of hardware, for the same SKU, then that can be captured here. Changing this forces a new resource to be created.<br>    scale\_capacity = (Optional) Tokens-per-Minute (TPM). If the SKU supports scale out/in then the capacity integer should be included. If scale out/in is not possible for the resource this may be omitted. Default value is 1. Changing this forces a new resource to be created.<br>  }<br>  rai\_policy\_name = (Optional) The name of RAI policy. Changing this forces a new resource to be created.<br>})) | <pre>list(object({<br>    deployment_id   = string<br>    model_name      = string<br>    model_format    = string<br>    model_version   = string<br>    sku_name      = string<br>    scale_tier      = optional(string)<br>    scale_size      = optional(number)<br>    scale_family    = optional(string)<br>    scale_capacity  = optional(number)<br>    rai_policy_name = optional(string)<br>  }))</pre> | `[]` | no |
| <a name="input_openai_account_name"></a> [openai\_account\_name](#input\_openai\_account\_name) | Name of the OpenAI service. | `string` | `"demo-account"` | no |
| <a name="input_openai_custom_subdomain_name"></a> [openai\_custom\_subdomain\_name](#input\_openai\_custom\_subdomain\_name) | The subdomain name used for token-based authentication. Changing this forces a new resource to be created. (normally the same as the account name) | `string` | `"demo-account"` | no |
| <a name="input_openai_identity"></a> [openai\_identity](#input\_openai\_identity) | type = object({<br>  type         = (Required) The type of the Identity. Possible values are `SystemAssigned`, `UserAssigned`, `SystemAssigned, UserAssigned`.<br>  identity\_ids = (Optional) Specifies a list of User Assigned Managed Identity IDs to be assigned to this OpenAI Account.<br>}) | <pre>object({<br>    type = string<br>  })</pre> | <pre>{<br>  "type": "SystemAssigned"<br>}</pre> | no |
| <a name="input_openai_local_auth_enabled"></a> [openai\_local\_auth\_enabled](#input\_openai\_local\_auth\_enabled) | Whether local authentication methods is enabled for the Cognitive Account. Defaults to `true`. | `bool` | `true` | no |
| <a name="input_openai_outbound_network_access_restricted"></a> [openai\_outbound\_network\_access\_restricted](#input\_openai\_outbound\_network\_access\_restricted) | Whether or not outbound network access is restricted. Defaults to `false`. | `bool` | `false` | no |
| <a name="input_openai_public_network_access_enabled"></a> [openai\_public\_network\_access\_enabled](#input\_openai\_public\_network\_access\_enabled) | Whether or not public network access is enabled. Defaults to `false`. | `bool` | `true` | no |
| <a name="input_openai_sku_name"></a> [openai\_sku\_name](#input\_openai\_sku\_name) | SKU name of the OpenAI service. | `string` | `"S0"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Name of the resource group to create where resources will be hosted. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of key value pairs that is used to tag resources created. | `map(string)` | `{}` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->