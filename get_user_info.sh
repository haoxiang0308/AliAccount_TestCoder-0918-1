#!/bin/bash

# 获取当前用户名
USERNAME=$(whoami)

# 获取用户ID
USER_ID=$(id -u)

# 获取组ID
GROUP_ID=$(id -g)

# 获取主目录
HOME_DIR=$(echo $HOME)

# 获取当前Shell
USER_SHELL=$(echo $SHELL)

# 创建随机文件名
RANDOM_FILENAME="user_info_$(date +%s%N | cut -b10-19).sh"

# 将信息写入随机命名的文件
cat << EOF > "$RANDOM_FILENAME"
# Generated User Info
USERNAME=$USERNAME
USER_ID=$USER_ID
GROUP_ID=$GROUP_ID
HOME_DIR=$HOME_DIR
USER_SHELL=$USER_SHELL
EOF

echo "当前用户信息已保存到文件: $RANDOM_FILENAME"