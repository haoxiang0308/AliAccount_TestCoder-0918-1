# 定义编译目标
TARGET = my_program

# 定义源文件
SOURCES = main.c utils.c

# 定义编译器
CC = gcc

# 定义编译选项
CFLAGS = -Wall -g

# 定义对象文件
OBJECTS = $(SOURCES:.c=.o)

# 默认目标
all: $(TARGET)

# 链接目标
$(TARGET): $(OBJECTS)
	$(CC) -o $@ $^

# 编译规则
%.o: %.c
	$(CC) -c $(CFLAGS) $< -o $@

# 清理目标
clean:
	rm -f $(OBJECTS) $(TARGET)

# 声明伪目标
.PHONY: all clean