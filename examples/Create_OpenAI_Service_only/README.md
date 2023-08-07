# Example: Create OpenAI Service Only

This example module creates a new resource group, Key Vault and a new cognitive OpenAI service only. The OpenAI Account details are saved into an Azure Key Vault ready for consumption by other services. No Model Deployments are created.  

## Workflow

**Step1:** Create a new resource group and Azure Key Vault to store secrets.  
**Step2:** Create a new cognitive OpenAI service in the same resource group as the Key Vault. A different resource group can be used if needed.  
**Step3:** Save the OpenAI Account details into the Key Vault.  

![image.png](https://raw.githubusercontent.com/Pwd9000-ML/terraform-azurerm-openai-service/master/assets/flow2.png)

## Resources Created

- **Key Vault** - Used to store OpenAI Service Account secrets.
- **Cognitive OpenAI Service** - The OpenAI service/account.

![image.png](https://raw.githubusercontent.com/Pwd9000-ML/terraform-azurerm-openai-service/master/assets/res2.png)

## Models Deployed

- **None** - No models deployed.

## Secrets Saved

![image.png](https://raw.githubusercontent.com/Pwd9000-ML/terraform-azurerm-openai-service/master/assets/secrets2.png)

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
| <a name="module_openai"></a> [openai](#module\_openai) | Pwd9000-ML/openai-service/azurerm | >= 1.0.0 |

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