# R script to load a CSV file and print summary statistics

# Load the CSV file
# Note: You'll need to specify the correct path to your CSV file
csv_file <- read.csv("your_file.csv")

# Print basic information about the dataset
cat("Dataset dimensions:", dim(csv_file), "\n")
cat("Column names:", names(csv_file), "\n\n")

# Print summary statistics
print(summary(csv_file))

# Additional statistics for numeric columns
numeric_cols <- sapply(csv_file, is.numeric)
if(any(numeric_cols)) {
  cat("\nAdditional statistics for numeric columns:\n")
  print(sapply(csv_file[numeric_cols], function(x) c(
    Mean = mean(x, na.rm = TRUE),
    Median = median(x, na.rm = TRUE),
    SD = sd(x, na.rm = TRUE),
    Min = min(x, na.rm = TRUE),
    Max = max(x, na.rm = TRUE)
  )))
}