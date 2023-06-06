#!/bin/bash
echo "Cual es el commit?"
read COMMIT
app=verne
ENVIRONMENT=qa
ACCOUNT=447289873151
PROFILE=verne-qa
#SERVICE=buho-dev-ecs-00-app-verne
#CLUSTER=buho-qa-ecs-00-app
echo "ECR login ..."
aws ecr --profile $PROFILE get-login-password --region us-east-1 | docker login --username AWS --password-stdin $ACCOUNT.dkr.ecr.us-east-1.amazonaws.com
#echo "docker rmi $app ..."
#docker rmi -f crosscore-sandbox-repo-$app-ecr-00:latest
echo "docker build ..."
#docker build --build-arg CONTEXT_PATH=$app -t crosscore-sandbox-repo-$app-ecr-00 .
docker build -t buho-$ENVIRONMENT-repo-verne-ecr-00:$COMMIT .
echo "docker tag ...."
#docker tag crosscore-sandbox-repo-$app-ecr-00:latest 036227184419.dkr.ecr.us-east-1.amazonaws.com/crosscore-sandbox-repo-$app-ecr-00:latest
docker tag buho-$ENVIRONMENT-repo-verne-ecr-00:$COMMIT $ACCOUNT.dkr.ecr.us-east-1.amazonaws.com/buho-$ENVIRONMENT-repo-verne-ecr-00:$COMMIT
echo "docker push ...."
docker push $ACCOUNT.dkr.ecr.us-east-1.amazonaws.com/buho-$ENVIRONMENT-repo-verne-ecr-00:$COMMIT
echo "docker push finish!!"
echo "Service update deployment..."
#aws --profile experian-sandbox ecs update-service --service crosscore-sandbox-service-$app-ecs-00 --cluster crosscore-sandbox-cluster-SentiEmp-ecs-00 --force-new-deployment
echo "Update complete, time Seconds: $SECONDS!!"




## Obtener el arn del task definition actual
#TASK_DEFINITION_ARN=$(aws --profile $PROFILE ecs describe-services \
#  --cluster $CLUSTER \
#  --services $SERVICE \
#  --query "services[0].taskDefinition" \
#  --output text)
#
## Obtener la definición de tarea actual
#TASK_DEFINITION=$(aws --profile $PROFILE ecs describe-task-definition \
#  --task-definition $TASK_DEFINITION_ARN)
#
## Crear una nueva definición de tarea con una nueva etiqueta de imagen
#NEW_TASK_DEFINITION=$(echo $TASK_DEFINITION | jq '.containerDefinitions[0].image="buho-dev-repo-verne-ecr-00:$COMMIT"' | jq '.family="buho-dev-ecstaskdef-00-app-verne"')
#
## Registrar la nueva definición de tarea
#REGISTER_TASK_DEFINITION_OUTPUT=$(aws --profile $PROFILE ecs register-task-definition --cli-input-json "$NEW_TASK_DEFINITION")
#
## Obtener el número de revisión de la nueva definición de tarea
#NEW_TASK_DEFINITION_REVISION=$(echo $REGISTER_TASK_DEFINITION_OUTPUT | jq '.taskDefinition.revision')
#
## Actualizar el servicio con la nueva definición de tarea
#UPDATE_SERVICE_OUTPUT=$(aws --profile $PROFILE ecs update-service \
#  --cluster $CLUSTER \
#  --service $SERVICE \
#  --task-definition buho-dev-ecstaskdef-00-app-verne:$NEW_TASK_DEFINITION_REVISION)
