import redis
import random
import string

# Connect to Redis (assumes Redis is running on localhost:6379)
try:
    r = redis.Redis(host='localhost', port=6379, db=0, decode_responses=True)
    r.ping()  # Test connection
    print("Connected to Redis successfully!")
except redis.ConnectionError:
    print("Could not connect to Redis. Please make sure Redis server is running.")
    exit(1)

# Generate a random key and value for demonstration
random_key = 'key_' + ''.join(random.choices(string.ascii_letters + string.digits, k=8))
random_value = 'value_' + ''.join(random.choices(string.ascii_letters + string.digits, k=10))

# Set the key-value in Redis
result = r.set(random_key, random_value)

if result:
    print(f"Successfully set key '{random_key}' with value '{random_value}'")
    
    # Verify the value was set correctly
    retrieved_value = r.get(random_key)
    print(f"Retrieved value for key '{random_key}': {retrieved_value}")
else:
    print(f"Failed to set key '{random_key}'")