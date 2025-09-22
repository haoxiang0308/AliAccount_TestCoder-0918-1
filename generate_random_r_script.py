import random
import string
import os

# R script content
r_script_content = '''# R Script to Load CSV and Print Summary Statistics

# Load CSV file (assuming a sample file)
# In practice, you would replace "sample_data.csv" with your file path
data <- read.csv("sample_data.csv")

# Print summary statistics
print("Summary Statistics:")
print(summary(data))

# Print structure of the data
print("Data Structure:")
str(data)

# Print first few rows
print("First few rows:")
head(data)
'''

# Generate random filename
random_filename = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + '.r'

# Save the R script to the randomly named file
with open(random_filename, 'w') as file:
    file.write(r_script_content)

print(f"R script saved to {random_filename}")