# Ingestion Service

Spring Boot microservice that simulates ingesting vehicle telemetry and publishes it to a streaming backbone (Kafka/Kinesis/Redis Streams).

## Local Development
```bash
./gradlew bootRun
```

## Environment Variables
- `STREAM_ENDPOINT` – destination endpoint (e.g., Kafka broker) where events should be published.
- `STREAM_TOPIC` – topic/stream name.

## Next Steps
- Replace the `VehicleFeedPublisher` stub with actual producer logic.
- Add integration tests for serialization and stream delivery guarantees.
- Containerize via the included `Dockerfile`.
