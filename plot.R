# 生成随机数据
data <- data.frame(
  category = c("A", "B", "C", "D"),
  values = sample(10:50, 4)  # 随机生成4个数值
)

# 绘制柱状图
barplot(data$values, 
        names.arg = data$category,
        main = "随机数据柱状图",
        xlab = "类别",
        ylab = "数值",
        col = "skyblue")

# 保存图形到文件
# png("barplot.png")  # 可选：保存为PNG
# barplot(data$values, names.arg = data$category, main = "随机数据柱状图", xlab = "类别", ylab = "数值", col = "skyblue")
# dev.off()