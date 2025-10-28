# Output important values after Terraform apply

output "resource_group_name" {
  value       = azurerm_resource_group.portfolio_rg.name
  description = "Resource Group name"
}

output "acr_login_server" {
  value       = azurerm_container_registry.portfolio_acr.login_server
  description = "ACR login server URL"
  # FIND: Use this URL to push Docker images
}

output "acr_admin_username" {
  value       = azurerm_container_registry.portfolio_acr.admin_username
  description = "ACR admin username"
  # FIND: Use this for Docker login
}

output "acr_admin_password" {
  value       = azurerm_container_registry.portfolio_acr.admin_password
  description = "ACR admin password"
  sensitive   = true
  # FIND: Run 'terraform output acr_admin_password' to view
}

output "aks_cluster_name" {
  value       = azurerm_kubernetes_cluster.portfolio_aks.name
  description = "AKS cluster name"
}

output "kube_config" {
  value     = azurerm_kubernetes_cluster.portfolio_aks.kube_config_raw
  sensitive = true
  # FIND: Run 'terraform output kube_config' to get kubectl config
}
