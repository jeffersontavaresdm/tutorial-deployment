#!/bin/bash

# Configurar o gcloud para usar a conta de usuário e o projeto corretos
gcloud config set account jeffersontavares1611@gmail.com
gcloud config set project green-network-375919

# Build e enviar o contêiner para o Google Container Registry
gcloud builds submit --tag gcr.io/green-network-375919/deploy-app-gcr .

# Publicar a imagem do Docker Hub (jeffersontdm/deploy-app-aws-ec2) no GCR (Google Cloud Registry).
docker tag deploy-app-gcr gcr.io/green-network-375919/deploy-app-gcr
gcloud docker -- push gcr.io/green-network-375919/deploy-app-gcr

# Criar um novo serviço no Google Cloud Run
#
# Especificar o nome do serviço (opcional) e a quantidade de recursos que o serviço deve usar
gcloud run deploy deployment-test \
  --image gcr.io/green-network-375919/deploy-app-gcr \
  --platform managed \
  --memory 256Mi \
  --cpu 1 \
  --concurrency 1
