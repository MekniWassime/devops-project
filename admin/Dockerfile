FROM python:3.10-alpine3.17
#install peotry for dependency management
#we will copy our app files under the /app folder
WORKDIR /app
#copy package files that contain depndancy list
COPY ./admin .
#install dependencies

CMD ["./admin_django_manage.pex", "runserver", "0.0.0.0:8000"]