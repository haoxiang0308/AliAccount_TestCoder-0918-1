# Generate random data
categories <- c("A", "B", "C", "D", "E")
values <- sample(10:100, 5)

# Create the bar plot
barplot(values, names.arg = categories, main = "Random Bar Plot", xlab = "Categories", ylab = "Values", col = "skyblue")

# Save the plot to a file (the R script itself will be saved as .R)
# The plot will be saved as a PDF in the same directory
pdf("random_bar_plot.pdf")
barplot(values, names.arg = categories, main = "Random Bar Plot", xlab = "Categories", ylab = "Values", col = "skyblue")
dev.off()

cat("Bar plot saved as 'random_bar_plot.pdf'\n")