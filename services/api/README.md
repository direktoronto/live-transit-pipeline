# API Service

Spring Boot REST API that exposes rider-facing endpoints such as next arrivals and live vehicle positions.

## Local Development
```bash
./gradlew bootRun
```

The service assumes access to:
- PostgreSQL for static GTFS data (`routes`, `stops`, `trips`).
- Redis for live vehicle snapshots produced by the ingestion pipeline.

## TODOs
- Implement repositories and Redis cache clients.
- Add authentication/authorization (API keys, OAuth).
- Document an OpenAPI specification for the endpoints.
