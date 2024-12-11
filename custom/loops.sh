#!/bin/bash

# Определяем путь к текущему скрипту
SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)

# Путь к вашему скрипту
SCRIPT_PATH="$SCRIPT_DIR/close_nonwork_apps.sh"

# Выполнение основного скрипта
while true; do
  echo "Открытые приложения: "
  osascript -e 'tell application "System Events" to get name of every application process whose background only is false'
  echo ""
  "$SCRIPT_PATH"
  sleep 300 # Интервал в 5 минут
done
