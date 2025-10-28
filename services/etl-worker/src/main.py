"""Streaming ETL worker

Consumes real-time vehicle events, enriches with static schedule data, and writes
predictions to Redis / PostgreSQL. Replace the stub logic with actual ingestion
from Kafka or AWS Kinesis.
"""

from __future__ import annotations

import asyncio
import json
import logging
from dataclasses import dataclass
from datetime import datetime, timezone
from typing import AsyncIterator

logging.basicConfig(level=logging.INFO, format="%(asctime)s %(levelname)s %(message)s")
logger = logging.getLogger(__name__)


@dataclass
class VehicleEvent:
    vehicle_id: str
    latitude: float
    longitude: float
    route_id: str
    event_time: datetime

    @classmethod
    def from_json(cls, payload: str) -> "VehicleEvent":
        data = json.loads(payload)
        return cls(
            vehicle_id=data["vehicle_id"],
            latitude=data["latitude"],
            longitude=data["longitude"],
            route_id=data.get("route_id", "unknown"),
            event_time=datetime.fromisoformat(data["event_time"]),
        )


async def consume_events() -> AsyncIterator[VehicleEvent]:
    """Yield fake events every few seconds. Replace with real message broker consumer."""
    counter = 0
    while True:
        counter += 1
        payload = json.dumps(
            {
                "vehicle_id": f"bus-{counter % 40}",
                "latitude": 37.773 + counter * 0.0001,
                "longitude": -122.411 - counter * 0.0001,
                "route_id": "N-Judah",
                "event_time": datetime.now(timezone.utc).isoformat(),
            }
        )
        yield VehicleEvent.from_json(payload)
        await asyncio.sleep(1)


async def update_caches(event: VehicleEvent) -> None:
    """Persist the event to Redis/PostgreSQL. Stubbed for now."""
    logger.info("Indexing %s @ (%s, %s)", event.vehicle_id, event.latitude, event.longitude)


async def main() -> None:
    logger.info("Starting ETL worker")
    async for event in consume_events():
        await update_caches(event)


if __name__ == "__main__":
    asyncio.run(main())
