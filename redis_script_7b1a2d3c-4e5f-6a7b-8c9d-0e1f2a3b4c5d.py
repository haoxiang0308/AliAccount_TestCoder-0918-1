import redis
import uuid

# Connect to Redis (assumes Redis is running on localhost:6379)
r = redis.Redis(host='localhost', port=6379, db=0, decode_responses=True)

# Generate a random key
random_key = str(uuid.uuid4())

# Set a key-value pair in Redis
r.set(random_key, 'Hello, Redis!')

print(f"Set key-value pair in Redis: {random_key} -> Hello, Redis!")

# Optionally, get and print the value back
retrieved_value = r.get(random_key)
print(f"Retrieved value for key {random_key}: {retrieved_value}")
