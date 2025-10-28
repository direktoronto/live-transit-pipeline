output "vpc_id" {
  value       = module.network.vpc_id
  description = "ID of the provisioned VPC."
}

output "private_subnets" {
  value       = module.network.private_subnet_ids
  description = "Private subnet IDs used by ECS tasks and data stores."
}

output "rds_endpoint" {
  value       = module.data.rds_endpoint
  description = "PostgreSQL endpoint for application connections."
}

output "redis_endpoint" {
  value       = module.cache.primary_endpoint
  description = "Redis endpoint for caching layer."
}

output "ecs_cluster_name" {
  value       = module.ecs.cluster_name
  description = "Name of the ECS cluster hosting services."
}
