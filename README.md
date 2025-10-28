# Portfolio Website - DevOps Project

## Project Overview

This project demonstrates a complete DevOps pipeline for deploying a portfolio website to Azure Kubernetes Service (AKS).

## Technologies Used

- **Git/GitHub**: Version control and source code management
- **Docker**: Application containerization
- **Terraform**: Infrastructure as Code (IaC)
- **Ansible**: Configuration management
- **Azure Container Registry (ACR)**: Docker image storage
- **Azure Kubernetes Service (AKS)**: Container orchestration
- **GitHub Actions**: CI/CD automation

## Architecture

[Include architecture diagram here]

## Project Structure

```
portfolio-devops/
├── index.html              # Main HTML file
├── css/
│   └── style.css          # Styling
├── js/
│   └── script.js          # JavaScript functionality
├── Dockerfile             # Docker image definition
├── nginx.conf             # Nginx configuration
├── terraform/             # Infrastructure as Code
│   ├── main.tf           # Main Terraform configuration
│   ├── variables.tf      # Variable definitions
│   └── outputs.tf        # Output values
├── k8s/                   # Kubernetes manifests
│   ├── deployment.yaml   # K8s deployment
│   └── service.yaml      # K8s service (LoadBalancer)
├── ansible/               # Configuration management
│   ├── deploy-to-aks.yaml # Ansible playbook
│   └── ansible.cfg       # Ansible configuration
└── .github/
    └── workflows/
        └── deploy.yml    # GitHub Actions workflow
```

## Prerequisites

- Azure Student Account
- Azure CLI
- Docker
- Terraform
- Ansible
- kubectl
- Git

## Setup Instructions

### 1. Clone Repository
```
git clone https://github.com/YOUR_USERNAME/portfolio-devops.git
cd portfolio-devops
```

### 2. Login to Azure
```
az login
az account set --subscription YOUR_SUBSCRIPTION_ID
```

### 3. Deploy Infrastructure with Terraform
```
cd terraform
terraform init
terraform plan
terraform apply
```

### 4. Build and Push Docker Image
```
docker build -t portfolio-website:latest .
az acr login --name portfolioacryourname
docker tag portfolio-website:latest portfolioacryourname.azurecr.io/portfolio-website:latest
docker push portfolioacryourname.azurecr.io/portfolio-website:latest
```

### 5. Deploy to AKS using Ansible
```
cd ansible
ansible-playbook deploy-to-aks.yaml
```

### 6. Access Website
```
kubectl get service portfolio-service
# Access at http://EXTERNAL-IP
```

## CI/CD Pipeline

The GitHub Actions workflow automatically:
1. Builds Docker image on code push
2. Pushes image to Azure Container Registry
3. Updates Kubernetes deployment
4. Deploys to AKS cluster

## Access Information

- **Website URL**: http://PUBLIC_IP
- **ACR**: portfolioacryourname.azurecr.io
- **AKS Cluster**: portfolio-aks-cluster
- **Resource Group**: portfolio-rg

## Cleanup

To destroy all resources:
```
cd terraform
terraform destroy
```

## Author

[Your Name]
[Your Email]
[GitHub Profile]

## License

MIT License
