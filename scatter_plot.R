# R script to create a scatter plot and save it with a random filename

# Generate sample data
set.seed(123)  # For reproducible random results
n <- 100
x <- rnorm(n)
y <- 2 * x + rnorm(n, sd = 0.5)  # Linear relationship with some noise

# Create a random filename
random_string <- paste(sample(c(letters, LETTERS, 0:9), 10, replace = TRUE), collapse = "")
filename <- paste0("scatter_plot_", random_string, ".png")

# Open a PNG graphics device
png(filename, width = 800, height = 600, res = 100)

# Create the scatter plot using base R
plot(x, y, 
     main = "Scatter Plot", 
     xlab = "X Values", 
     ylab = "Y Values",
     col = "blue",
     pch = 19,  # solid circle
     cex = 0.8) # size of points

# Add a trend line
abline(lm(y ~ x), col = "red", lwd = 2)

# Close the graphics device
dev.off()

cat("Scatter plot saved as:", filename, "\n")