# PayFlow

A small payments and order platform that stays correct when services crash, networks fail and users click twice.

Built with Java 21, Spring Boot 3.5, PostgreSQL, Kafka and Redis.

## What it demonstrates
- Idempotent order API (`Idempotency-Key`) so retries never double charge
- Transactional outbox so a crash never loses an event
- Idempotent Kafka consumers so duplicate events never double debit
- Saga with compensation (refund on cancel or failure)
- Optimistic locking on wallets, double-entry ledger for auditability
- Metrics, correlation IDs, integration tests with Testcontainers, and a load test

## Architecture
Gateway (8080) in front of three services: order (8081), payment (8082), notification (8083). Services talk only through Kafka events and never read each other's tables.

## Run locally
Requires JDK 21, Maven 3.9+, Docker.

```bash
# 1. start Postgres, Redis, Kafka
cd infra && docker compose up -d && cd ..

# 2. build and test everything
mvn -B verify

# 3. run a service (example)
mvn -pl order-service spring-boot:run
```

Health check: http://localhost:8081/actuator/health

## Project status
- [x] Step 1: skeleton, Maven multi-module, infra compose
- [ ] Step 2 onward: see the build order in the project guide

## Results
Load test numbers (throughput, p99 before and after optimisation) will be added in week 5.

## Decisions
See [docs/adr](docs/adr).
