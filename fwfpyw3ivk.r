# R Script to Load CSV and Print Summary Statistics

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
