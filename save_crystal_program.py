import random
import string
import os

# Crystal program content
crystal_program = """# This program outputs the current time in Crystal
puts Time.local
"""

# Generate a random filename with .cr extension
random_filename = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + '.cr'

# Write the Crystal program to the random file
with open(random_filename, 'w') as f:
    f.write(crystal_program)

print(f"Crystal program saved to {random_filename}")