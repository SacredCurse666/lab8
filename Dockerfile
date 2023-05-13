FROM python:3.9.13

LABEL maintainer="whatslow17@gmail.com"

WORKDIR /code

COPY ./requirements.txt /code/requirements.txt
COPY ./src /code/src
COPY ./alembic.ini /code/alembic.ini
COPY ./migrations /code/migrations

# Устанавливаем зависемости
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt


# Указываем команду, которая будет выполнена при запуске контейнера
CMD [ "gunicorn", "-w", "4", "-k", "uvicorn.workers.UvicornWorker", "-b", "0.0.0.0:8000", "src.main:app" ]


