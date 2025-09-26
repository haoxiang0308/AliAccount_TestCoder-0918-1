# R script: a31q29gb8g.R
# Диаграмма рассеяния

# Создание данных
set.seed(42) # Для воспроизводимости
x <- rnorm(100)
y <- rnorm(100)

# Построение диаграммы рассеяния
png("scatter_plot.png")
plot(x, y, main="Диаграмма рассеяния", xlab="X", ylab="Y")
dev.off()

cat("Диаграмма рассеяния сохранена в scatter_plot.png\n")