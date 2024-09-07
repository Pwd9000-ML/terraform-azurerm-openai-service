variable "openai_resource_group_name" {
  type        = string
  description = "Name of the resource group where the cognitive account OpenAI service is hosted."
  nullable    = false
}

variable "openai_account_name" {
  type        = string
  description = "Name of the OpenAI service."
  default     = "demo-account"
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