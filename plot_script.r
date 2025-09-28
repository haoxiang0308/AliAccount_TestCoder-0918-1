# 生成示例数据
categories <- c("A", "B", "C", "D")
values <- c(10, 15, 8, 12)

# 创建绘图目录
dir.create("plots", showWarnings = FALSE)

# 绘制柱状图
png(filename = "plots/barplot.png", width = 800, height = 600)
barplot(values, names.arg = categories, main = "Simple Bar Chart", xlab = "Category", ylab = "Value")
dev.off()

cat("Bar chart saved as plots/barplot.png\n")
