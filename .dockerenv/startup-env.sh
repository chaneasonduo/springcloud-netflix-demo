#!/bin/bash
echo $SHELL
# 封装成函数，获取项目路径
get_project_path() {
    # 获取脚本的绝对路径
    local SCRIPT_PATH=$(readlink -f "$0")
    # 获取脚本的父路径（项目路径）
    local PROJECT_PATH=$(dirname $(dirname "$SCRIPT_PATH"))
    # 输出项目路径，或者你可以选择不输出，而是直接返回路径
    echo "$PROJECT_PATH"
}

# 调用函数获取项目路径，并赋值给变量
PROJECT_PATH=$(get_project_path)

# 输出项目路径
echo "project path: $PROJECT_PATH"

cd $PROJECT_PATH || exit

echo "pwd: $(pwd)"

docker compose -f .dockerenv/docker-compose.all.yml up -d