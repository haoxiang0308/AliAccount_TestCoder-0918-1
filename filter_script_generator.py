import pandas as pd
import random
import string

def generate_random_filename():
    """Generates a random filename with a .py extension."""
    letters = string.ascii_lowercase
    return ''.join(random.choice(letters) for i in range(10)) + '.py'

def create_filter_script():
    """Creates a Python script that filters a DataFrame and saves it."""
    # Sample DataFrame
    data = {
        'Name': ['Alice', 'Bob', 'Charlie', 'David', 'Eve'],
        'Age': [25, 30, 35, 40, 45],
        'City': ['New York', 'London', 'Paris', 'Tokyo', 'Sydney']
    }
    df = pd.DataFrame(data)

    # Filter the DataFrame (e.g., Age > 30)
    filtered_df = df[df['Age'] > 30]

    # Generate a random filename
    random_filename = generate_random_filename()

    # Create the script content as a string
    script_content = f'''import pandas as pd

# Sample DataFrame
data = {{
    'Name': ['Alice', 'Bob', 'Charlie', 'David', 'Eve'],
    'Age': [25, 30, 35, 40, 45],
    'City': ['New York', 'London', 'Paris', 'Tokyo', 'Sydney']
}}
df = pd.DataFrame(data)

# Filter the DataFrame (e.g., Age > 30)
filtered_df = df[df['Age'] > 30]

# Save the filtered DataFrame to a new CSV file
filtered_df.to_csv('filtered_data.csv', index=False)

print("Filtered DataFrame saved to \\'{{random_filename.replace('.py', '.csv')}}\\'")
print(filtered_df)
'''

    # Write the script content to the randomly named file
    with open(random_filename, 'w') as f:
        f.write(script_content)

    print(f"Script generated and saved as {random_filename}")

if __name__ == "__main__":
    create_filter_script()
