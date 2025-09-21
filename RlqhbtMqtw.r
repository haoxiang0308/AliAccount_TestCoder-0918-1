# R Script for Loading CSV and Printing Summary Statistics

# Load necessary library
# install.packages("readr") # Uncomment if you need to install the package
library(readr)

# Load the CSV file (replace 'data.csv' with your actual file path)
# For this example, we'll create a sample dataset
data <- data.frame(
  ID = 1:100,
  Age = sample(18:80, 100, replace = TRUE),
  Score = rnorm(100, mean = 75, sd = 10),
  Category = sample(c("A", "B", "C"), 100, replace = TRUE)
)

# Alternatively, to load from an actual CSV file, use:
# data <- read_csv("path/to/your/file.csv")

# Print summary statistics
print("Summary of the dataset:")
print(summary(data))

# Print structure of the dataset
print("Structure of the dataset:")
print(str(data))

# Print first few rows
print("First 6 rows of the dataset:")
print(head(data))