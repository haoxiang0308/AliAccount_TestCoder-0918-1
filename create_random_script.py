import random
import string
import shutil

# Generate a random filename
random_chars = ''.join(random.choices(string.ascii_lowercase + string.digits, k=8))
filename = f"mysql_query_{random_chars}.py"

# Copy the template to the new file
shutil.copy('/workspace/mysql_select_template.py', f'/workspace/{filename}')

print(f"Created Python script with random name: {filename}")