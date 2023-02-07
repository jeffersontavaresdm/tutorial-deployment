#!/bin/bash

# Instalar o Docker na instância usando o comando abaixo:
sudo apt-get update
sudo apt-get install -y docker.io

# Baixar a imagem "nome-do-usuário/repositorio" usando o comando docker pull:
sudo docker pull jeffersontdm/deploy-test

# Iniciar uma instância do container Docker com a imagem "nome-do-usuário/repositorio"
# e configurar para escutar na porta 9000:
sudo docker run -p 9000:80 jeffersontdm/deploy-test
