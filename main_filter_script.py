import pandas as pd
import random
import string
import os

def create_sample_dataframe():
    """Create a sample DataFrame for demonstration."""
    data = {
        'Name': ['Alice', 'Bob', 'Charlie', 'David', 'Eve', 'Frank', 'Grace', 'Henry'],
        'Age': [25, 30, 35, 28, 22, 40, 33, 29],
        'City': ['New York', 'London', 'Paris', 'Tokyo', 'Sydney', 'Berlin', 'Madrid', 'Rome'],
        'Salary': [50000, 60000, 70000, 55000, 45000, 80000, 65000, 58000]
    }
    return pd.DataFrame(data)

def filter_dataframe(df, condition):
    """
    Filter the DataFrame based on a given condition.
    
    Args:
        df: pandas DataFrame
        condition: function that takes a DataFrame and returns a filtered DataFrame
    
    Returns:
        filtered DataFrame
    """
    return condition(df)

def generate_random_filename(extension=".py"):
    """Generate a random filename with the given extension."""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}{extension}"

def save_filtered_dataframe_to_py(filtered_df, filename):
    """
    Save the filtered DataFrame to a Python file.
    
    Args:
        filtered_df: pandas DataFrame to save
        filename: name of the file to save to
    """
    with open(filename, 'w') as f:
        f.write("# Filtered DataFrame saved to this file\n\n")
        f.write("import pandas as pd\n\n")
        f.write("# Data for the filtered DataFrame\n")
        f.write(f"filtered_data = {filtered_df.to_dict(orient='records')}\n\n")
        f.write("# Create DataFrame from the data\n")
        f.write("df_filtered = pd.DataFrame(filtered_data)\n\n")
        f.write("print('Filtered DataFrame:')\n")
        f.write("print(df_filtered)\n")

def main():
    # Create the sample DataFrame
    df = create_sample_dataframe()
    print("Original DataFrame:")
    print(df)
    
    # Define a filtering condition (e.g., age > 28)
    def age_filter(dataframe):
        return dataframe[dataframe['Age'] > 28]
    
    # Apply the filter
    filtered_df = filter_dataframe(df, age_filter)
    
    print(f"\nFiltered DataFrame (Age > 28):")
    print(filtered_df)
    
    # Generate a random filename
    random_filename = generate_random_filename()
    
    # Save the filtered DataFrame to the randomly named .py file
    save_filtered_dataframe_to_py(filtered_df, random_filename)
    
    print(f"\nFiltered DataFrame saved to {random_filename}")
    
    # Optional: Run the generated file to verify
    print("\nRunning the generated file:")
    os.system(f"python {random_filename}")

if __name__ == "__main__":
    main()