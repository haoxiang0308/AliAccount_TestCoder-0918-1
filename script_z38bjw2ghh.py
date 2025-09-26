import pandas as pd
import random
import string

def generate_random_filename(length=8, prefix="filtered_data_", suffix=".csv"):
    """Generates a random filename."""
    random_chars = \'\'.join(random.choice(string.ascii_lowercase + string.digits) for _ in range(length))
    return f\"{prefix}{random_chars}{suffix}\"


# Create a sample DataFrame
data = {
    \'Name\': [\'Alice\', \'Bob\', \'Charlie\', \'David\', \'Eve\'],
    \'Age\': [25, 30, 35, 28, 32],
    \'City\': [\'New York\', \'London\', \'Paris\', \'Tokyo\', \'Sydney\']
}
df = pd.DataFrame(data)

# Filter the DataFrame (example: filter for Age > 29)
filtered_df = df[df[\'Age\'] > 29]

# Generate a random filename and save the filtered DataFrame
random_filename = generate_random_filename()
filtered_df.to_csv(random_filename, index=False)

print(f\"Filtered DataFrame saved to {random_filename}\")
print(filtered_df)
