# R script to create a bar plot and save it

# Create sample data
categories <- c("A", "B", "C", "D", "E")
values <- c(23, 45, 56, 78, 32)

# Create the bar plot
barplot(values, 
        names.arg = categories,
        main = "Sample Bar Plot",
        xlab = "Categories",
        ylab = "Values",
        col = "skyblue",
        border = "black")

# Save the plot as a PNG file
png("bar_plot.png")
barplot(values, 
        names.arg = categories,
        main = "Sample Bar Plot",
        xlab = "Categories",
        ylab = "Values",
        col = "skyblue",
        border = "black")
dev.off() # Close the PNG device