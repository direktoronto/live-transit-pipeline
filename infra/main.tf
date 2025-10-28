terraform {
  required_version = ">= 1.6.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

module "network" {
  source = "./modules/vpc"

  project_name = var.project_name
  cidr_block   = var.vpc_cidr
}

module "data" {
  source = "./modules/data"

  project_name = var.project_name
  db_username  = var.db_username
  db_password  = var.db_password
  subnet_ids   = module.network.private_subnet_ids
  vpc_id       = module.network.vpc_id
}

module "cache" {
  source = "./modules/redis"

  project_name = var.project_name
  subnet_ids   = module.network.private_subnet_ids
  security_group_ids = [module.network.default_security_group_id]
}

module "ecs" {
  source = "./modules/ecs"

  project_name      = var.project_name
  subnet_ids        = module.network.private_subnet_ids
  security_group_id = module.network.default_security_group_id
  container_image_tags = {
    ingestion = var.ingestion_image
    api       = var.api_image
  }
  desired_count = 2
}

module "monitoring" {
  source = "./modules/observability"

  project_name = var.project_name
  log_retention_in_days = 7
}
