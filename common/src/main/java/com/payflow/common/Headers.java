package com.payflow.common;

/** HTTP and Kafka header names that carry request context across services. */
public final class Headers {

    public static final String CORRELATION_ID = "X-Correlation-Id";
    public static final String IDEMPOTENCY_KEY = "Idempotency-Key";

    private Headers() {
    }
}
