#!/bin/bash

# 获取当前用户信息
echo "获取当前用户信息..."
echo "用户名: $(whoami)"
echo "用户ID: $(id -u)"
echo "组ID: $(id -g)"
echo "用户组: $(id -Gn)"
echo "主目录: $HOME"
echo "当前Shell: $SHELL"
echo "主机名: $(hostname)"
echo "当前时间: $(date)"

# 生成随机文件名
random_filename="user_info_$(date +%s)_$((RANDOM)).txt"

# 将用户信息保存到随机命名的文件中
{
    echo "用户信息报告"
    echo "============="
    echo "用户名: $(whoami)"
    echo "用户ID: $(id -u)"
    echo "组ID: $(id -g)"
    echo "用户组: $(id -Gn)"
    echo "主目录: $HOME"
    echo "当前Shell: $SHELL"
    echo "主机名: $(hostname)"
    echo "当前时间: $(date)"
} > "$random_filename"

echo "用户信息已保存到文件: $random_filename"