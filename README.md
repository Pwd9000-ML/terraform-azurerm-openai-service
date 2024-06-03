[![Automated-Dependency-Tests-and-Release](https://github.com/Pwd9000-ML/terraform-azurerm-openai-service/actions/workflows/dependency-tests.yml/badge.svg)](https://github.com/Pwd9000-ML/terraform-azurerm-openai-service/actions/workflows/dependency-tests.yml) [![Dependabot](https://badgen.net/badge/Dependabot/enabled/green?icon=dependabot)](https://dependabot.com/)

# Module: Azure OpenAI Service

**NOTE:** Your Azure subscription will need to be whitelisted for **Azure Open AI**. At the release time of this module (August 2023) you will need to request access via this **[form](https://aka.ms/oai/access)** and a further form for **[GPT 4](https://customervoice.microsoft.com/Pages/ResponsePage.aspx?id=v4j5cvGGr0GRqy180BHbR7en2Ais5pxKtso_Pz4b1_xURjE4QlhVUERGQ1NXOTlNT0w1NldTWjJCMSQlQCN0PWcu)**. Once you have access deploy either **GPT-35-Turbo**, **GPT-35-Turbo-16k** or if you have access to **GPT-4-32k**, go forward with that model.  

![image.png](https://raw.githubusercontent.com/Pwd9000-ML/terraform-azurerm-openai-service/master/assets/flow1.png)

## Description

Flexible Terraform Registry module for setting up an Azure hosted **OpenAI service**, **deploy models** on a **new** or **existing** OpenAI service, saving deployment and account details to **Azure Key Vault** ready for consumption by other services hosted in **Azure**.

See **[Create OpenAI Service and Models](https://github.com/Pwd9000-ML/terraform-azurerm-openai-service/tree/master/examples/Create_OpenAI_Service_and_Models):**  
For an example of how to create an **OpenAI Service** hosted on Azure, deploy **Models** and saving the details to an Azure **Key Vault**.  

See **[Create Models on existing OpenAI Account](https://github.com/Pwd9000-ML/terraform-azurerm-openai-service/tree/master/examples/Create_Models_existing_OpenAI_Service):**  
For an example of how to create **Models** hosted on an existing **OpenAI Service** and saving the details to an Azure **Key Vault**.  

See **[Create OpenAI Service Only](https://github.com/Pwd9000-ML/terraform-azurerm-openai-service/tree/master/examples/Create_OpenAI_Service_only):**  
For an example of how to create only an **OpenAI Service** hosted on Azure and saving the details to an Azure **Key Vault**. (No models deployed)  

This module is published on the **[Public Terraform Registry - openai-service](https://registry.terraform.io/modules/Pwd9000-ML/openai-service/azurerm/latest)**  

## Want more?

Want to host your own **Private ChatGPT-like service on Azure?**  

Check out my other Terraform module to deploy your very own private ChatBot/ChatGPT-like container apps instance hosted on **Azure OpenAI** and fronted by Azure Font Door + WAF:  

**[openai-private-chatgpt](https://registry.terraform.io/modules/Pwd9000-ML/openai-private-chatgpt/azurerm/latest)**  

![image.png](https://raw.githubusercontent.com/Pwd9000-ML/terraform-azurerm-openai-service/master/assets/chatbotui2.png)  

Enjoy!

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.8.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.106.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~> 3.106.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_create_model_deployment"></a> [create\_model\_deployment](#module\_create\_model\_deployment) | ./modules/model_deployment | n/a |
| <a name="module_create_openai_service"></a> [create\_openai\_service](#module\_create\_openai\_service) | ./modules/openai_service | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_key_vault.openai_kv](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault) | resource |
| [azurerm_key_vault_secret.openai_endpoint](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret) | resource |
| [azurerm_key_vault_secret.openai_model](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret) | resource |
| [azurerm_key_vault_secret.openai_model_deployment_id](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret) | resource |
| [azurerm_key_vault_secret.openai_primary_key](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret) | resource |
| [azurerm_role_assignment.kv_role_assigment](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) | data source |
| [azurerm_cognitive_account.openai](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/cognitive_account) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_model_deployment"></a> [create\_model\_deployment](#input\_create\_model\_deployment) | Create the model deployment. | `bool` | `false` | no |
| <a name="input_create_openai_service"></a> [create\_openai\_service](#input\_create\_openai\_service) | Create the OpenAI service. | `bool` | `false` | no |
| <a name="input_keyvault_firewall_allowed_ips"></a> [keyvault\_firewall\_allowed\_ips](#input\_keyvault\_firewall\_allowed\_ips) | value of key vault firewall allowed ip rules. | `list(string)` | `[]` | no |
| <a name="input_keyvault_firewall_bypass"></a> [keyvault\_firewall\_bypass](#input\_keyvault\_firewall\_bypass) | List of key vault firewall rules to bypass. | `string` | `"AzureServices"` | no |
| <a name="input_keyvault_firewall_default_action"></a> [keyvault\_firewall\_default\_action](#input\_keyvault\_firewall\_default\_action) | Default action for key vault firewall rules. | `string` | `"Deny"` | no |
| <a name="input_keyvault_firewall_virtual_network_subnet_ids"></a> [keyvault\_firewall\_virtual\_network\_subnet\_ids](#input\_keyvault\_firewall\_virtual\_network\_subnet\_ids) | value of key vault firewall allowed virtual network subnet ids. | `list(string)` | `[]` | no |
| <a name="input_keyvault_resource_group_name"></a> [keyvault\_resource\_group\_name](#input\_keyvault\_resource\_group\_name) | Name of the resource group where the Key Vault will be hosted. | `string` | n/a | yes |
| <a name="input_kv_config"></a> [kv\_config](#input\_kv\_config) | Key Vault configuration object to create azure key vault to store openai account details. | <pre>object({<br>    name = string<br>    sku  = string<br>  })</pre> | <pre>{<br>  "name": "openaikv9000",<br>  "sku": "standard"<br>}</pre> | no |
| <a name="input_location"></a> [location](#input\_location) | Azure region to deploy resources to. | `string` | `"uksouth"` | no |
| <a name="input_model_deployment"></a> [model\_deployment](#input\_model\_deployment) | type = list(object({<br>  deployment\_id   = (Required) The name of the Cognitive Services Account `Model Deployment`. Changing this forces a new resource to be created.<br>  model\_name = {<br>    model\_format  = (Required) The format of the Cognitive Services Account Deployment model. Changing this forces a new resource to be created. Possible value is OpenAI.<br>    model\_name    = (Required) The name of the Cognitive Services Account Deployment model. Changing this forces a new resource to be created.<br>    model\_version = (Required) The version of Cognitive Services Account Deployment model.<br>  }<br>  scale = {<br>    scale\_type     = (Required) Deployment scale type. Possible value is Standard. Changing this forces a new resource to be created.<br>    scale\_tier     = (Optional) Possible values are Free, Basic, Standard, Premium, Enterprise. Changing this forces a new resource to be created.<br>    scale\_size     = (Optional) The SKU size. When the name field is the combination of tier and some other value, this would be the standalone code. Changing this forces a new resource to be created.<br>    scale\_family   = (Optional) If the service has different generations of hardware, for the same SKU, then that can be captured here. Changing this forces a new resource to be created.<br>    scale\_capacity = (Optional) Tokens-per-Minute (TPM). If the SKU supports scale out/in then the capacity integer should be included. If scale out/in is not possible for the resource this may be omitted. Default value is 1. Changing this forces a new resource to be created.<br>  }<br>  rai\_policy\_name = (Optional) The name of RAI policy. Changing this forces a new resource to be created.<br>})) | <pre>list(object({<br>    deployment_id   = string<br>    model_name      = string<br>    model_format    = string<br>    model_version   = string<br>    scale_type      = string<br>    scale_tier      = optional(string)<br>    scale_size      = optional(number)<br>    scale_family    = optional(string)<br>    scale_capacity  = optional(number)<br>    rai_policy_name = optional(string)<br>  }))</pre> | `[]` | no |
| <a name="input_openai_account_name"></a> [openai\_account\_name](#input\_openai\_account\_name) | Name of the OpenAI service. | `string` | `"demo-account"` | no |
| <a name="input_openai_custom_subdomain_name"></a> [openai\_custom\_subdomain\_name](#input\_openai\_custom\_subdomain\_name) | The subdomain name used for token-based authentication. Changing this forces a new resource to be created (normally the same as variable `openai_account_name`) | `string` | `"demo-account"` | no |
| <a name="input_openai_customer_managed_key"></a> [openai\_customer\_managed\_key](#input\_openai\_customer\_managed\_key) | type = object({<br>  key\_vault\_key\_id   = (Required) The ID of the Key Vault Key which should be used to Encrypt the data in this OpenAI Account.<br>  identity\_client\_id = (Optional) The Client ID of the User Assigned Identity that has access to the key. This property only needs to be specified when there're multiple identities attached to the OpenAI Account.<br>}) | <pre>object({<br>    key_vault_key_id   = string<br>    identity_client_id = optional(string)<br>  })</pre> | `null` | no |
| <a name="input_openai_dynamic_throttling_enabled"></a> [openai\_dynamic\_throttling\_enabled](#input\_openai\_dynamic\_throttling\_enabled) | Determines whether or not dynamic throttling is enabled. If set to `true`, dynamic throttling will be enabled. If set to `false`, dynamic throttling will not be enabled. | `bool` | `null` | no |
| <a name="input_openai_fqdns"></a> [openai\_fqdns](#input\_openai\_fqdns) | List of FQDNs allowed for the Cognitive Account. | `list(string)` | `null` | no |
| <a name="input_openai_identity"></a> [openai\_identity](#input\_openai\_identity) | type = object({<br>  type         = (Required) The type of the Identity. Possible values are `SystemAssigned`, `UserAssigned`, `SystemAssigned, UserAssigned`.<br>  identity\_ids = (Optional) Specifies a list of User Assigned Managed Identity IDs to be assigned to this OpenAI Account.<br>}) | <pre>object({<br>    type         = string<br>    identity_ids = optional(list(string))<br>  })</pre> | `null` | no |
| <a name="input_openai_local_auth_enabled"></a> [openai\_local\_auth\_enabled](#input\_openai\_local\_auth\_enabled) | Whether local authentication methods is enabled for the Cognitive Account. Defaults to `true`. | `bool` | `true` | no |
| <a name="input_openai_network_acls"></a> [openai\_network\_acls](#input\_openai\_network\_acls) | type = set(object({<br>  default\_action = (Required) The Default Action to use when no rules match from ip\_rules / virtual\_network\_rules. Possible values are `Allow` and `Deny`.<br>  ip\_rules       = (Optional) One or more IP Addresses, or CIDR Blocks which should be able to access the Cognitive Account.<br>  virtual\_network\_rules = optional(set(object({<br>    subnet\_id                            = (Required) The ID of a Subnet which should be able to access the OpenAI Account.<br>    ignore\_missing\_vnet\_service\_endpoint = (Optional) Whether ignore missing vnet service endpoint or not. Default to `false`.<br>  })))<br>})) | <pre>set(object({<br>    default_action = string<br>    ip_rules       = optional(set(string))<br>    virtual_network_rules = optional(set(object({<br>      subnet_id                            = string<br>      ignore_missing_vnet_service_endpoint = optional(bool, false)<br>    })))<br>  }))</pre> | `null` | no |
| <a name="input_openai_outbound_network_access_restricted"></a> [openai\_outbound\_network\_access\_restricted](#input\_openai\_outbound\_network\_access\_restricted) | Whether or not outbound network access is restricted. | `bool` | `false` | no |
| <a name="input_openai_public_network_access_enabled"></a> [openai\_public\_network\_access\_enabled](#input\_openai\_public\_network\_access\_enabled) | Whether or not public network access is enabled for the Cognitive Account. | `bool` | `true` | no |
| <a name="input_openai_resource_group_name"></a> [openai\_resource\_group\_name](#input\_openai\_resource\_group\_name) | Name of the resource group where the cognitive account OpenAI service is hosted (if different from solution resource group). | `string` | n/a | yes |
| <a name="input_openai_sku_name"></a> [openai\_sku\_name](#input\_openai\_sku\_name) | SKU name of the OpenAI service. | `string` | `"S0"` | no |
| <a name="input_openai_storage"></a> [openai\_storage](#input\_openai\_storage) | type = list(object({<br>  storage\_account\_id = (Required) Full resource id of a Microsoft.Storage resource.<br>  identity\_client\_id = (Optional) The client ID of the managed identity associated with the storage resource.<br>})) | <pre>list(object({<br>    storage_account_id = string<br>    identity_client_id = optional(string)<br>  }))</pre> | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of key value pairs that is used to tag resources created. | `map(string)` | <pre>{<br>  "Author": "Marcel Lupo",<br>  "Description": "Azure OpenAI service.",<br>  "GitHub": "https://github.com/Pwd9000-ML/terraform-azurerm-openai-service",<br>  "Terraform": "True"<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_key_vault_id"></a> [key\_vault\_id](#output\_key\_vault\_id) | The ID of the Key Vault. |
| <a name="output_key_vault_uri"></a> [key\_vault\_uri](#output\_key\_vault\_uri) | The URI of the Key Vault. |
| <a name="output_openai_account_name"></a> [openai\_account\_name](#output\_openai\_account\_name) | The name of the Cognitive Service Account. |
| <a name="output_openai_endpoint"></a> [openai\_endpoint](#output\_openai\_endpoint) | The endpoint used to connect to the Cognitive Service Account. |
| <a name="output_openai_primary_key"></a> [openai\_primary\_key](#output\_openai\_primary\_key) | The primary access key for the Cognitive Service Account. |
| <a name="output_openai_resource_group_name"></a> [openai\_resource\_group\_name](#output\_openai\_resource\_group\_name) | The name of the Resource Group hosting the Cognitive Service Account. |
| <a name="output_openai_secondary_key"></a> [openai\_secondary\_key](#output\_openai\_secondary\_key) | The secondary access key for the Cognitive Service Account. |
| <a name="output_openai_subdomain"></a> [openai\_subdomain](#output\_openai\_subdomain) | The subdomain used to connect to the Cognitive Service Account. |
<!-- END_TF_DOCS -->