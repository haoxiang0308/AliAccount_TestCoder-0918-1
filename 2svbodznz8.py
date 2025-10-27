import redis

# Connect to Redis (assumes Redis is running on localhost:6379)
r = redis.Redis(host='localhost', port=6379, db=0)

# Set a key-value pair
key = 'example_key'
value = 'example_value'
r.set(key, value)

print(f'Set {key} = {value} in Redis')
