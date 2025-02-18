# Указываем базовый образ
FROM python:3.12

# Устанавливаем рабочую директорию в контейнере
WORKDIR /app

# Копируем файл с зависимостями и устанавливаем их
COPY requirements.txt ./
RUN pip install -r requirements.txt

# Копируем остальные файлы проекта в контейнер
COPY . .

# Открываем порт 8000 для взаимодействия с приложением
EXPOSE 8000

# Определяем команду для запуска приложения
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
# FROM python:3.12
#
# WORKDIR /app
#
# RUN apt-get update \
#     && apt-get install -y gcc libpq-dev \
#     && apt-get clean \
#     && rm -rf /var/lib/apt/lists/*
#
# COPY requirements.txt ./
# RUN pip install --no-cache-dir -r requirements.txt
#
# COPY . .
#
# RUN mkdir -p /app/staticfiles && chmod -R 755 /app/staticfiles
#
# EXPOSE 8000
#
# CMD ["sh", "-c", "python manage.py collectstatic --noinput && gunicorn config.wsgi:application --bind 0.0.0.0:8000"]
# # CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
