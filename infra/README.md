# Infrastructure (Terraform)

Terraform configuration to provision AWS resources required for the live transit pipeline.

## Components
- **VPC**: Public/private subnets, NAT gateway, security groups.
- **RDS (PostgreSQL)**: Stores static transit data (routes, stops, schedules).
- **ElastiCache (Redis)**: Holds real-time vehicle state and arrival predictions.
- **ECS/Fargate**: Runs ingestion and API services as containers.
- **Observability**: CloudWatch log groups and metric alarms.

## Usage
```bash
terraform init
terraform workspace new dev   # optional
terraform plan -out tfplan
terraform apply tfplan
```

Populate sensitive values (`db_username`, `db_password`) via CLI flags, `terraform.tfvars`, or your CI/CD secrets manager.

## Modules
Each module under `modules/` encapsulates a logical component. Scaffold files are included so you can implement resource definitions without cluttering `main.tf`.
