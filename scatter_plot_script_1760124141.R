# R-скрипт для построения диаграммы рассеяния и сохранения в файл

# Загрузка необходимой библиотеки
library(ggplot2)

# Создание фрейма данных с произвольными данными
set.seed(123) # Для воспроизводимости
n <- 100
df <- data.frame(
  x = rnorm(n),
  y = rnorm(n)
)

# Построение диаграммы рассеяния
p <- ggplot(df, aes(x = x, y = y)) +
  geom_point() +
  labs(title = "Диаграмма рассеяния", x = "X", y = "Y")

# Сохранение диаграммы в файл PNG с уникальным именем
filename <- paste0("scatter_plot_", Sys.time(), ".png")
filename <- gsub(":", "-", filename) # Замена двоеточий в имени файла
ggsave(filename, plot = p, width = 8, height = 6)

cat("Диаграмма рассеяния сохранена в файл:", filename, "\n")