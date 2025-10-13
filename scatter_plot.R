#!/usr/bin/env Rscript

# Генерация случайных данных
set.seed(42) # Для воспроизводимости
n <- 100
x <- rnorm(n)
y <- 2 * x + rnorm(n, sd = 0.5)

# Создание диаграммы рассеяния
plot(x, y, main = "Диаграмма рассеяния (x vs y)", xlab = "X", ylab = "Y", pch = 19, col = "blue")

# Сохранение графика в файл со случайным именем
# Генерируем случайное имя файла
random_name <- paste0("scatter_plot_", sample(1000:9999, 1), ".png")
png(random_name, width = 800, height = 600)
plot(x, y, main = "Диаграмма рассеяния (x vs y)", xlab = "X", ylab = "Y", pch = 19, col = "blue")
dev.off()

cat("График сохранен в файл:", random_name, "\n")