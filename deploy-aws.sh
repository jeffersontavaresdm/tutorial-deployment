#!/bin/bash

# Script para ser utilizado dentro da máquina cloud para baixar a imagem do registry (Docker Hub) e rodar.

# Instalar o Docker na instância usando o comando abaixo:
sudo apt-get update
sudo apt-get install -y docker.io

# Baixar a imagem "repositorio/nome-da-imagem" usando o comando docker pull:
sudo docker pull repositorio/nome-da-imagem

# Iniciar uma instância do container Docker com a imagem "repositorio/nome-da-imagem"
# e configurar para escutar na porta 9000
sudo docker run -p 80:80 repositorio/nome-da-imagem