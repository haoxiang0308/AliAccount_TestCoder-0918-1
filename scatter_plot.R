#!/usr/bin/env Rscript

# Генерация случайных данных
set.seed(42) # Для воспроизводимости
n <- 100
x <- rnorm(n)
y <- 2 * x + rnorm(n, sd = 0.5)

# Создание диаграммы рассеяния
plot(x, y, main = "Диаграмма рассеяния (x, y)", xlab = "X", ylab = "Y")

# Генерация случайного имени файла для сохранения
random_name <- paste0("scatter_plot_", sample(10000:99999, 1), ".png")

# Сохранение диаграммы в файл PNG
png(filename = random_name, width = 800, height = 600)
plot(x, y, main = "Диаграмма рассеяния (x, y)", xlab = "X", ylab = "Y")
dev.off()

cat("Диаграмма рассеяния сохранена в файл:", random_name, "\n")