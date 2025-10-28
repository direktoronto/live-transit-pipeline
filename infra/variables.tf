variable "project_name" {
  type        = string
  description = "Prefix applied to resource names."
  default     = "live-transit"
}

variable "aws_region" {
  type        = string
  description = "AWS region for deployment."
  default     = "us-east-1"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the primary VPC."
  default     = "10.0.0.0/16"
}

variable "db_username" {
  type        = string
  description = "Master username for the RDS instance."
}

variable "db_password" {
  type        = string
  description = "Master password for the RDS instance."
  sensitive   = true
}

variable "ingestion_image" {
  type        = string
  description = "Container image tag for the ingestion service."
  default     = "ghcr.io/your-org/ingestion:latest"
}

variable "api_image" {
  type        = string
  description = "Container image tag for the API service."
  default     = "ghcr.io/your-org/api:latest"
}
