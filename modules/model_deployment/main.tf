resource "azurerm_cognitive_deployment" "model" {
  for_each = { for each in var.model_deployment : each.deployment_id => each }

  cognitive_account_id = data.azurerm_cognitive_account.openai.id
  name                 = each.value.deployment_id
  rai_policy_name      = each.value.rai_policy_name

  model {
    format  = each.value.model_format
    name    = each.value.model_name
    version = each.value.model_version
  }
  sku {
    name     = each.value.sku_name
    tier     = each.value.sku_tier
    size     = each.value.sku_size
    family   = each.value.sku_family
    capacity = each.value.sku_capacity
  }

  lifecycle {
    ignore_changes = [
      cognitive_account_id
    ]
  }
}
