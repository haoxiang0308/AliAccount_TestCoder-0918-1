import redis

# Connect to Redis server (assumes default host 'localhost' and port 6379)
r = redis.Redis(decode_responses=True)

# Set a key-value pair
key = "my_key"
value = "my_value"
r.set(key, value)

print(f"Set {key} = {value}")
print(f"Value of {key} is: {r.get(key)}")