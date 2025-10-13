# R script to create a scatter plot and save it with a random filename

# Generate some random data
set.seed(42) # For reproducible random results
x <- rnorm(100)
y <- 2 * x + rnorm(100, sd = 0.5) # y is related to x with some noise

# Create a basic scatter plot
plot(x, y, main = "Scatter Plot of Random Data", xlab = "X Variable", ylab = "Y Variable")

# Generate a random filename for the output
# Using a combination of letters and numbers for randomness
random_string <- paste0(sample(c(letters, LETTERS, 0:9), 10, replace = TRUE), collapse = "")
filename <- paste0("/workspace/plot_", random_string, ".png")

# Save the plot as a PNG file
png(filename, width = 800, height = 600)
plot(x, y, main = "Scatter Plot of Random Data", xlab = "X Variable", ylab = "Y Variable")
dev.off()

cat("Scatter plot saved to:", filename, "\n")