# Services

Microservices and workers that power the live transit platform.

- `ingestion/` – Simulates ingesting vehicle telemetry and publishing to the stream.
- `api/` – Rider-facing REST API that surfaces arrival predictions.
- `etl-worker/` – Async Python job that performs transformation and enrichment.

Each service includes local run instructions, Dockerfiles, and starter code you can extend.
