# Esta linha especifica a imagem base para construir uma imagem Docker a partir do Nginx na versão Alpine.
#
# A imagem Alpine é uma imagem de sistema operacional pequena e minimalista baseada em Linux,
# o que a torna uma boa opção para usar como imagem base em contêineres Docker devido ao seu tamanho pequeno.
#
# Esta linha diz ao Docker para usar a imagem Alpine do Nginx na versão mais atual como base para a imagem em construção.
FROM nginx:alpine

# Copie o arquivo de configuração personalizado para o servidor Nginx
COPY nginx.conf /etc/nginx/nginx.conf

# Define o diretório de trabalho como "/app"
WORKDIR /app

# Esta linha de comando "COPY" instrui o Docker a copiar o arquivo "package.json"
# do host para o diretório atual (indicado pelo ponto ".") do contêiner Docker.
# Isso significa que o arquivo será colocado na pasta raiz do contêiner, a partir da qual o resto do aplicativo pode acessá-lo.
COPY package.json .

# Este comando usa o comando apk para instalar o pacote nodejs e npm na imagem Alpine base.
#
# A opção "--no-cache" é usada para evitar a manutenção de cache desnecessária.
RUN apk add --no-cache nodejs npm

# Este comando instala o pacote "npm-check-updates" globalmente no sistema.
# Este pacote fornece uma maneira de verificar se há atualizações disponíveis para as dependências listadas
# no arquivo package.json.
RUN npm install -g npm-check-updates

# Este comando executa a ferramenta "npm-check-updates" para verificar se há atualizações disponíveis para as dependências.
# O parâmetro "-u" indica que as versões das dependências devem ser atualizadas no arquivo package.json.
RUN ncu -u

# Este comando instala as dependências listadas no arquivo package.json.
# Isso garante que todas as dependências necessárias estejam disponíveis para o projeto.
RUN npm install


# Copie o código-fonte do React para o container
COPY . .

# Construa o projeto React
RUN npm run build

# O comando "RUN rm -rf /usr/share/nginx/html/" é executado durante a construção da imagem Docker.
#
# Ele instrui o Docker a executar o comando "rm -rf" (remover recursivamente e forçadamente)
# no diretório "/usr/share/nginx/html/" dentro do contêiner.
#
# Este comando apaga todos os arquivos e pastas presentes no diretório antes de copiar os novos arquivos.
RUN rm -rf /usr/share/nginx/html/*

# O comando "COPY build /usr/share/nginx/html"
# copia o conteúdo da pasta "build" do host para o diretório "/usr/share/nginx/html/" no contêiner Docker.
#
# O diretório "/usr/share/nginx/html/" é o diretório padrão onde o Nginx serve páginas web.
#
# Ao copiar os arquivos da pasta "build" para este diretório,
# você está preparando o Nginx para servir as páginas web que você acabou de copiar.
COPY build /usr/share/nginx/html

# Expõe a porta 80 para que possa ser acessada externamente
EXPOSE 80

# Executa o comando "nginx -g daemon off" para iniciar o NGINX.
#
# "nginx" é o nome do executável do Nginx.
#
# O argumento "-g" é usado para definir diretivas globais no Nginx.
#
# "daemon off;" significa que o Nginx não deve se tornar um daemon (processo em background),
# e em vez disso, ele deve continuar a ser executado no terminal.
CMD ["nginx", "-g", "daemon off;"]