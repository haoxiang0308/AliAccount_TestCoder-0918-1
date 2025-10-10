# Скрипт R для построения диаграммы рассеяния и сохранения в файл со случайным именем

# Генерация случайных данных
set.seed(42) # Для воспроизводимости
x <- rnorm(100)
y <- 2 * x + rnorm(100, sd = 0.5)

# Создание имени файла
# Используем дробную часть времени в секундах как "случайную" часть имени
# Формат: scatter_plot_123.456.png
time_sec <- Sys.time()
time_formatted <- gsub("\\.", "_", format(time_sec, "%OS3"))
random_filename <- paste0("scatter_plot_", time_formatted, ".png")

# Построение графика и сохранение в файл
png(random_filename, width = 800, height = 600)
plot(x, y, main = "Диаграмма рассеяния", xlab = "X", ylab = "Y", pch = 19, col = "blue")
dev.off()

cat("График сохранен в файл:", random_filename, "\n")