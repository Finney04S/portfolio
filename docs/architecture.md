# Portfolio Website DevOps Architecture

## System Components

1. **Source Control**: GitHub repository
2. **CI/CD**: GitHub Actions
3. **Container Registry**: Azure Container Registry (ACR)
4. **Orchestration**: Azure Kubernetes Service (AKS)
5. **Infrastructure**: Terraform (IaC)
6. **Configuration**: Ansible

## Workflow

1. Developer pushes code to GitHub (main branch)
2. GitHub Actions triggers automatically
3. Workflow builds Docker image
4. Image pushed to Azure Container Registry
5. Kubernetes deployment updated with new image
6. AKS pulls image and deploys pods
7. LoadBalancer exposes service with public IP

## Resource Overview

- Resource Group: portfolio-rg
- ACR: portfolioacryourname.azurecr.io
- AKS Cluster: portfolio-aks-cluster (2 nodes)
- Deployment: portfolio-deployment (2 replicas)
- Service: portfolio-service (LoadBalancer)
