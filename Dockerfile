FROM python:3.12.2-slim

# Установка рабочей директории в контейнере
WORKDIR /app

# Копирование файлов в контейнер
COPY . /app

# Установка зависимостей
RUN pip install --no-cache-dir flask

# Открытие порта 5000
EXPOSE 5000

# Команда для запуска приложения
CMD ["python", "main.py"]
