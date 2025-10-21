# R script to create a scatter plot and save it with a random filename

# Generate some sample data
set.seed(123)  # for reproducibility
x <- rnorm(100, mean = 50, sd = 15)
y <- 2 * x + rnorm(100, mean = 0, sd = 10)  # linear relationship with some noise

# Create a scatter plot
plot(x, y, 
     main = "Scatter Plot Example", 
     xlab = "X Variable", 
     ylab = "Y Variable",
     pch = 19,  # solid circles
     col = rgb(0.2, 0.4, 0.6, 0.6),  # semi-transparent blue
     cex = 1.2)  # slightly larger points

# Add a trend line
abline(lm(y ~ x), col = "red", lwd = 2)

# Generate a random filename
random_name <- paste0("scatter_plot_", sample(1000:9999, 1), ".png")

# Save the plot as a PNG file
png(filename = random_name, width = 800, height = 600)
plot(x, y, 
     main = "Scatter Plot Example", 
     xlab = "X Variable", 
     ylab = "Y Variable",
     pch = 19,
     col = rgb(0.2, 0.4, 0.6, 0.6),
     cex = 1.2)
abline(lm(y ~ x), col = "red", lwd = 2)
dev.off()

cat("Scatter plot saved as:", random_name, "\n")