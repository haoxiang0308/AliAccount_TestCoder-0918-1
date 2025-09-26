#!/bin/bash

# 生成一个随机的十六进制字符串作为文件名后缀
random_suffix=$(openssl rand -hex 8)

# 定义输出文件名
output_file="/workspace/memory_usage_${random_suffix}.txt"

# 获取内存使用情况并保存到文件
free -h > "$output_file"

# 输出确认信息
echo "Memory usage information saved to: $output_file"
