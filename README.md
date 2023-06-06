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



#### desplegar en AWS ECR


aws ecr --profile devops get-login-password --region us-east-1 | docker login --username AWS --password-stdin 917972781642.dkr.ecr.us-east-1.amazonaws.com

docker build -t buho-dev-repo-verne-ecr-00 .


logearse en local
psql -h localhost -p 5432 -U djangocruduser  -d djangodbcrud
djangocrudpassword

sacar backup

pg_dump -h localhost -p 5432 -U djangocruduser -Fc -b -v -f djangodbcrud.sql -d djangodbcrud
djangocrudpassword


logarse en el rds

psql -h dbw-dev.bash.cloudstudio.cloud	-p 5432 -U masterauroradb -d verne
k0#Tx^!#yp_Q}+GM



psql -h dbw-dev.verne.bash.cloudstudio.cloud	-p 5432 -U masterauroradb -d verne

listar usuarios

\du

crear bd 
create database migrated_database;


evnviar archivo a s3 y descargqar



restaurar bd

pg_restore -v -h dbw-dev.bash.cloudstudio.cloud -U masterauroradb -d djangodbcrud -j 2 djangodbcrud.sql
k0#Tx^!#yp_Q}+GM



pg_dumpall -U djangocruduser -h localhost  -f djangodbcruduser-roles.sql --no-role-passwords -g
djangocrudpassword

restaurar roles user

psql -h dbw-dev.bash.cloudstudio.cloud -U masterauroradb -f djangodbcruduser-roles.sql
k0#Tx^!#yp_Q}+GM


psql -h <nombre de host> -U <nombre de usuario> -f <ubicación del archivo de volcado.sql>


ALTER USER djangocruduser WITH PASSWORD 'djangocrudpassword';
ALTER ROLE djangocruduser WITH SUPERUSER;



GRANT ALL PRIVILEGES ON DATABASE djangodbcrud TO djangocruduser;



pg_restore -v -h dbw-dev.bash.cloudstudio.cloud -U djangocruduser -d djangodbcrud -j 2 djangodbcrud.sql
k0#Tx^!#yp_Q}+GM

------------
lugo de un largo trabajo
primero entrar como super admin
crear los usuarios y asignar roles para aurora rds ojo

luego crea la db como el usuario que correspoinda
luego restaura la deb


---desplear front

npm run build
aws --profile verne-qa s3 sync dist/ s3://buho-qa-s3-00-front-end-verne/

#cambiar el ID
aws --profile verne-qa cloudfront create-invalidation --distribution-id EM3YNDEPGZQNG --paths "/*"



--- base de datos(FINAL)

psql -h dbw-qa.verne.bash.cloudstudio.cloud	-p 5432 -U masterauroradb -d verne
_x9bHI.clC+]F=oI

listar usuarios
\du

crear usuario

CREATE USER djangocruduser WITH PASSWORD 'djangocrudpassword';
ALTER USER djangocruduser CREATEDB;





psql -h dbw-qa.verne.bash.cloudstudio.cloud	-p 5432 -U djangocruduser -d verne
djangocrudpassword
crear bd 
create database djangodbcrud;

evnviar archivo a s3 y descargqar


restaurar bd

pg_restore -v -h dbw-qa.verne.bash.cloudstudio.cloud -U djangocruduser -d djangodbcrud -j 2 djangodbcrud.sql
djangocrudpassword


--emtrar a container

aws ecs execute-command --region us-east-1 --profile verne-qa --cluster buho-qa-ecs-00-app --task e70c7285c7244dac98258bdcbd611fd0 --container buho-qa-ecstaskdkr-00-app-verne	 --command "/bin/bash" --interactive

aws ecs execute-command --region us-west-2 --profile full-movil --cluster FULLM-0001-APP-AQ-ECS-00-APP --task 903bc434a00c4c018cabe45ffa2959c5Run --container FULLM-0001-APP-AQ-ECSTASKDKR-00-API	 --command "/bin/bash" --interactive
-------------------- 
--- base de datos(FINAL)

psql -h dbw-qa.verne.bash.cloudstudio.cloud	-p 5432 -U masterauroradb -d verne
_x9bHI.clC+]F=oI

listar usuarios
\du

crear usuario

CREATE USER produccion_database_clarity WITH PASSWORD 'PR4D5CC34N#B5H4$CL1R3TY%22';
ALTER USER produccion_database_clarity CREATEDB;





psql -h dbw-qa.verne.bash.cloudstudio.cloud	-p 5432 -U produccion_database_clarity -d verne
PR4D5CC34N#B5H4$CL1R3TY%22

crear bd 
create database mab_produccion;
create database verne_logis_pruebas;
create database verne_gasco;
create database verne2_produccion;
create database verne2_comfenalco;

evnviar archivo a s3 y descargqar


restaurar bd

psql -h dbw-qa.verne.bash.cloudstudio.cloud -U produccion_database_clarity -d mab_produccion -f mab.sql
psql -h dbw-qa.verne.bash.cloudstudio.cloud -U produccion_database_clarity -d verne_logis_pruebas -f logisfashion.sql
psql -h dbw-qa.verne.bash.cloudstudio.cloud -U produccion_database_clarity -d verne_gasco -f gasco.sql
psql -h dbw-qa.verne.bash.cloudstudio.cloud -U produccion_database_clarity -d verne2_produccion -f buho.sql
psql -h dbw-qa.verne.bash.cloudstudio.cloud -U produccion_database_clarity -d verne2_comfenalco -f comfenalco.sql
PR4D5CC34N#B5H4$CL1R3TY%22

