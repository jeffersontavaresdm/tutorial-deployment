#!/bin/bash

# Script para ser utilizado na máquina local para a criação da imagem e armazenar a mesma em um registry (Docker Hub).

# Remove os diretórios "node_modules" e "build" no ambiente de build.
rm -rf node_modules build

# Limpa o cache do npm, que armazena pacotes usados em projetos para que possam ser reutilizados sem precisar ser baixados novamente.
#
# O argumento "--force" é usado para forçar a limpeza do cache, mesmo que tenham pacotes que não possam ser baixados novamente.
npm cache clean --force

# Instala as dependências do projeto, listadas no arquivo package.json.
npm install

# Executa o script de construção da aplicação, compilando o código fonte para produção.
npm run build

# Constroi uma imagem Docker a partir dos arquivos atuais do diretório corrente (.).
#
# A opção -t especifica o nome da imagem e a imagem será nomeada como "deploy-app-aws-ec2".
#
# O ponto no final indica que a construção da imagem será feita a partir dos arquivos no diretório atual.
docker build -t nome-da-imagem ./

# Adiciona uma nova tag à imagem "deploy-app-gcr" que foi construída na etapa anterior.
#
# A nova tag é "repositorio/nome-da-imagem",
# que especifica o nome do repositório e o nome da imagem na plataforma Docker Hub.
docker tag nome-da-imagem:latest repositorio/nome-da-imagem

# Envia a imagem tagada para o Docker Hub, fazendo com que a imagem esteja disponível para ser baixada em outros locais.
#
# A tag "latest" especifica que esta é a versão mais recente da imagem.
docker push repositorio/nome-da-imagem:latest
