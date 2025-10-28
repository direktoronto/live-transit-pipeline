# Redis Cache Strategy

Document the Redis key schema and TTL strategy for live transit data.

## Suggested Keys
- `vehicle:{vehicleId}` → latest location payload.
- `stop:{stopId}:arrivals` → sorted set of arrival predictions.
- `route:{routeId}:vehicles` → hash of active vehicles per route.

## Warm-Up Script
Add scripts here that pre-populate Redis from historical data or to seed unit tests.
