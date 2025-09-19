# Generate random data
categories <- c("A", "B", "C", "D", "E")
values <- sample(10:100, 5)

# Create bar plot
barplot(values, names.arg = categories, main = "Random Bar Chart", xlab = "Categories", ylab = "Values", col = "skyblue")