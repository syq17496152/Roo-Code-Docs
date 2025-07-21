#!/bin/bash

# Docusaurus Docker 容器管理脚本
# 使用方法: ./manage_docusaurus.sh [update|start|restart|stop|status]

# 项目目录
PROJECT_DIR=$(dirname "$(realpath "$0")")

# 容器名称
CONTAINER_NAME="docusaurus"

# 检查命令行参数
if [ $# -eq 0 ]; then
    echo "错误: 请指定操作 [update|start|restart|stop|status]"
    exit 1
fi

# 执行指定的操作
case "$1" in
    update)
        echo "正在更新 Docusaurus 容器..."
        cd "$PROJECT_DIR" || exit
        docker-compose pull
        docker-compose up -d --build
        echo "更新完成！"
        ;;
    start)
        echo "正在启动 Docusaurus 容器..."
        cd "$PROJECT_DIR" || exit
        docker-compose up -d
        echo "容器已启动！"
        ;;
    restart)
        echo "正在重启 Docusaurus 容器..."
        cd "$PROJECT_DIR" || exit
        docker-compose restart
        echo "容器已重启！"
        ;;
    stop)
        echo "正在停止 Docusaurus 容器..."
        cd "$PROJECT_DIR" || exit
        docker-compose stop
        echo "容器已停止！"
        ;;
    status)
        echo "Docusaurus 容器状态:"
        docker ps -a | grep "$CONTAINER_NAME"
        ;;
    *)
        echo "错误: 未知操作 '$1'"
        echo "可用操作: update, start, restart, stop, status"
        exit 1
        ;;
esac

# 显示容器日志的最后几行
if [ "$1" = "start" ] || [ "$1" = "restart" ] || [ "$1" = "update" ]; then
    echo -e "\n容器日志最后几行:"
    docker logs "$CONTAINER_NAME" --tail 10
fi