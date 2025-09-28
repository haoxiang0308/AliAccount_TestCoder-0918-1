#!/bin/bash

set -e # Выход при ошибке

echo "Проверка наличия Julia..."
if command -v julia &> /dev/null; then
    echo "Julia уже установлена. Версия: $(julia --version)"
    julia /workspace/quadratic_solver.jl
    exit 0
fi

echo "Julia не найдена, начинаю установку..."

# Попытка установки через apt
if apt update && apt install -y julia; then
    echo "Julia успешно установлена через apt."
    julia /workspace/quadratic_solver.jl
    exit 0
else
    echo "Установка через apt не удалась. Устанавливаю вручную..."
fi

# Установка вручную
JULIA_VERSION="1.10.5"
JULIA_ARCH="x86_64"
JULIA_URL="https://julialang-s3.julialang.org/bin/linux/${JULIA_ARCH}/${JULIA_VERSION%.*}/julia-${JULIA_VERSION}-linux-${JULIA_ARCH}.tar.gz"
INSTALL_DIR="/opt/julia"

echo "Скачивание Julia из $JULIA_URL"
mkdir -p /tmp/julia_install
cd /tmp/julia_install
wget "$JULIA_URL"
tar -xzf "julia-${JULIA_VERSION}-linux-${JULIA_ARCH}.tar.gz"

echo "Установка Julia в $INSTALL_DIR"
mkdir -p "$INSTALL_DIR"
cp -r "julia-${JULIA_VERSION}"/* "$INSTALL_DIR/"

echo "Создание символической ссылки"
ln -sf "$INSTALL_DIR/bin/julia" /usr/local/bin/julia

echo "Установка завершена. Проверка версии..."
julia --version

echo "Выполнение файла Julia..."
julia /workspace/quadratic_solver.jl

# Очистка временных файлов
rm -rf /tmp/julia_install

echo "Готово."