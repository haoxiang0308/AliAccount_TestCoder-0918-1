import redis
import random
import string

def generate_random_filename():
    """Generate a random filename with .py extension."""
    letters = string.ascii_lowercase
    random_name = ''.join(random.choice(letters) for i in range(10))
    return f"{random_name}.py"

def set_redis_key():
    """Set a key-value pair in Redis."""
    try:
        # Connect to Redis (assumes Redis is running on localhost:6379)
        r = redis.Redis(host='localhost', port=6379, db=0, decode_responses=True)
        
        key = "my_key"
        value = "my_value"
        r.set(key, value)
        print(f"Set key '{{key}}' with value '{{value}}' in Redis")
        return True
    except redis.exceptions.ConnectionError:
        print("Redis server is not running. Please start Redis server first.")
        return False

def save_to_random_file(content):
    """Save the script content to a randomly named .py file."""
    random_filename = generate_random_filename()
    with open(random_filename, 'w') as f:
        f.write(content)
    print(f"Script saved to {{random_filename}}")
    return random_filename

if __name__ == "__main__":
    # Simple script content to save
    script_content = """import redis
import random
import string

def generate_random_filename():
    """Generate a random filename with .py extension."""
    letters = string.ascii_lowercase
    random_name = ''.join(random.choice(letters) for i in range(10))
    return f"{random_name}.py"

def set_redis_key():
    """Set a key-value pair in Redis."""
    try:
        # Connect to Redis (assumes Redis is running on localhost:6379)
        r = redis.Redis(host='localhost', port=6379, db=0, decode_responses=True)
        
        key = "my_key"
        value = "my_value"
        r.set(key, value)
        print(f"Set key '{{key}}' with value '{{value}}' in Redis")
        return True
    except redis.exceptions.ConnectionError:
        print("Redis server is not running. Please start Redis server first.")
        return False

if __name__ == "__main__":
    set_redis_key()
"""
    success = set_redis_key()
    if success:
        save_to_random_file(script_content)
