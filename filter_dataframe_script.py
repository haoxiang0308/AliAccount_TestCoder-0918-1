import pandas as pd
import random
import string

def generate_random_filename():
    """Generate a random filename with .py extension"""
    random_chars = ''.join(random.choices(string.ascii_lowercase + string.digits, k=8))
    return f"filtered_data_{random_chars}.py"

def create_and_filter_dataframe():
    """Create a sample DataFrame and filter it"""
    # Create a sample DataFrame
    data = {
        'name': ['Alice', 'Bob', 'Charlie', 'David', 'Eva', 'Frank'],
        'age': [25, 32, 18, 47, 22, 35],
        'city': ['New York', 'London', 'Paris', 'Tokyo', 'Berlin', 'Sydney'],
        'salary': [50000, 75000, 30000, 90000, 45000, 80000]
    }
    
    df = pd.DataFrame(data)
    print("Original DataFrame:")
    print(df)
    
    # Filter the DataFrame (example: people older than 25 with salary > 50000)
    filtered_df = df[(df['age'] > 25) & (df['salary'] > 50000)]
    
    print("\nFiltered DataFrame (age > 25 and salary > 50000):")
    print(filtered_df)
    
    return df, filtered_df

if __name__ == "__main__":
    # Create and filter the DataFrame
    original_df, filtered_df = create_and_filter_dataframe()
    
    # Save the filtered DataFrame to a new file
    filename = generate_random_filename()
    print(f"\nSaving filtered data to: {filename}")
    
    # Save the script with the filtered data
    with open(filename, 'w') as f:
        f.write("import pandas as pd\n\n")
        f.write("# This script contains filtered data\n\n")
        f.write("# Original data\n")
        f.write(f"original_data = {original_df.to_dict('records')}\n\n")
        f.write("# Filtered data\n")
        f.write(f"filtered_data = {filtered_df.to_dict('records')}\n\n")
        f.write("# Create DataFrames\n")
        f.write("original_df = pd.DataFrame(original_data)\n")
        f.write("filtered_df = pd.DataFrame(filtered_data)\n\n")
        f.write("print('Filtered DataFrame:')\n")
        f.write("print(filtered_df)\n")
    
    print("File saved successfully!")