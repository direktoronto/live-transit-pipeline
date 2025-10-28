package com.example.ingestion;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.time.Instant;
import java.util.Random;

@Component
@EnableScheduling
public class VehicleFeedPublisher {

    private static final Logger log = LoggerFactory.getLogger(VehicleFeedPublisher.class);
    private static final Random random = new Random();

    @Scheduled(fixedRateString = "${publisher.interval-ms:5000}")
    public void publishVehicleEvent() {
        // TODO: send to Kafka / Kinesis / Redis Stream.
        String vehicleId = "bus-" + random.nextInt(42);
        double latitude = 37.77 + random.nextDouble() / 100;
        double longitude = -122.41 + random.nextDouble() / 100;
        log.info("Publishing vehicle {} at {},{} @ {}", vehicleId, latitude, longitude, Instant.now());
    }
}
