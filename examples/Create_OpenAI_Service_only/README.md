# Example: Create OpenAI Service Only

This example module creates a new resource group, Key Vault and a new cognitive OpenAI service only. The OpenAI Account details are saved into an Azure Key Vault ready for consumption by other services. No Model Deployments are created.  

## Workflow

**Step1:** Create a new resource group and Azure Key Vault to store secrets.  
**Step2:** Create a new cognitive OpenAI service in the same resource group as the Key Vault. A different resource group can be used if needed.  
**Step3:** Save the OpenAI Account details into the Key Vault.  

![image.png](https://raw.githubusercontent.com/Pwd9000-ML/terraform-azurerm-openai-service/master/assets/Example2.png)

## Resources Created

- **Key Vault** - Used to store OpenAI Service Account secrets.
- **Cognitive OpenAI Service** - The OpenAI service/account.

![image.png](https://raw.githubusercontent.com/Pwd9000-ML/terraform-azurerm-openai-service/master/assets/Resources2.png)

## Models Deployed

- **None** - No models deployed.

## Secrets Saved

![image.png](https://raw.githubusercontent.com/Pwd9000-ML/terraform-azurerm-openai-service/master/assets/var-secrets2.png)

<!-- BEGIN_TF_DOCS -->

<!-- END_TF_DOCS -->