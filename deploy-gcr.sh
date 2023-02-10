#!/bin/bash

# Para rodar este script, é necessário ter as seguintes ferramentas instaladas no seu sistema:
#
# ∙ gcloud (Google Cloud SDK)
# ∙ Docker
# ∙ npm (Node Package Manager)
#
# Além disso, você também precisa estar logado em sua conta do Google Cloud e ter acesso a um projeto no Google Cloud.
#
# Se não tem a SDK instalada e/ou não tem um projeto no Google Cloud, siga estes passos:
#
# ∙ Instale a SDK do Google Cloud: Siga as instruções para instalar a SDK em "https://cloud.google.com/sdk/docs/install".
# ∙ Inicie sessão na sua conta do Google Cloud: Execute o seguinte comando no terminal: gcloud auth login
# ∙ Crie o projetono Google Cloud: gcloud projects create nome-do-projeto
#
# Depois de garantir que você possui todas as ferramentas necessárias,
# basta rodar o script no terminal ou no console do seu sistema operacional.

# PS: Não esquecer de trocar [seu_email@email.com] pelo seu email e [PROJECT_ID] pelo id do projeto.

# Configurar o gcloud para usar a conta de usuário e o projeto corretos
gcloud config set account seu_email@email.com
gcloud config set project PROJECT_ID

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

# Constroi uma imagem Docker a partir dos arquivos atuais do diretório corrente (./).
#
# A opção -t especifica o nome da imagem e a imagem será nomeada como "nome-da-imagem".
#
# O ponto no final indica que a construção da imagem será feita a partir dos arquivos no diretório atual.
docker build -t gcr.io/PROJECT_ID/nome-da-imagem:latest ./

# Publicar a imagem no GCR (Google Container Registry)
docker push gcr.io/PROJECT_ID/nome-da-imagem:latest

# Este comando é usado para fazer o deploy de uma aplicação na nuvem usando o Google Cloud Run.
#
# Ele executa os seguintes passos:
#
# "gcloud run deploy deployment-test" - Especifica que você está fazendo um deploy de uma aplicação chamada "deployment-test".
#
# "--image gcr.io/PROJECT_ID/nome-da-imagem" - Especifica a imagem Docker que será usada para o deploy.
# A imagem está armazenada no GCR, ou Google Container Registry (gcr.io) e o nome da imagem é "nome-da-imagem".
#
# "--platform managed" - Especifica que a plataforma que você está usando é gerenciada pelo Google Cloud,
# o que significa que você não precisa se preocupar com a infraestrutura subjacente.
#
# "--memory 128Mi" - Especifica a quantidade de memória que será alocada para a aplicação. Neste caso, é 128 MB.
#
# "--cpu 1" - Especifica a quantidade de CPU que será alocada para a aplicação. Neste caso, é 1 CPU.
#
# "--concurrency 1" - Especifica o número máximo de requisições simultâneas que a aplicação pode lidar.
# Neste caso, é 1 requisição.
#
# "--port 80" - Especifica a porta na qual a aplicação será acessada. Neste caso, é a porta 80.
# PS: Verificar se arquivo Dockerfile esta explicitando que a porta exposta será 80.
#
# "--region us-central1" - Especifica a região onde a aplicação será executada. Neste caso, é a região central dos EUA.
#
# "--allow-unauthenticated" - Especifica que a aplicação pode ser acessada por usuários não autenticados.
# Isso significa que qualquer pessoa na internet pode acessar a aplicação sem precisar de uma conta do Google.
#
# comando:
gcloud run deploy deployment-test \
  --image gcr.io/jeffersontdm-tests/deploy-app-gcr \
  --platform managed \
  --memory 128Mi \
  --cpu 1 \
  --concurrency 1 \
  --port 80 \
  --region us-central1 \
  --allow-unauthenticated
