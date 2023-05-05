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
npm run dev
````
Acceso a la aplicación
````bash
http://localhost:5173/
````


### Desplegar

#### generar ejecutable

npm run build


enviar ejecutable a S3 

aws s3 sync dist/ s3://buho-dev-s3-00-front-end-verne

aws s3 --profile devops sync dist/ s3://buho-dev-s3-00-front-end-verne


purgar cache de cloudfront

aws cloudfront create-invalidation --distribution-id EF5KYFJMUYR3Z --paths "/*"

aws cloudfront --profile devops  create-invalidation --distribution-id EF5KYFJMUYR3Z --paths "/*"