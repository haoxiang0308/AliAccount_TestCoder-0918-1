# 生成随机数据
set.seed(123) # 设置随机种子以确保结果可复现
categories <- c("A", "B", "C", "D", "E")
values <- sample(10:100, 5)

# 创建柱状图
barplot(values, names.arg = categories, col = "skyblue", 
        main = "Sample Bar Chart", xlab = "Categories", ylab = "Values")

# 保存图表到文件 (R会自动添加.png扩展名)
dev.copy(png, filename = "my_bar_chart.png", width = 600, height = 400)
dev.off() # 关闭图形设备

print("图表已保存为 my_bar_chart.png")