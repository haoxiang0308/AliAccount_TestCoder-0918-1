# Makefile для компиляции программы на C

# Имя исполняемого файла
TARGET = my_program

# Исходный файл
SOURCE = main.c

# Компилятор
CC = gcc

# Флаги компиляции
CFLAGS = -Wall -Wextra -std=c99

# Правило для сборки
$(TARGET): $(SOURCE)
	$(CC) $(CFLAGS) -o $(TARGET) $(SOURCE)

# Правило для очистки
clean:
	rm -f $(TARGET)

# Правило по умолчанию
all: $(TARGET)

.PHONY: all clean