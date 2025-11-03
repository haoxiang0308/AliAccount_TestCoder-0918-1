#!/usr/bin/env python3
"""
Python script to set a key-value in Redis
"""

import redis
import random
import string

def set_redis_key_value():
    """
    Connect to Redis and set a key-value pair
    """
    try:
        # Connect to Redis (default host is localhost, port 6379)
        r = redis.Redis(host='localhost', port=6379, db=0, decode_responses=True)
        
        # Generate a random key and value for demonstration
        random_key = 'key_' + ''.join(random.choices(string.ascii_letters + string.digits, k=10))
        random_value = 'value_' + ''.join(random.choices(string.ascii_letters + string.digits, k=15))
        
        # Set the key-value pair in Redis
        result = r.set(random_key, random_value)
        
        if result:
            print(f"Successfully set key '{random_key}' with value '{random_value}' in Redis")
        else:
            print("Failed to set key-value in Redis")
            
        # Verify the value was set by getting it back
        retrieved_value = r.get(random_key)
        print(f"Retrieved value for key '{random_key}': {retrieved_value}")
        
        return True
        
    except redis.ConnectionError:
        print("Could not connect to Redis server. Please make sure Redis is running.")
        return False
    except Exception as e:
        print(f"An error occurred: {str(e)}")
        return False

if __name__ == "__main__":
    print("Setting a key-value in Redis...")
    set_redis_key_value()