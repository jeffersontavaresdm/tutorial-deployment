#!/bin/bash

# Script para ser utilizado dentro da máquina cloud para baixar a imagem do registry (Docker Hub) e rodar.

# Instalar o Docker na instância usando o comando abaixo:
sudo apt-get update
sudo apt-get install -y docker.io

# Baixar a imagem "nome-do-usuario/nome-da-imagem" usando o comando docker pull:
sudo docker pull nome-do-usuario/nome-da-imagem

# Iniciar uma instância do container Docker com a imagem "nome-do-usuario/nome-da-imagem"
# e configurar para escutar na porta 80
sudo docker run -p 80:80 nome-do-usuario/nome-da-imagem
