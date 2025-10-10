# 生成示例数据
categories <- c("A", "B", "C", "D")
values <- c(10, 25, 15, 30)

# 创建柱状图
barplot(values, names.arg = categories, main = "示例柱状图", xlab = "类别", ylab = "值")

# 保存为PNG文件
png("r_script_dir/barplot_example.png")
barplot(values, names.arg = categories, main = "示例柱状图", xlab = "类别", ylab = "值")
dev.off()