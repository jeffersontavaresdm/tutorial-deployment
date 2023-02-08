#!/bin/bash

# Script para ser utilizado dentro da máquina cloud para baixar a imagem do registry (Docker Hub) e rodar.

# Instalar o Docker na instância usando o comando abaixo:
sudo apt-get update
sudo apt-get install -y docker.io

# Baixar a imagem "nome-do-usuário/repositorio" usando o comando docker pull:
sudo docker pull jeffersontdm/deploy-app-aws-ec2

# Iniciar uma instância do container Docker com a imagem "nome-do-usuário/repositorio"
# e configurar para escutar na porta 9000
sudo docker run -p 9000:80 jeffersontdm/deploy-app-aws-ec2