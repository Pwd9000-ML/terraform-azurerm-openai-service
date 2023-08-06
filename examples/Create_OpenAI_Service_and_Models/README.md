# Example: Create OpenAI Service and Models

This example module creates a new resource group, new cognitive OpenAI service, and two model deployments. It will then run a test to ensure the model deployment is working as expected and save the OpenAI Account and Model deployment details into an Azure Key Vault ready for consumption by other services.

## Workflow

**Step1:** Create a new resource group and KeyVault to store secrets.  
**Step2:** Create a new cognitive OpenAI service in the same resource group as the KeyVault. A different resource group can be used if needed.  
**Step3:** Create model deployments on the newly created OpenAI service.  
**Step4:** Save the OpenAI Account and Model deployments details into the Key Vault.  

![image.png](https://raw.githubusercontent.com/Pwd9000-ML/terraform-azurerm-openai-service/master/assets/Example1.png)

## Resources Created

- **Key Vault** - Used to store OpenAI Service Account and Model Deployment secrets.
- **Cognitive OpenAI Service** - The OpenAI service/account.

![image.png](https://raw.githubusercontent.com/Pwd9000-ML/terraform-azurerm-openai-service/master/assets/Resources.png)

## Models Deployed

- **GPT-35-Turbo** - The GPT-3.5 Turbo model deployment.
- **GPT-35-Turbo-16K** - The GPT-3.5 Turbo 16K model deployment.

![image.png](https://raw.githubusercontent.com/Pwd9000-ML/terraform-azurerm-openai-service/master/assets/Deployments.png)

## Secrets Saved

![image.png](https://raw.githubusercontent.com/Pwd9000-ML/terraform-azurerm-openai-service/master/assets/var-secrets.png)

<!-- BEGIN_TF_DOCS -->

<!-- END_TF_DOCS -->