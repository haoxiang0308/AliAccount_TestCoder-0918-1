#!/usr/bin/env Rscript

# 加载必要的库 (虽然基础绘图不需要，但保持良好习惯)
# graphics 库是基础库，无需加载

# 创建示例数据
categories <- c("A", "B", "C", "D", "E")
values <- c(23, 45, 56, 78, 32)

# 创建柱状图
# 使用barplot函数
# main: 主标题
# xlab: x轴标签
# ylab: y轴标签
# col: 柱子颜色
# border: 边框颜色
barplot(values,
        names.arg = categories,
        main = "示例柱状图",
        xlab = "类别",
        ylab = "数值",
        col = "lightblue",
        border = "black")

# 为了满足“保存到随机命名的.r文件”的要求，本脚本本身即为那个.r文件。
# 如果需要将此脚本保存为另一个随机命名的文件，可以使用以下命令（已注释）：
# random_name <- paste0(sample(c(letters, 0:9), 10, replace = TRUE), collapse = "")
# writeLines(readLines("create_barplot.r"), paste0(random_name, ".r"))

# 保存图形到一个文件 (可选)
# png("barplot.png")
# barplot(values, names.arg = categories, main = "示例柱状图", xlab = "类别", ylab = "数值", col = "lightblue", border = "black")
# dev.off()
