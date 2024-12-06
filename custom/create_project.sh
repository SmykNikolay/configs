#!/bin/bash

# Цвета для вывода
GREEN='\033[1;32m'
BLUE='\033[1;34m'
RED='\033[1;31m'
NC='\033[0m' # No Color

# Функция для создания нового проекта
create_project() {
  # Получаем текущую дату в нужном формате
  current_date=$(date +%Y-%m-%d)
  project_name="test-project-$current_date"

  # Путь назначения
  dest_path="/Users/nikolajsmyk/Documents/GitHub/$project_name"

  # Клонируем репозиторий
  echo -e "${BLUE}➜ Клонирование репозитория...${NC}"
  if ! git clone https://github.com/SmykNikolay/inits.git "$dest_path"; then
    echo -e "${RED}✖ Ошибка при клонировании репозитория${NC}"
    return 1
  fi

  # Переходим в директорию проекта
  if ! cd "$dest_path"; then
    echo -e "${RED}✖ Ошибка при переходе в директорию проекта${NC}"
    return 1
  fi

  # Удаляем .git директорию
  echo -e "${BLUE}➜ Удаление .git директории...${NC}"
  rm -rf .git

  # Устанавливаем зависимости
  echo -e "${BLUE}➜ Установка зависимостей...${NC}"
  if ! npm ci; then
    echo -e "${RED}✖ Ошибка при установке зависимостей${NC}"
    return 1
  fi

  echo -e "${GREEN}✔ Проект успешно создан в ${dest_path}${NC}"
  echo -e "${GREEN}✔ Мы в директории проекта: $(pwd)${NC}"
}

# Функция для показа меню
show_menu() {
  echo -e "${BLUE}Выберите тип проекта:${NC}"
  echo -e "${GREEN}1) React${NC}"
  echo -e "${GREEN}2) Node.js${NC}"
  echo -e "${GREEN}3) TypeScript${NC}"
  echo -e "${RED}q) Выход${NC}"

  read -p "Ваш выбор: " choice

  case $choice in
  1)
    echo -e "${BLUE}➜ Создание React проекта...${NC}"
    create_project
    ;;
  2)
    echo -e "${BLUE}➜ Создание Node.js проекта...${NC}"
    create_project
    ;;
  3)
    echo -e "${BLUE}➜ Создание TypeScript проекта...${NC}"
    create_project
    ;;
  q)
    exit 0
    ;;
  *)
    echo -e "${RED}✖ Неверный выбор${NC}"
    show_menu
    ;;
  esac
}

# Основная логика
if [ "$1" = "new" ]; then
  show_menu
else
  echo -e "${RED}Используйте команду 'new' для создания проекта${NC}"
fi
