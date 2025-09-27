#!/bin/bash

# 检查系统内存使用情况的脚本

# 获取总内存、已用内存和可用内存（以KB为单位）
total_mem=$(free -k | awk 'NR==2{print $2}')
used_mem=$(free -k | awk 'NR==2{print $3}')
available_mem=$(free -k | awk 'NR==2{print $4}')

# 计算内存使用率
mem_usage_percent=$(awk "BEGIN {printf \"%.2f\", $used_mem*100/$total_mem}")

# 显示内存信息
echo "系统内存使用情况报告"
echo "----------------------"
echo "总内存: $((total_mem / 1024)) MB"
echo "已用内存: $((used_mem / 1024)) MB"
echo "可用内存: $((available_mem / 1024)) MB"
echo "内存使用率: ${mem_usage_percent}%"
echo "----------------------"

# 根据内存使用率给出警告
if (( $(echo "$mem_usage_percent > 80" | bc -l) )); then
    echo "警告: 内存使用率超过 80%！"
elif (( $(echo "$mem_usage_percent > 60" | bc -l) )); then
    echo "注意: 内存使用率超过 60%。"
else
    echo "内存使用情况正常。"
fi