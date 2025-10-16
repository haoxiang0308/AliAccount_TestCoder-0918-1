# R script to load a CSV file and print summary statistics

# Load the CSV file
# Note: Replace 'your_file.csv' with the actual path to your CSV file
data <- read.csv("your_file.csv")

# Print the structure of the data
print("Data Structure:")
str(data)

# Print summary statistics
print("Summary Statistics:")
summary(data)

# Print first few rows
print("First 6 rows:")
head(data)

# Print dimensions of the dataset
print(paste("Dataset dimensions:", nrow(data), "rows and", ncol(data), "columns"))