import redis

# Connect to Redis (assuming default localhost:6379)
try:
    r = redis.Redis(host='localhost', port=6379, db=0, decode_responses=True)
    print('Connected to Redis successfully!')
    
    # Set a key-value pair
    key = 'my_key'
    value = 'my_value'
    r.set(key, value)
    print(f'Set key "{key}" with value "{value}"')
    
    # Verify the value was set
    retrieved_value = r.get(key)
    print(f'Retrieved value for "{key}": {retrieved_value}')
    
except Exception as e:
    print(f'Error connecting to Redis: {e}')
    print('Make sure Redis server is running on localhost:6379')
