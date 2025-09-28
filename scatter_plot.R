#!/usr/bin/env Rscript

# Загрузка библиотеки для генерации случайных имен
library(uuid)

# Генерация случайного имени файла
random_name <- paste0("scatter_plot_", UUIDgenerate(), ".png")

# Создание случайных данных
set.seed(42) # Для воспроизводимости
x <- rnorm(100)
y <- rnorm(100)

# Открытие устройства PNG с указанным именем файла
png(random_name, width = 800, height = 600)

# Построение диаграммы рассеяния
plot(x, y, main = "Scatter Plot", xlab = "X", ylab = "Y")

# Закрытие устройства PNG
dev.off()

cat("Диаграмма рассеяния сохранена в файл:", random_name, "\n")