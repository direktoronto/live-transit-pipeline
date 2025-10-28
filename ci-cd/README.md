# CI/CD

Harness pipeline definition for building, testing, and deploying the services.

## Pipeline Stages
1. **Build** – Gradle build for ingestion/api, pip install for ETL.
2. **Test** – Unit/integration tests per service.
3. **Package** – Docker image build and push to ECR.
4. **Deploy** – Terraform apply followed by ECS service update.

Update the `pipeline.yaml` with your org/project IDs and connector references.
