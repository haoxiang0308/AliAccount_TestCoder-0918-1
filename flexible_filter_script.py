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
    
    # Example 1: Filter by age > 28
    print("\n--- Example 1: Filtering by Age > 28 ---")
    def age_filter(dataframe):
        return dataframe[dataframe['Age'] > 28]
    
    filtered_df1 = filter_dataframe(df, age_filter)
    print("Filtered DataFrame (Age > 28):")
    print(filtered_df1)
    
    # Generate a random filename and save
    random_filename1 = generate_random_filename()
    save_filtered_dataframe_to_py(filtered_df1, random_filename1)
    print(f"Filtered DataFrame saved to {random_filename1}")
    
    # Example 2: Filter by salary > 60000
    print("\n--- Example 2: Filtering by Salary > 60000 ---")
    def salary_filter(dataframe):
        return dataframe[dataframe['Salary'] > 60000]
    
    filtered_df2 = filter_dataframe(df, salary_filter)
    print("Filtered DataFrame (Salary > 60000):")
    print(filtered_df2)
    
    # Generate a random filename and save
    random_filename2 = generate_random_filename()
    save_filtered_dataframe_to_py(filtered_df2, random_filename2)
    print(f"Filtered DataFrame saved to {random_filename2}")
    
    # Example 3: Filter by city containing 'on' (like London)
    print("\n--- Example 3: Filtering by City containing 'on' ---")
    def city_filter(dataframe):
        return dataframe[dataframe['City'].str.contains('on', case=False, na=False)]
    
    filtered_df3 = filter_dataframe(df, city_filter)
    print("Filtered DataFrame (City contains 'on'):")
    print(filtered_df3)
    
    # Generate a random filename and save
    random_filename3 = generate_random_filename()
    save_filtered_dataframe_to_py(filtered_df3, random_filename3)
    print(f"Filtered DataFrame saved to {random_filename3}")
    
    print(f"\nAll filtered DataFrames saved to randomly named .py files!")

if __name__ == "__main__":
    main()