#!/bin/bash

# Рабочее время
START_HOUR=9 # Начало рабочего дня (например, 9 утра)
END_HOUR=18  # Конец рабочего дня (например, 6 вечера)

# Список приложений для закрытия
APPS_TO_CLOSE=("YouTube" "Spotify" "Yandex")

# Получаем текущее время
current_hour=$(date +"%H")

# Проверяем, является ли текущее время рабочим
if ((current_hour >= START_HOUR && current_hour < END_HOUR)); then
  echo "Рабочее время. Проверяем запущенные приложения..."

  # Получаем список активных приложений
  running_apps=$(osascript -e 'tell application "System Events" to get name of every application process whose background only is false')

  # Закрываем приложения из списка
  for app in "${APPS_TO_CLOSE[@]}"; do
    if [[ $running_apps == *"$app"* ]]; then
      echo "Закрываем приложение: $app"
      osascript -e "tell application \"$app\" to quit" 2>/dev/null
    fi
  done
else
  echo "Не рабочее время. Скрипт завершён."
fi
