package com.example.demo;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

@RestController
public class RandomDataController {

    @GetMapping("/random-data")
    public Map<String, Object> getRandomData() {
        Map<String, Object> response = new HashMap<>();
        Random random = new Random();
        
        response.put("id", random.nextInt(1000));
        response.put("name", "Random Item " + random.nextInt(100));
        response.put("value", random.nextDouble() * 100);
        response.put("timestamp", System.currentTimeMillis());
        
        return response;
    }
}