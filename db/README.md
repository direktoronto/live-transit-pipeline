# Database Assets

SQL schema and seed data for the transit platform.

## Applying Locally
```bash
psql -h localhost -U transit -d transit -f schema.sql
psql -h localhost -U transit -d transit -c "\copy routes FROM 'data/sample_routes.csv' WITH CSV HEADER"
```

## Tables
- `routes` – metadata for transit lines.
- `stops` – physical stops with coordinates.
- `trips` – trip-level schedule metadata.
- `stop_times` – join table for stop sequences and schedules.

Add additional migrations or use Flyway/Liquibase for production deployments.
