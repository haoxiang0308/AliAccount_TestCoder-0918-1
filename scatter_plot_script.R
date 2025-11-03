# R script to create a scatter plot and save it with a random filename

# Generate sample data
set.seed(123)  # For reproducible random results
x <- rnorm(100, mean = 50, sd = 15)
y <- 2 * x + rnorm(100, mean = 0, sd = 10)

# Create a scatter plot
plot(x, y, 
     main = "Scatter Plot",
     xlab = "X Variable", 
     ylab = "Y Variable",
     pch = 19,  # Solid circles
     col = "blue",
     cex = 0.8)  # Point size

# Add a regression line
abline(lm(y ~ x), col = "red", lwd = 2)

# Generate a random filename
random_name <- paste0("scatter_plot_", sample(1000:9999, 1), ".png")

# Save the plot to a file with the random name
png(random_name, width = 800, height = 600)
plot(x, y, 
     main = "Scatter Plot",
     xlab = "X Variable", 
     ylab = "Y Variable",
     pch = 19,
     col = "blue",
     cex = 0.8)
abline(lm(y ~ x), col = "red", lwd = 2)
dev.off()

cat("Scatter plot saved as:", random_name, "\n")