#!/bin/bash

# 生成随机命名的脚本文件

# 定义源脚本路径和输出目录
scriptPath="/workspace/get_user_info.sh"
outputDirectory="/workspace/"

# 检查源脚本是否存在
if [ ! -f "$scriptPath" ]; then
    echo "错误: 源脚本文件不存在: $scriptPath"
    exit 1
fi

# 生成随机文件名
randomName=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 10 | head -n 1)
randomFileName="user_info_$randomName.sh"
outputPath="$outputDirectory$randomFileName"

# 复制脚本到新文件
cp "$scriptPath" "$outputPath"

# 给新文件添加执行权限
chmod +x "$outputPath"

echo "脚本已保存为随机命名的文件: $outputPath"