# R script to load a CSV file and print summary statistics

# Load the CSV file
# Note: You'll need to specify the correct path to your CSV file
csv_file <- "data.csv"  # Change this to your actual file path
data <- read.csv(csv_file)

# Print basic information about the dataset
cat("Dataset dimensions:", dim(data), "\n")
cat("Column names:", names(data), "\n\n")

# Print summary statistics
print(summary(data))

# Additional statistics for numeric columns
numeric_cols <- sapply(data, is.numeric)
if(any(numeric_cols)) {
  cat("\nAdditional statistics for numeric columns:\n")
  numeric_data <- data[numeric_cols]
  print(sapply(numeric_data, function(x) c(
    Mean = mean(x, na.rm = TRUE),
    Median = median(x, na.rm = TRUE),
    SD = sd(x, na.rm = TRUE),
    Min = min(x, na.rm = TRUE),
    Max = max(x, na.rm = TRUE)
  )))
}