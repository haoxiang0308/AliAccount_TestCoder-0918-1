#!/usr/bin/env python3
"""
A Python script that connects to Redis and sets a key-value pair.
"""

import redis

def set_redis_key_value():
    """
    Connects to Redis and sets a key-value pair.
    """
    try:
        # Connect to Redis server (default host is localhost, port 6379)
        r = redis.Redis(host='localhost', port=6379, db=0, decode_responses=True)
        
        # Set a key-value pair
        key = "example_key"
        value = "example_value"
        
        r.set(key, value)
        print(f"Successfully set key '{key}' with value '{value}' in Redis.")
        
        # Verify the value was set
        retrieved_value = r.get(key)
        print(f"Retrieved value for key '{key}': {retrieved_value}")
        
    except redis.ConnectionError:
        print("Error: Could not connect to Redis server. Please make sure Redis is running.")
    except Exception as e:
        print(f"An error occurred: {e}")

if __name__ == "__main__":
    set_redis_key_value()