# 编译目标
compile:
	@echo "Compiling..."
	# 这里可以添加实际的编译命令，例如:
	# gcc -o myprogram main.c

# 清理目标
clean:
	@echo "Cleaning..."
	# 这里可以添加实际的清理命令，例如:
	# rm -f myprogram *.o

# 默认目标
.PHONY: compile clean