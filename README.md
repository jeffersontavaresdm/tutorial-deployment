<div style="width: 100%; height: 100%" >
  <br >
  <h1 align="center" >
    Tutorial: Deployment em uma máquina EC2 da AWS
  </h1 >
  <div style="width: 70%; margin-top: 50px; margin-left: 200px" >
    <h3 >O tutorial mostra como fazer um deployment prático utilizando:</h3 >
    <ul >
      <li >
        <b >Servidor:</b > NGINX
      </li >
      <li >
        <b >Aplicação:</b > React
      </li >
      <li >
        <b >Maquina:</b > EC2 (<b >AWS</b >)
      </li >
    </ul >
    <hr >
    <span >1: Criar uma máquina na AWS (exemplo: EC2/linux)</span >
    <ul >
      <li >
        Fazer login ou criar uma conta na
        <a href="https://portal.aws.amazon.com/billing/signup#/start/email" >AWS</a >
      </li >
      <li >Clicar em <b ><i style="color: forestgreen" >instâncias</i ></b ></li >
      <li >
        No canto superior direito clicar em
        <b ><i style="color: forestgreen" >executar instâncias</i ></b >
      </li >
      <li >
        Escolher <b >sistema operacional</b > da maquina e em <b >segurança</b > adicionar uma regra
        para permitir o tráfego na porta que quer acessar a aplicação a partir da internet.
      </li >
    </ul >
    <span >
      2: Criar um arquivo <b ><i style="color: forestgreen" >Dockerfile</i ></b >
      com as configurações para rodar na maquina.
      <br >
      <br >
      &nbsp;&nbsp;- Exemplo do arquivo <b ><i style="color: forestgreen" >Dockerfile</i ></b > no <b >projeto</b >.
    </span >
    <br >
    <br >
    <span >
      3: Executar os comandos para criar a imagem e armazenar em um
      registry(<a href="https://hub.docker.com" >dockerhub</a >):
    </span >
    <ul >
      <li >npm install</li >
      <li >npm run build</li >
      <li >docker build -t [nome-da-imagem] .</li >
      <li >docker tag [nome-da-imagem]:[versao] [nome-do-usuario/nome-da-imagem]</li >
      <li >docker push [nome-do-usuario/nome-da-imagem:versao]</li >
    </ul >
    <span >4: Acessar a máquina via <b >ssh</b >.</span >
    <br >
    <br >
    &nbsp;&nbsp;- Clicar em
    <b ><i style="color: forestgreen" >conectar</i ></b >
    no canto superior direito na aba de <b >instâncias</b > e seguir as instruções.
    <br >
    <br >
    <span >
      5: Executar os comandos no terminal da máquina para baixar o docker,
      armazenar localmente(na <b >máquina</b >) a imagem da aplicação
      e rodar com a porta configurada em <i >"segurança"</i > na aba de <i >"instâncias"</i > para acesso pela internet.
    </span >
    <ul >
      <li >sudo apt-get update</li >
      <li >sudo apt-get install -y docker.io</li >
      <li >sudo docker pull [nome-do-usuario/nome-da-imagem]</li >
      <li >sudo docker run -p [porta-para-acesso]:[porta-exposta] [nome-do-usuario/nome-da-imagem]</li >
    </ul >
    <span >6: Para verificar: [http://[dns-ipv4-publico]:[porta-para-acesso]</span >
    <br >
    <br >
    &nbsp;&nbsp; - Exemplo: <b ><i
      style="color: forestgreen" >http://ec2-01-001-01-001.compute-1.amazonaws.com:8080</i ></b >
    <hr />
  </div >
  <!-------------------------------------------------------------------------------------------------------------->
  <h1 align="center" >
    Tutorial: Deployment utilizando Google Cloud Run
  </h1 >
  <br>
  <div style="width: 70%; margin-top: 50px; margin-left: 200px" >
    <div >
      <span ><b >Alguns pontos devem ser levados em consideração, que são:</b ></span >
      <ul >
        <li >
          <span >Este é um tutorial simples para criar um serviço no Google Cloud Run.</span >
        </li >
        <li >
          <span >Ele explica como desenvolver e implantar uma imagem Docker em Cloud Run.</span >
        </li >
        <li >
          <span >Este tutorial não aborda questões de segurança ou outras configurações avançadas.</span >
        </li >
      </ul >
    </div >
    <hr >
    <br >
    <div >
      <span >
        Siga estes passos criar e armazenar a imagem no <b ><a href="https://hub.docker.com" >Docker Hub</a ></b >:
      </span >
      <ul >
        <li >npm install</li >
        <li >npm run build</li >
        <li >docker build -t [nome-da-imagem] .</li >
        <li >docker tag [nome-da-imagem]:[versao] [nome-do-usuario/nome-da-imagem]</li >
        <li >docker push [nome-do-usuario/nome-da-imagem:versao]</li >
      </ul >
    </div >
    <br >
    <div >
      <span >Siga este passo a passo para criar o serviço <b >Google Cloud Run</b ></span >
      <ul >
        <li style="margin-bottom: 10px" >
          <span >Crie uma conta ou faça login na plataforma <b >Google Cloud</b >.</span >
        </li >
        <li style="margin-bottom: 10px" >
        <span >
          Entre no <b ><a href="https://console.cloud.google.com/" target="_blank" >console</a ></b > do Google Cloud.
        </span >
        </li >
        <li style="margin-bottom: 10px" >
          <span >Clique em <b >Navigation Menu</b > no canto superior esquerdo.</span >
        </li >
        <li style="margin-bottom: 10px" >
          <span >Clique em <b >Cloud Run</b >.</span >
        </li >
        <li style="margin-bottom: 10px" >
          <span >Clique em <b >Create Service</b >.</span >
        </li >
        <li style="margin-bottom: 10px" >
        <span >
          Em <i >"Deploy one revision from an existing container image"</i >
          coloque a <b >URL</b > da imagem docker do <b >Docker Hub</b >.
        </span >
        </li >
        <li style="margin-bottom: 10px" >
          <span >Em <b >Service name</b > coloque o nome do serviço que desejar.</span >
        </li >
        <li style="margin-bottom: 10px" >
          <span >Escolha a região em <b >Region</b >.</span >
        </li >
        <li style="margin-bottom: 10px" >
        <span >
          Escolha a opção <b >All</b > onde diz <i >"Allow direct access to your service from the internet"</i >
          para que qualquer pessoa com internet possa acessar o serviço.
        </span >
        </li >
        <li style="margin-bottom: 10px" >
        <span >
          Por ultimo, escolha a opção <b >Allow unauthenticated invocations</b >,
          que diz <i >"Check this if you are creating a public API or website"</i >
          para que qualquer pessoa possa acessar o serviço sem precisar se autenticar ou fornecer informações de autenticação.
        </span >
        </li >
      </ul >
      <br >
      <span >
        Com esses passos fáceis e simples, você já pode ter o seu próprio serviço rodando no <b >Google Cloud Run</b >!
        <br>
        Para verificar, no console na aba de serviços tem a <b >URL</b > para utilizar no <b >browser</b >.
      </span >
      <br >
      <br >
    </div >
    <hr />
  </div >
</div >