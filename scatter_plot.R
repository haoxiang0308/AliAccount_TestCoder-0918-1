# Скрипт R для построения диаграммы рассеяния
# Генерация случайных данных
set.seed(123) # Для воспроизводимости
x <- rnorm(100)
y <- 2 * x + rnorm(100, sd = 0.5) # y зависит от x с добавлением шума

# Создание диаграммы рассеяния
plot(x, y,
     main = "Диаграмма рассеяния",
     xlab = "X",
     ylab = "Y",
     pch = 19, # тип точки
     col = "blue" # цвет точек
)

# Сохранение графика в файл PNG
# Используем случайное имя файла, генерируемое с помощью paste, sample и Sys.time
file_name <- paste0("scatter_plot_", format(Sys.time(), "%Y%m%d_%H%M%S"), "_", sample(1000:9999, 1), ".png")
png(filename = file_name, width = 800, height = 600)
plot(x, y,
     main = "Диаграмма рассеяния",
     xlab = "X",
     ylab = "Y",
     pch = 19,
     col = "blue"
)
dev.off() # Закрытие устройства вывода

cat("График сохранен в файл:", file_name, "\n")