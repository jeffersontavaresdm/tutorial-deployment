#!/bin/bash

# Configurar o gcloud para usar a conta de usuário e o projeto corretos
gcloud config set account jeffersontavares1611@gmail.com
gcloud config set project jeffersontdm-tests

# Remove os diretórios "node_modules" e "build" no ambiente de build.
rm -rf node_modules build

# Limpa o cache do npm, que armazena pacotes usados em projetos para que possam ser reutilizados sem precisar ser baixados novamente.
#
# O argumento "--force" é usado para forçar a limpeza do cache, mesmo que tenham pacotes que não possam ser baixados novamente.
npm cache clean --force

# Instala as dependências do projeto listadas no arquivo package.json na máquina local.
npm install

# Executa o script de construção da aplicação, compilando o código fonte na máquina local.
npm run build

# Autenticar com a conta de serviço do Google Cloud
gcloud auth configure-docker

# Constroi uma imagem Docker a partir dos arquivos atuais do diretório corrente (.).
#
# A opção -t especifica o nome da imagem e a imagem será nomeada como "deploy-app-aws-ec2".
#
# O ponto no final indica que a construção da imagem será feita a partir dos arquivos no diretório atual.
docker build -t gcr.io/jeffersontdm-tests/deploy-app-gcr:latest ./

# Publicar a imagem no GCR (Google Container Registry)
docker push gcr.io/jeffersontdm-tests/deploy-app-gcr:latest

# Este comando é usado para fazer o deploy de uma aplicação na nuvem usando o Google Cloud Run.
#
# Ele executa os seguintes passos:
#
# "gcloud run deploy deployment-test" - Especifica que você está fazendo um deploy de uma aplicação chamada "deployment-test".
#
# "--image gcr.io/jeffersontdm-tests/deploy-app-gcr" - Especifica a imagem Docker que será usada para o deploy.
# A imagem está armazenada no Google Container Registry (gcr.io) e o nome da imagem é "deploy-app-gcr".
#
# "--platform managed" - Especifica que a plataforma que você está usando é gerenciada pelo Google Cloud,
# o que significa que você não precisa se preocupar com a infraestrutura subjacente.
#
# "--memory 128Mi" - Especifica a quantidade de memória que será alocada para a aplicação. Neste caso, é 128 MB.
#
# "--cpu 1" - Especifica a quantidade de CPU que será alocada para a aplicação. Neste caso, é 1 CPU.
#
# "--concurrency 1" - Especifica o número máximo de requisições simultâneas que a aplicação pode lidar. Neste caso, é 1 requisição.
#
# "--port 80" - Especifica a porta na qual a aplicação será acessada. Neste caso, é a porta 80.
#
# "--region us-central1" - Especifica a região onde a aplicação será executada. Neste caso, é a região central dos EUA.
#
# "--allow-unauthenticated" - Especifica que a aplicação pode ser acessada por usuários não autenticados.
# Isso significa que qualquer pessoa na internet pode acessar a aplicação sem precisar de uma conta do Google.
gcloud run deploy deployment-test \
  --image gcr.io/jeffersontdm-tests/deploy-app-gcr \
  --platform managed \
  --memory 128Mi \
  --cpu 1 \
  --concurrency 1 \
  --port 80 \
  --region us-central1 \
  --allow-unauthenticated