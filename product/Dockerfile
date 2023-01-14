FROM python:3.10-alpine3.17

WORKDIR /app/product

RUN pip install poetry

COPY ./pyproject.toml .
COPY ./poetry.lock .
COPY ./../shared_app ./..

RUN poetry install

COPY . .

CMD ["python", "manage.py", "runserver"]