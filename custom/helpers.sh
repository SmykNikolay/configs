#!/bin/bash

# Цвета для вывода
GREEN='\033[1;32m'
BLUE='\033[1;34m'
RED='\033[1;31m'
NC='\033[0m' # No Color

# Путь к директории
DIR="$HOME/Documents/notes"
# Проверяем, существует ли директория
if [ ! -d "$DIR" ]; then
  echo -e "${RED}Директория $DIR не найдена!${NC}"
  exit 1
fi

# Переходим в директорию
cd "$DIR" || exit

# Получаем список папок
FOLDERS=($(ls -d */))

# Проверяем, есть ли папки
if [ ${#FOLDERS[@]} -eq 0 ]; then
  echo -e "${RED}В директории $DIR нет папок!${NC}"
  exit 1
fi

# Выводим список папок
echo -e "\n${BLUE}Выберите папку из списка:${NC}"
for i in "${!FOLDERS[@]}"; do
  echo -e "${GREEN}$((i + 1))) ${FOLDERS[$i]%/}${NC}"
done

# Ждем ввода от пользователя
echo -n "Введите номер папки (или 0 для выхода): "
read -r FOLDER_CHOICE

# Проверяем, если пользователь хочет выйти
if [[ "$FOLDER_CHOICE" -eq 0 ]]; then
  echo -e "${BLUE}Выход из программы.${NC}"
  exit 0
fi

# Проверяем, что выбор корректен
if [[ "$FOLDER_CHOICE" -lt 1 || "$FOLDER_CHOICE" -gt ${#FOLDERS[@]} ]]; then
  echo -e "${RED}Некорректный выбор! Попробуйте снова.${NC}"
  exit 1
fi

# Получаем имя выбранной папки
SELECTED_FOLDER="${FOLDERS[$((FOLDER_CHOICE - 1))]}"

# Переходим в выбранную папку
cd "$DIR/$SELECTED_FOLDER" || exit

# Получаем список файлов с расширением .md
FILES=($(ls | grep '\.md$'))

# Проверяем, есть ли файлы
if [ ${#FILES[@]} -eq 0 ]; then
  echo -e "${RED}В папке $SELECTED_FOLDER нет файлов с расширением .md!${NC}"
  exit 1
fi

# Основной цикл
while true; do
  # Выводим список файлов без расширения .md
  echo -e "\n${BLUE}Выберите файл из списка:${NC}"
  for i in "${!FILES[@]}"; do
    FILENAME="${FILES[$i]%.md}" # Убираем расширение .md
    echo -e "${GREEN}$((i + 1))) ${FILENAME}${NC}"
  done

  # Ждем ввода от пользователя
  echo -n "Введите номер файла (или 0 для выхода): "
  read -r CHOICE

  # Проверяем, если пользователь хочет выйти
  if [[ "$CHOICE" -eq 0 ]]; then
    echo -e "${BLUE}Выход из программы.${NC}"
    break
  fi

  # Проверяем, что выбор корректен
  if [[ "$CHOICE" -lt 1 || "$CHOICE" -gt ${#FILES[@]} ]]; then
    echo -e "${RED}Некорректный выбор! Попробуйте снова.${NC}"
    continue
  fi

  # Получаем имя выбранного файла
  SELECTED_FILE="${FILES[$((CHOICE - 1))]}"

  # Показываем содержимое файла
  echo -e "\n${BLUE}Содержимое файла $SELECTED_FILE:${NC}"
  bat "$DIR/$SELECTED_FOLDER/$SELECTED_FILE"
done
