# Example: Create OpenAI Service and Models

This example module creates a new resource group, new cognitive OpenAI service, and two model deployments. It will then run a test to ensure the model deployment is working as expected and save the OpenAI Account and Model deployment details into an Azure Key Vault ready for consumption by other services.

## Workflow

![image.png](https://raw.githubusercontent.com/Pwd9000-ML/terraform-azurerm-openai-service/master/assets/Example2.png)

**Step1:** Create a new resource group and KeyVault to store secrets.
**Step2:** Create a new cognitive OpenAI service in the same resource group as the KeyVault. A different resource group can be used if needed.
**Step3:** Save the OpenAI Account details into the KeyVault.

## Resources Created

![image.png](https://raw.githubusercontent.com/Pwd9000-ML/terraform-azurerm-openai-service/master/assets/Resources2.png)

- **Key Vault** - Used to store OpenAI Service Account secrets.
- **Cognitive** OpenAI Service - The OpenAI service/account.

## Models Deployed

- **None** - No models deployed.

## Secrets Saved

![image.png](https://raw.githubusercontent.com/Pwd9000-ML/terraform-azurerm-openai-service/master/assets/var-secrets2.png)

<!-- BEGIN_TF_DOCS -->

<!-- END_TF_DOCS -->