import redis
import random
import string

try:
    # Connect to Redis (assumes Redis is running on localhost:6379)
    r = redis.Redis(host='localhost', port=6379, db=0, decode_responses=True)

    # Generate a random key name
    random_key = ''.join(random.choices(string.ascii_letters + string.digits, k=10))
    random_value = "Hello from Python Redis!"

    # Set the key-value pair
    r.set(random_key, random_value)

    print(f"Set key '{random_key}' with value '{random_value}'")
    print(f"All keys in Redis: {r.keys('*')}")

except redis.exceptions.ConnectionError:
    print("Could not connect to Redis server. Please ensure Redis is running on localhost:6379.")
    print("The script will now exit.")
    exit(1)