# R script to create a bar chart and save it

# Create sample data
categories <- c("A", "B", "C", "D", "E")
values <- c(23, 45, 56, 78, 32)

# Create the bar chart
barplot(values, 
        names.arg = categories,
        main = "Sample Bar Chart",
        xlab = "Categories",
        ylab = "Values",
        col = "lightblue",
        border = "black")

# Optional: Save the plot as an image
# png("bar_chart.png", width = 600, height = 400)
# barplot(values, 
#         names.arg = categories,
#         main = "Sample Bar Chart",
#         xlab = "Categories",
#         ylab = "Values",
#         col = "lightblue",
#         border = "black")
# dev.off()

# Print the data to console
print(data.frame(Category = categories, Value = values))