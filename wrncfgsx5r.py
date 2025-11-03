import redis
import random
import string

# Connect to Redis (assuming default localhost:6379)
try:
    r = redis.Redis(host='localhost', port=6379, db=0, decode_responses=True)
    r.ping()  # Test connection
    print("Connected to Redis successfully!")
except redis.ConnectionError:
    print("Could not connect to Redis. Make sure Redis server is running.")
    exit(1)

# Generate a random key and value
random_key = 'key_' + ''.join(random.choices(string.ascii_letters + string.digits, k=10))
random_value = 'value_' + ''.join(random.choices(string.ascii_letters + string.digits, k=15))

# Set the key-value pair in Redis
r.set(random_key, random_value)
print(f"Set key '{random_key}' with value '{random_value}' in Redis")

# Verify the key-value was set
retrieved_value = r.get(random_key)
print(f"Retrieved value for key '{random_key}': {retrieved_value}")