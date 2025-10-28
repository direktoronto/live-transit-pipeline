# ETL Worker

Python async worker that performs stream processing and data enrichment.

## Local Development
```bash
python -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
python src/main.py
```

## Responsibilities
- Consume telemetry events from Kafka / Kinesis.
- Enrich with schedule data from PostgreSQL.
- Publish predictions (ETA, headway) to Redis and the API service.

## Enhancements
- Add structured logging & metrics (Prometheus exporter).
- Implement at-least-once delivery using stream offsets/checkpoints.
- Package for AWS Lambda or ECS on Fargate.
