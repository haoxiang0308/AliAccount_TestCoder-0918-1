# R script to load a CSV file and print summary statistics

# Load the CSV file
# Replace 'data.csv' with the path to your actual CSV file
data <- read.csv("data.csv")

# Print basic summary statistics
print("Summary Statistics:")
print(summary(data))

# Print structure of the data
print("Data Structure:")
print(str(data))

# Print first few rows
print("First 6 rows:")
print(head(data))

# Print dimensions
print(paste("Data Dimensions:", nrow(data), "rows and", ncol(data), "columns"))