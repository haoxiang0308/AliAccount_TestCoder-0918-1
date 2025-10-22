#!/bin/bash

# 脚本：检查系统内存使用情况
# 作者：Assistant
# 日期：$(date)

echo "系统内存使用情况报告"
echo "====================="
echo "报告生成时间: $(date)"
echo ""

# 使用free命令获取内存信息
echo "内存使用详情:"
free -h
echo ""

# 显示内存使用百分比
echo "内存使用百分比:"
MEM_TOTAL=$(free | awk 'NR==2{print $2}')
MEM_USED=$(free | awk 'NR==2{print $3}')
MEM_PERCENTAGE=$(awk "BEGIN {printf \"%.2f\", $MEM_USED*100/$MEM_TOTAL}")
echo "内存使用率: $MEM_PERCENTAGE%"

echo ""
echo "详细内存信息:"
cat /proc/meminfo | grep -E "MemTotal|MemFree|MemAvailable|Buffers|Cached"

echo ""
echo "完成内存检查报告"