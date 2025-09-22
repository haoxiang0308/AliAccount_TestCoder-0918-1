# Generate random data
categories <- c("A", "B", "C", "D", "E")
values <- sample(1:100, 5)

# Create bar plot
barplot(values, names.arg = categories, col = rainbow(5), main = "Random Bar Plot", xlab = "Categories", ylab = "Values")

# Save the plot to a file (the script name without .r extension)
script_name <- commandArgs(trailingOnly = FALSE)[4]
script_name <- sub("--file=", "", script_name)
plot_filename <- paste0(tools::file_path_sans_ext(basename(script_name)), ".png")
dev.copy(png, filename = plot_filename, width = 800, height = 600)
dev.off()

cat(paste("Plot saved as", plot_filename, "\n"))