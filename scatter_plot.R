# R script to create a scatter plot and save it with a random filename
# Generate sample data
set.seed(123)  # for reproducible random results
x <- rnorm(100, mean = 50, sd = 15)
y <- 2 * x + rnorm(100, mean = 0, sd = 10)  # linear relationship with some noise

# Create a data frame
data <- data.frame(x = x, y = y)

# Generate a random filename
random_name <- paste0("scatter_plot_", sample(1000:9999, 1), ".png")

# Create the scatter plot
png(random_name, width = 800, height = 600)  # Create PNG device with specified dimensions
plot(data$x, data$y, 
     main = "Scatter Plot", 
     xlab = "X Variable", 
     ylab = "Y Variable",
     pch = 19,  # solid circles
     col = rgb(0.2, 0.4, 0.8, alpha = 0.6),  # semi-transparent blue points
     cex = 1.2)  # size of points

# Add a trend line
abline(lm(y ~ x, data = data), col = "red", lwd = 2)

# Close the graphics device to save the file
dev.off()

cat("Scatter plot saved as:", random_name, "\n")