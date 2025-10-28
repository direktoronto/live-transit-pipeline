package com.example.api.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.Instant;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/stop")
public class ArrivalController {

    @GetMapping("/{id}/next-arrivals")
    public ResponseEntity<Map<String, Object>> getNextArrivals(@PathVariable("id") String stopId) {
        // TODO: Query Redis for live arrivals and Postgres for stop metadata.
        List<Map<String, Object>> arrivals = List.of(
                Map.of("vehicleId", "bus-12", "etaSeconds", 180, "generatedAt", Instant.now().toString()),
                Map.of("vehicleId", "bus-27", "etaSeconds", 420, "generatedAt", Instant.now().toString())
        );

        return ResponseEntity.ok(Map.of(
                "stopId", stopId,
                "arrivals", arrivals
        ));
    }
}
