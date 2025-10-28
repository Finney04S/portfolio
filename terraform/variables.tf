# Define variables for easy customization

variable "location" {
  description = "Azure region for resources"
  type        = string
  default     = "eastus"
  # EDIT: Change default location if needed
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "project_name" {
  description = "Project name"
  type        = string
  default     = "portfolio"
}
