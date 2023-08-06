# Example: Create Models on existing OpenAI Account

This example module creates a new resource group and Key Vault. It then creates two model deployments on an existing cognitive OpenAI service/account. It will then save the existing OpenAI Account and Model deployment details into the newly created Azure Key Vault ready for consumption by other services.  

## Workflow

![image.png](https://raw.githubusercontent.com/Pwd9000-ML/terraform-azurerm-openai-service/master/assets/Example3.png)

**Step1:** Create a new resource group and KeyVault to store secrets.
**Step2:** Create model deployments on and existing OpenAI service in a different resource group.
**Step3:** Save the OpenAI Account and model details into the Key Vault.

## Resources Created

![image.png](https://raw.githubusercontent.com/Pwd9000-ML/terraform-azurerm-openai-service/master/assets/Resources3.png)

- **Key Vault** - Used to store OpenAI Service Account and model deployment secrets.

## Models Deployed (On an existing OpenAI Service)

![image.png](https://raw.githubusercontent.com/Pwd9000-ML/terraform-azurerm-openai-service/master/assets/Deployments3.png)

- **GPT-35-Turbo** - The GPT-3.5 Turbo model deployment.
- **GPT-35-Turbo-16K** - The GPT-3.5 Turbo 16K model deployment.

## Secrets Saved

![image.png](https://raw.githubusercontent.com/Pwd9000-ML/terraform-azurerm-openai-service/master/assets/var-secrets3.png)

<!-- BEGIN_TF_DOCS -->

<!-- END_TF_DOCS -->