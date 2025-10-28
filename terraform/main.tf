# EDIT: This file provisions Azure resources for your portfolio

terraform {
  required_version = ">= 1.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
  # FIND: Your subscription_id from 'az account list' command
  # subscription_id = "YOUR_SUBSCRIPTION_ID"  # Optional: uncomment if needed
}

# Resource Group
resource "azurerm_resource_group" "portfolio_rg" {
  # EDIT: Change location if needed (e.g., "eastus", "westeurope", "southeastasia")
  name     = "portfolio-rg"
  location = "eastus"
  
  tags = {
    Environment = "Development"
    Project     = "Portfolio-DevOps"
  }
}

# Azure Container Registry (ACR)
resource "azurerm_container_registry" "portfolio_acr" {
  # EDIT: ACR name must be globally unique - change 'yourname' to your name/username
  name                = "portfolioacryourname"
  resource_group_name = azurerm_resource_group.portfolio_rg.name
  location            = azurerm_resource_group.portfolio_rg.location
  sku                 = "Basic"  # Use "Basic" for student account (cost-effective)
  admin_enabled       = true
  
  tags = {
    Environment = "Development"
    Project     = "Portfolio-DevOps"
  }
}

# Azure Kubernetes Service (AKS)
resource "azurerm_kubernetes_cluster" "portfolio_aks" {
  # EDIT: Change cluster name if desired
  name                = "portfolio-aks-cluster"
  location            = azurerm_resource_group.portfolio_rg.location
  resource_group_name = azurerm_resource_group.portfolio_rg.name
  dns_prefix          = "portfolioaks"
  
  default_node_pool {
    name       = "default"
    node_count = 2  # EDIT: Use 1 node for cost savings with student account
    vm_size    = "Standard_B2s"  # EDIT: Small VM size suitable for student account
    
    # EDIT: Optional - enable auto-scaling
    # enable_auto_scaling = true
    # min_count          = 1
    # max_count          = 3
  }
  
  identity {
    type = "SystemAssigned"
  }
  
  tags = {
    Environment = "Development"
    Project     = "Portfolio-DevOps"
  }
}

# Attach ACR to AKS
resource "azurerm_role_assignment" "aks_acr_pull" {
  principal_id                     = azurerm_kubernetes_cluster.portfolio_aks.kubelet_identity[0].object_id
  role_definition_name             = "AcrPull"
  scope                            = azurerm_container_registry.portfolio_acr.id
  skip_service_principal_aad_check = true
}
