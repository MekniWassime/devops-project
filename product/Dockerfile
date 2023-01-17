FROM python:3.10-alpine3.17
#install peotry for dependency management
RUN pip install poetry
#we will copy our app files under the /app folder
WORKDIR /app
#copy package files that contain depndancy list
COPY ./pyproject.toml [./poetry.lock] ./
#install dependencies
RUN poetry install
#copy project files
COPY . .
#disable debug features
ENV DEBUG=False
#manage migrations
RUN poetry run python manage.py makemigrations
RUN poetry run python manage.py makemigrations product_app
RUN poetry run python manage.py makemigrations shared_app
RUN poetry run python manage.py migrate
#run our python app inside of the poetry virtual environment
CMD ["poetry","run","python", "manage.py", "runserver", "0.0.0.0:8000"]