import random
import string

# Generate a random filename
filename = ''.join(random.choices(string.ascii_letters + string.digits, k=10)) + '.html'

# HTML content
html_content = """<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sample Page</title>
</head>
<body>
    <h1>Welcome to My Page</h1>
    <p>This is a sample paragraph on my HTML page.</p>
</body>
</html>"""

# Write the content to the file
with open(filename, 'w') as f:
    f.write(html_content)

print(f"Created HTML file with random name: {filename}")