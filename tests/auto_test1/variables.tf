### common ###
variable "location" {
  type        = string
  default     = "uksouth"
  description = "Azure region where resources will be hosted."
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "A map of key value pairs that is used to tag resources created."
}

### solution resource group ###
variable "resource_group_name" {
  type        = string
  description = "Name of the resource group to create where resources will be hosted."
  nullable    = false
}
### key vault ###
variable "kv_config" {
  type = object({
    name = string
    sku  = string
  })
  default = {
    name = "kvname"
    sku  = "standard"
  }
  description = "Key Vault configuration object to create azure key vault to store openai account details."
  nullable    = false
}

variable "keyvault_firewall_default_action" {
  type        = string
  default     = "Deny"
  description = "Default action for key vault firewall rules."
}

variable "keyvault_firewall_bypass" {
  type        = string
  default     = "AzureServices"
  description = "List of key vault firewall rules to bypass."
}

variable "keyvault_firewall_allowed_ips" {
  type        = list(string)
  default     = []
  description = "value of key vault firewall allowed ip rules."
}

variable "keyvault_firewall_virtual_network_subnet_ids" {
  type        = list(string)
  default     = []
  description = "value of key vault firewall allowed virtual network subnet ids."
}

### openai service ###
variable "create_openai_service" {
  type        = bool
  description = "Create the OpenAI service."
  default     = false
}

variable "openai_account_name" {
  type        = string
  description = "Name of the OpenAI service."
  default     = "demo-account"
}

variable "openai_custom_subdomain_name" {
  type        = string
  description = "The subdomain name used for token-based authentication. Changing this forces a new resource to be created. (normally the same as the account name)"
  default     = "demo-account"
}

variable "openai_sku_name" {
  type        = string
  description = "SKU name of the OpenAI service."
  default     = "S0"
}

variable "openai_local_auth_enabled" {
  type        = bool
  default     = true
  description = "Whether local authentication methods is enabled for the Cognitive Account. Defaults to `true`."
}

variable "openai_outbound_network_access_restricted" {
  type        = bool
  default     = false
  description = "Whether or not outbound network access is restricted. Defaults to `false`."
}

variable "openai_public_network_access_enabled" {
  type        = bool
  default     = true
  description = "Whether or not public network access is enabled. Defaults to `false`."
}

variable "openai_identity" {
  type = object({
    type = string
  })
  default = {
    type = "SystemAssigned"
  }
  description = <<-DESCRIPTION
    type = object({
      type         = (Required) The type of the Identity. Possible values are `SystemAssigned`, `UserAssigned`, `SystemAssigned, UserAssigned`.
      identity_ids = (Optional) Specifies a list of User Assigned Managed Identity IDs to be assigned to this OpenAI Account.
    })
  DESCRIPTION
}

### model deployment ###
variable "create_model_deployment" {
  type        = bool
  description = "Create the model deployment."
  default     = false
}

variable "model_deployment" {
  type = list(object({
    deployment_id   = string
    model_name      = string
    model_format    = string
    model_version   = string
    sku_name        = string
    sku_tier        = optional(string)
    sku_size        = optional(number)
    sku_family      = optional(string)
    sku_capacity    = optional(number)
    rai_policy_name = optional(string)
  }))
  default     = []
  description = <<-DESCRIPTION
      type = list(object({
        deployment_id   = (Required) The name of the Cognitive Services Account `Model Deployment`. Changing this forces a new resource to be created.
        model_name = {
          model_format  = (Required) The format of the Cognitive Services Account Deployment model. Changing this forces a new resource to be created. Possible value is OpenAI.
          model_name    = (Required) The name of the Cognitive Services Account Deployment model. Changing this forces a new resource to be created.
          model_version = (Required) The version of Cognitive Services Account Deployment model.
        }
        sku = {
          sku_name     = (Required) The name of the SKU. Possible values include Standard, GlobalBatch, GlobalStandard and ProvisionedManaged.
          sku_tier     = (Optional) Possible values are Free, Basic, Standard, Premium, Enterprise. Changing this forces a new resource to be created.
          sku_size     = (Optional) The SKU size. When the name field is the combination of tier and some other value, this would be the standalone code. Changing this forces a new resource to be created.
          sku_family   = (Optional) If the service has different generations of hardware, for the same SKU, then that can be captured here. Changing this forces a new resource to be created.
          sku_capacity = (Optional) Tokens-per-Minute (TPM). If the SKU supports sku out/in then the capacity integer should be included. If sku out/in is not possible for the resource this may be omitted. Default value is 1. Changing this forces a new resource to be created.
        }
        rai_policy_name = (Optional) The name of RAI policy. Changing this forces a new resource to be created.
      }))
  DESCRIPTION
  nullable    = false
}