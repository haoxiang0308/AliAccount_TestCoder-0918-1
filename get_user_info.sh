#!/bin/bash

# 获取当前用户信息的bash脚本

echo "==================== 用户信息 ===================="
# 获取当前用户名
echo "当前用户: $(whoami)"

# 获取用户ID和组ID
echo "用户ID (UID): $(id -u)"
echo "组ID (GID): $(id -g)"

# 获取用户的完整ID信息
echo "用户和组信息: $(id)"

# 获取用户所属的所有组
echo "用户所属的组: $(groups)"

# 获取当前用户的主目录
echo "主目录: $HOME"

# 获取当前工作目录
echo "当前工作目录: $(pwd)"

# 获取shell信息
echo "登录Shell: $SHELL"

# 获取用户环境变量
echo "用户: $USER"
echo "日志名: $LOGNAME"
echo "主机名: $HOSTNAME"

echo "==================== 系统信息 ===================="
# 获取系统信息
echo "系统时间: $(date)"
echo "系统运行时间: $(uptime)"

echo "==================== 脚本执行完成 ===================="