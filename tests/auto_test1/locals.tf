locals {
  kv_config = {
    name = "openaikv${random_integer.number.result}"
    sku  = "standard"
  }
}