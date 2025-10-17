#!/bin/bash
# 获取当前用户信息并显示

echo "当前用户名: $(whoami)"
echo "用户ID: $(id -u)"
echo "用户组ID: $(id -g)"
echo "家目录: $HOME"
echo "当前Shell: $SHELL"
echo "主机名: $(hostname)"
echo "当前时间: $(date)"