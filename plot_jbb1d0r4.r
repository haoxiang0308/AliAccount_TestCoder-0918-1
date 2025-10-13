# R script to generate data, create a bar plot, and save it as a PNG file

# Generate sample data
categories <- c("A", "B", "C", "D", "E")
values <- c(23, 45, 56, 78, 32)

# Create a data frame
df <- data.frame(Category = categories, Value = values)

# Define the output file name
output_file <- "barplot_output.png"

# Open a PNG device
png(output_file, width = 800, height = 600)

# Create the bar plot
barplot(df$Value,
        names.arg = df$Category,
        main = "Sample Bar Plot",
        xlab = "Categories",
        ylab = "Values",
        col = "skyblue",
        border = "black")

# Close the PNG device to save the file
dev.off()

cat("Bar plot saved to:", output_file, "\n")