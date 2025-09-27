# Script to create a scatter plot and save it with a random filename
# Генерация случайных данных
set.seed(42) # Для воспроизводимости
x <- rnorm(100)
y <- rnorm(100)

# Создание диаграммы рассеяния
plot(x, y, main="Scatter Plot", xlab="X axis", ylab="Y axis")

# Генерация случайного имени файла
random_name <- paste0(sample(c(letters, LETTERS, 0:9), 10, replace=TRUE), collapse="")
filename <- paste0("/workspace/", random_name, ".png")

# Сохранение графика в файл
png(filename)
plot(x, y, main="Scatter Plot", xlab="X axis", ylab="Y axis")
dev.off()

cat("Plot saved to:", filename, "\n")