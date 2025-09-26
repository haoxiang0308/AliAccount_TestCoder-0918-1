# Load necessary library (not strictly needed for base plot, but good practice for png)
library(grDevices)

# Generate some random data
set.seed(42) # For reproducible "random" results
x <- rnorm(100)
y <- x + rnorm(100, sd = 0.5)

# Create a unique filename using a random number
plot_filename <- paste0("scatter_plot_", sample(10000:99999, 1), ".png")

# Open a PNG graphics device
png(filename = plot_filename, width = 800, height = 600)

# Create the scatter plot
plot(x, y, main = "Scatter Plot of Random Data", xlab = "X Variable", ylab = "Y Variable", pch = 19, col = "blue")

# Close the graphics device to save the file
dev.off()

# Print the name of the saved file
cat("Scatter plot saved as:", plot_filename, "\n")