# R script to create a bar chart

# Sample data
categories <- c("A", "B", "C", "D", "E")
values <- c(23, 45, 56, 78, 32)

# Create a bar chart
barplot(values, 
        names.arg = categories,
        main = "Sample Bar Chart",
        xlab = "Categories",
        ylab = "Values",
        col = "lightblue",
        border = "black")

# Optional: Save the plot to a file
# png("bar_chart.png")
# barplot(values, 
#         names.arg = categories,
#         main = "Sample Bar Chart",
#         xlab = "Categories",
#         ylab = "Values",
#         col = "lightblue",
#         border = "black")
# dev.off()