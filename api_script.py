import requests
import random
import string

# Generate a random filename
random_filename = ''.join(random.choices(string.ascii_lowercase + string.digits, k=8)) + '.py'

# Example API call (using JSONPlaceholder)
response = requests.get('https://jsonplaceholder.typicode.com/posts/1')

# Write the response to the random file
with open(random_filename, 'w') as f:
    f.write(f'# API Response saved from {response.url}\n')
    f.write(str(response.json()))

print(f"API response saved to {random_filename}")