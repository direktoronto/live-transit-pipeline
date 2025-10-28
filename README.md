# Live Transit Pipeline

End-to-end reference architecture for a real-time mobility data platform. The stack mixes Java/Spring Boot for ingestion and APIs, Python for streaming ETL, PostgreSQL for relational storage, Redis for hot data, and AWS infrastructure codified with Terraform.

![Architecture Diagram](./architecture.png)

## Project Goals
- Collect and process high-velocity vehicle telemetry or GTFS-realtime style feeds.
- Expose low-latency APIs for rider-facing features such as live arrivals and vehicle tracking.
- Demonstrate infrastructure-as-code, containerization, CI/CD, and observability practices.

## Repository Layout
```
infra/             Terraform modules for AWS (VPC, RDS, ElastiCache, ECS)
services/          Spring Boot microservices and Python ETL worker
cache/             Redis data structures, TTL strategy, warm-up scripts
db/                SQL schema, migrations, sample reference data
dashboard/         Optional UI for visualizing real-time positions
ci-cd/             Harness pipeline/YAML config for build & deployment
```

## Getting Started
1. **Clone** the repo and install prerequisites: Java 21+, Gradle, Python 3.12+, Terraform, Docker.
2. **Provision infra**: customize `infra/variables.tf`, run `terraform init && terraform plan`.
3. **Build services**: from each service directory run `./gradlew bootRun` (Java) or `poetry run python src/main.py` (Python).
4. **Run locally**: use `docker compose` (coming soon) to spin up PostgreSQL, Redis, and the services.
5. **Deploy**: Harness pipeline definition in `ci-cd/` shows a sample build → test → deploy sequence.

## Resume Highlights
- Designed cloud-native real-time data architecture (diagram above).
- Implemented streaming ingestion, ETL, and API services with caching and persistence.
- Automated infrastructure provisioning with Terraform and continuous delivery with Harness.

## Next Steps
- Replace sample code with production logic.
- Export a polished architecture diagram to `architecture.png`.
- Add integration tests, load tests, and dashboard visualizations.

---
*This starter template is intentionally lightweight so you can expand each component when you implement the full solution.*
