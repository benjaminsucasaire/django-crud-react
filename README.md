# Proyecto Django Framework API Rest - React

Referencia: https://www.youtube.com/watch?v=38XWpyEK8IY&ab_channel=FaztCode

## Pre Requisitos

- Python 3.10 >=
- Node 16 >=


## Back-End

Iniciar Servidor
````bash
python manage.py runserver
````
Django API Rest
````bash
http://localhost:8000/tasks/api/v1/tasks/
````

Documentation de API Rest
````bash
http://localhost:8000/tasks/docs/
````

Panel de administración Django
````bash
http://localhost:8000/admin/
````
Credenciales:

- User: benjamin
- Password: benjamin


## Front-End

Iniciar Servidor
````bash
npm start
````
Acceso a la aplicación
````bash
http://localhost:3000/
````

### Opcional
#### Crear base de datos para el proyecto
puedes realizar estos pasasos si deseas migrar solo la estructura de la base de datos  desde django 

````bash
create database djangodbcrud;
````
#### migrar tablas a la base de datos desde python
````bash
python manage.py migrate
````
#### create superuser django (Opcional)
podemos crear un usuario para el panel administrativo de django
````bash
python manage.py createsuperuser
````

Crear requirements.txt
````bash
pip freeze > requirements.txt
````


### Desplegar Containers
docker compose -d up


### Build AWS S3 artefacto
npm run build