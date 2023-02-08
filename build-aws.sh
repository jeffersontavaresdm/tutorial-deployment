#!/bin/bash

# Script para ser utilizado na máquina local para a criação da imagem e armazenar a mesma em um registry (Docker Hub).

# Instala as dependências do projeto, listadas no arquivo package.json.
npm install

# Executa o script de construção da aplicação, compilando o código fonte para produção.
npm run build

# Constroi uma imagem Docker a partir dos arquivos atuais do diretório corrente (.).
#
# A opção -t especifica o nome da imagem e a imagem será nomeada como "deploy-app-aws-ec2".
#
# O ponto no final indica que a construção da imagem será feita a partir dos arquivos no diretório atual.
docker build -t deploy-app-aws-ec2 ./

# Adiciona uma nova tag à imagem "deploy-app-aws-ec2" que foi construída na etapa anterior.
#
# A nova tag é "jeffersontdm/deploy-app-aws-ec2",
# que especifica o nome do repositório e o nome da imagem na plataforma Docker Hub.
docker tag deploy-app-aws-ec2:latest jeffersontdm/deploy-app-aws-ec2

# Envia a imagem tagada para o Docker Hub, fazendo com que a imagem esteja disponível para ser baixada em outros locais.
#
# A tag "latest" especifica que esta é a versão mais recente da imagem.
docker push jeffersontdm/deploy-app-aws-ec2:latest