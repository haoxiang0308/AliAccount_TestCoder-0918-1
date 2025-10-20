# R script to create a scatter plot and save it with a random filename

# Generate random data
set.seed(123)  # For reproducible random results
x <- rnorm(100)
y <- 2 * x + rnorm(100, sd = 0.5)  # y is related to x with some noise

# Generate a random filename
random_string <- paste(sample(c(letters, LETTERS, 0:9), 10, replace = TRUE), collapse = "")
plot_filename <- paste0("/workspace/plot_", random_string, ".png")

# Create the scatter plot
png(plot_filename, width = 800, height = 600)
plot(x, y, 
     main = "Scatter Plot", 
     xlab = "X values", 
     ylab = "Y values",
     pch = 19,  # solid circles
     col = "blue")
abline(lm(y ~ x), col = "red")  # Add regression line
dev.off()

cat("Scatter plot saved to:", plot_filename, "\n")