# R script to create a scatter plot and save it with a random filename

# Load required library (ggplot2 for enhanced plotting)
if (!require(ggplot2)) {
  install.packages("ggplot2")
  library(ggplot2)
}

# Generate sample data
set.seed(123)  # For reproducible results
n <- 100
x <- rnorm(n, mean = 50, sd = 15)
y <- 2 * x + rnorm(n, mean = 0, sd = 10)  # Linear relationship with some noise

# Create a data frame
df <- data.frame(x = x, y = y)

# Generate a random filename
random_name <- paste0("scatter_plot_", sample(1000:9999, 1), ".png")

# Create the scatter plot using ggplot2
p <- ggplot(df, aes(x = x, y = y)) +
  geom_point(color = "blue", alpha = 0.6) +
  labs(title = "Scatter Plot",
       x = "X Variable",
       y = "Y Variable") +
  theme_minimal()

# Save the plot with the random filename
ggsave(random_name, plot = p, width = 8, height = 6, dpi = 300)

cat("Scatter plot saved as:", random_name, "\n")