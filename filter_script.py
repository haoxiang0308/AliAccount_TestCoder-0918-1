import pandas as pd
import random
import string
import os

def create_sample_dataframe():
    """Create a sample DataFrame for demonstration."""
    data = {
        'Name': ['Alice', 'Bob', 'Charlie', 'David', 'Eva', 'Frank', 'Grace', 'Henry'],
        'Age': [25, 30, 35, 28, 22, 40, 33, 27],
        'City': ['New York', 'London', 'Paris', 'Tokyo', 'Sydney', 'Berlin', 'Rome', 'Madrid'],
        'Salary': [50000, 60000, 70000, 55000, 45000, 80000, 65000, 58000]
    }
    return pd.DataFrame(data)

def filter_dataframe(df):
    """Filter the DataFrame based on some criteria."""
    # Filter for people older than 25 and with salary greater than 50000
    filtered_df = df[(df['Age'] > 25) & (df['Salary'] > 50000)]
    return filtered_df

def generate_random_filename(extension='.py'):
    """Generate a random filename with the specified extension."""
    random_string = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_string}{extension}"

def save_filtered_data_to_file(filtered_df, original_df):
    """Save the filtered data and the code to a randomly named Python file."""
    # Generate a random filename
    random_filename = generate_random_filename('.py')
    
    # Create the content to save
    content = f'''import pandas as pd

# Original DataFrame
original_data = {original_df.to_dict(orient='list')}

# Filtered DataFrame
filtered_data = {filtered_df.to_dict(orient='list')}

original_df = pd.DataFrame(original_data)
filtered_df = pd.DataFrame(filtered_data)

print("Original DataFrame:")
print(original_df)
print("\\nFiltered DataFrame (Age > 25 and Salary > 50000):")
print(filtered_df)
'''
    
    # Write the content to the randomly named file
    with open(random_filename, 'w') as file:
        file.write(content)
    
    print(f"Filtered DataFrame saved to: {random_filename}")
    print(f"Filtered DataFrame shape: {filtered_df.shape}")
    return random_filename

def main():
    """Main function to execute the filtering and saving process."""
    print("Creating sample DataFrame...")
    df = create_sample_dataframe()
    
    print("Filtering DataFrame...")
    filtered_df = filter_dataframe(df)
    
    print("Saving filtered DataFrame to a randomly named Python file...")
    filename = save_filtered_data_to_file(filtered_df, df)
    
    print(f"Process completed! File saved as: {filename}")

if __name__ == "__main__":
    main()