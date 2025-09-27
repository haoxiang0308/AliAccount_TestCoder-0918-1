import random
import string

# Generate a random name for the new file
random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + '.py'

# Content for the new file (a simple print statement)
new_file_content = 'print("Hello from the randomly named file!")\n'

# Write the content to the new file
with open(random_name, 'w') as f:
    f.write(new_file_content)

print(f"Script saved to {random_name}")
