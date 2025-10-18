import redis
import random
import string

# Generate a random key name
random_key = ''.join(random.choices(string.ascii_letters + string.digits, k=10))

# Connect to Redis (assumes Redis is running on localhost:6379)
r = redis.Redis(host='localhost', port=6379, db=0, decode_responses=True)

# Set a key-value pair in Redis
value_to_set = "Hello, Redis!"
r.set(random_key, value_to_set)

print(f"Set key '{random_key}' with value '{value_to_set}' in Redis")