# Create OpenAI service

This sub module will create the cognitive service and the resource group for the OpenAI service.

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_cognitive_account.openai](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cognitive_account) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_name"></a> [account\_name](#input\_account\_name) | The name of the OpenAI service. | `string` | `"demo-account"` | no |
| <a name="input_custom_subdomain_name"></a> [custom\_subdomain\_name](#input\_custom\_subdomain\_name) | The subdomain name used for token-based authentication. Changing this forces a new resource to be created. (normally the same as the account name) | `string` | `"demo-account"` | no |
| <a name="input_customer_managed_key"></a> [customer\_managed\_key](#input\_customer\_managed\_key) | type = object({<br/>  key\_vault\_key\_id   = (Required) The ID of the Key Vault Key which should be used to Encrypt the data in this OpenAI Account.<br/>  identity\_client\_id = (Optional) The Client ID of the User Assigned Identity that has access to the key. This property only needs to be specified when there're multiple identities attached to the OpenAI Account.<br/>}) | <pre>object({<br/>    key_vault_key_id   = string<br/>    identity_client_id = optional(string)<br/>  })</pre> | `null` | no |
| <a name="input_dynamic_throttling_enabled"></a> [dynamic\_throttling\_enabled](#input\_dynamic\_throttling\_enabled) | Determines whether or not dynamic throttling is enabled. If set to `true`, dynamic throttling will be enabled. If set to `false`, dynamic throttling will not be enabled. | `bool` | `null` | no |
| <a name="input_fqdns"></a> [fqdns](#input\_fqdns) | List of FQDNs allowed for the Cognitive Account. | `list(string)` | `null` | no |
| <a name="input_identity"></a> [identity](#input\_identity) | type = object({<br/>  type         = (Required) The type of the Identity. Possible values are `SystemAssigned`, `UserAssigned`, `SystemAssigned, UserAssigned`.<br/>  identity\_ids = (Optional) Specifies a list of User Assigned Managed Identity IDs to be assigned to this OpenAI Account.<br/>}) | <pre>object({<br/>    type         = string<br/>    identity_ids = optional(list(string))<br/>  })</pre> | `null` | no |
| <a name="input_local_auth_enabled"></a> [local\_auth\_enabled](#input\_local\_auth\_enabled) | Whether local authentication methods is enabled for the Cognitive Account. Defaults to `true`. | `bool` | `true` | no |
| <a name="input_location"></a> [location](#input\_location) | Azure region where resources will be hosted. | `string` | `"uksouth"` | no |
| <a name="input_network_acls"></a> [network\_acls](#input\_network\_acls) | type = set(object({<br/>  default\_action = (Required) The Default Action to use when no rules match from ip\_rules / virtual\_network\_rules. Possible values are `Allow` and `Deny`.<br/>  ip\_rules       = (Optional) One or more IP Addresses, or CIDR Blocks which should be able to access the Cognitive Account.<br/>  virtual\_network\_rules = optional(set(object({<br/>    subnet\_id                            = (Required) The ID of a Subnet which should be able to access the OpenAI Account.<br/>    ignore\_missing\_vnet\_service\_endpoint = (Optional) Whether ignore missing vnet service endpoint or not. Default to `false`.<br/>  })))<br/>})) | <pre>set(object({<br/>    default_action = string<br/>    ip_rules       = optional(set(string))<br/>    virtual_network_rules = optional(set(object({<br/>      subnet_id                            = string<br/>      ignore_missing_vnet_service_endpoint = optional(bool, false)<br/>    })))<br/>  }))</pre> | `null` | no |
| <a name="input_outbound_network_access_restricted"></a> [outbound\_network\_access\_restricted](#input\_outbound\_network\_access\_restricted) | Whether outbound network access is restricted for the Cognitive Account. Defaults to `false`. | `bool` | `false` | no |
| <a name="input_public_network_access_enabled"></a> [public\_network\_access\_enabled](#input\_public\_network\_access\_enabled) | Whether public network access is allowed for the Cognitive Account. Defaults to `true`. | `bool` | `true` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Name of the resource group where the OpenAI service will be hosted. | `string` | n/a | yes |
| <a name="input_sku_name"></a> [sku\_name](#input\_sku\_name) | The SKU name of the OpenAI service. | `string` | `"S0"` | no |
| <a name="input_storage"></a> [storage](#input\_storage) | type = list(object({<br/>  storage\_account\_id = (Required) Full resource id of a Microsoft.Storage resource.<br/>  identity\_client\_id = (Optional) The client ID of the managed identity associated with the storage resource.<br/>})) | <pre>list(object({<br/>    storage_account_id = string<br/>    identity_client_id = optional(string)<br/>  }))</pre> | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of key value pairs that is used to tag resources created. | `map(string)` | <pre>{<br/>  "Author": "Marcel Lupo",<br/>  "Description": "OpenAI Cognitive service",<br/>  "GitHub": "https://github.com/Pwd9000-ML/terraform-azurerm-openai-service",<br/>  "Terraform": "True"<br/>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_openai_account_name"></a> [openai\_account\_name](#output\_openai\_account\_name) | The name of the Cognitive Service Account. |
| <a name="output_openai_endpoint"></a> [openai\_endpoint](#output\_openai\_endpoint) | The endpoint used to connect to the Cognitive Service Account. |
| <a name="output_openai_primary_key"></a> [openai\_primary\_key](#output\_openai\_primary\_key) | The primary access key for the Cognitive Service Account. |
| <a name="output_openai_resource_group_name"></a> [openai\_resource\_group\_name](#output\_openai\_resource\_group\_name) | The name of the Resource Group hosting the Cognitive Service Account. |
| <a name="output_openai_secondary_key"></a> [openai\_secondary\_key](#output\_openai\_secondary\_key) | The secondary access key for the Cognitive Service Account. |
| <a name="output_openai_subdomain"></a> [openai\_subdomain](#output\_openai\_subdomain) | The subdomain used to connect to the Cognitive Service Account. |
<!-- END_TF_DOCS -->