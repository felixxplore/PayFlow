-- Runs once, when the Postgres container is first created.
-- Each service owns exactly one schema and never reads another service's tables.
CREATE SCHEMA IF NOT EXISTS orders;
CREATE SCHEMA IF NOT EXISTS payments;
CREATE SCHEMA IF NOT EXISTS notifications;
