#!/bin/bash

# Определяем путь к текущему скрипту
SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)

# Путь к вашему скрипту
SCRIPT_PATH="$SCRIPT_DIR/close_nonwork_apps.sh"

# Выполнение основного скрипта
while true; do
  "$SCRIPT_PATH"
  sleep 300 # Интервал в 5 минут
done
