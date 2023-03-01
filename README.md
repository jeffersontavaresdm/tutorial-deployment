<div style="width: 100%; height: 100%" >
  <h1 align="center" >
    Tutorial para um deploy simples e prático
  </h1 >
  <br/>
  <div style="width: 70%; margin-left: 200px; margin-top: 50px">
    <span ><b >Alguns pontos devem ser levados em consideração, que são:</b ></span >
    <ul >
      <li style="margin-bottom: 10px">
        <span >
            Este tutorial é um guia para implantar uma aplicação em:
            <br>
            - uma máquina <b>EC2</b> da <b>Amazon Web Services (AWS)</b>.
            <br>
            - na plataforma <b>Google Cloud Run</b>.
        </span >
      </li >
      <li style="margin-bottom: 10px">
        Este tutorial explica como desenvolver uma imagem <b>Docker</b> da aplicação e implantá-la em sua plataforma de nuvem escolhida.
      </li>
      <li style="margin-bottom: 10px">
        É importante destacar que este tutorial não cobre questões de <b>segurança</b> ou <b>configurações avançadas</b>.
      </li>
      <li style="margin-bottom: 10px">
        Este tutorial é apenas um <b><i>ponto de partida</i></b> para a implantação de sua aplicação em nuvem e pode ser usado como uma <b>referência</b> para futuros projetos.
      </li>
    </ul >
    <hr>
  </div>
  <h2 align="center" >Amazon Web Services (AWS)</h2 >
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
  <h2 align="center" >Google Cloud Run</h2 >
  <div style="width: 70%; margin-top: 50px; margin-left: 200px" >
    <div >
      <h3 >O tutorial mostra como fazer um deployment prático utilizando:</h3 >
      <ul >
        <li >
          <b >Servidor:</b > NGINX
        </li >
        <li >
          <b >Aplicação:</b > React
        </li >
        <li >
          <b >Plataforma:</b > Google Cloud Run
        </li >
      </ul >
    </div >
    <hr >
    <br >
    <div >
      <span >
        Siga estes passos para criar e armazenar a imagem no <b ><a href="https://hub.docker.com" >Docker Hub</a ></b >:
      </span >
      <ul >
        <li >npm install</li >
        <li >npm run build</li >
        <li >docker build -t [nome-da-imagem]:[versao] ./</li >
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
          <span >
            Clique em <b>Navigation Menu</b> (os 3 tracinhos que forma um "<i>hamburguerzinho</i>") no canto superior esquerdo.
          </span >
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
          coloque a <b >URL</b > da imagem docker do <b >Docker Hub</b > que acabamos de criar 
          (no formato <i>[nome-do-usuario/nome-da-imagem:versao]</i>).
        </span >
        </li >
        <li style="margin-bottom: 10px" >
          <span >Em <b >Service name</b > coloque o nome que desejar para o serviço.</span >
        </li >
        <li style="margin-bottom: 10px" >
          <span >Escolha a região em <b >Region</b >.</span >
        </li >
        <li style="margin-bottom: 10px" >
        <span >
          Escolha a opção <b>All</b> em <i>"Allow direct access to your service from the internet"</i>,
          para permitir que qualquer pessoa possa acessar o serviço.
        </span >
        </li >
        <li style="margin-bottom: 10px" >
        <span >
          Escolha a opção <b>Allow unauthenticated invocations</b>, para permitir que qualquer pessoa possa acessar o serviço
          sem precisar se autenticar ou fornecer informações de <b>autenticação</b>.
        </span >
        </li >
        <li style="margin-bottom: 10px" >
        <span >
          No final, clique na setinha onde tem escrito <b >Container, Networking, Security</b >
          e onde tem escrito <b >Container port</b > coloque a mesma porta exposta no arquivo Dockerfile (no exemplo do nosso arquivo, a porta exposta é 80).
        </span >
        </li >
        <li style="margin-bottom: 10px" >
        <span >
          Por fim, clique em <b >Create</b > para criar o serviço.
        </span >
        </li >
      </ul >
      <br >
      <span >
        Com estes passos claros e simples, você pode facilmente colocar o seu aplicativo em funcionamento no <b>Google Cloud Run</b>!
        <br/>
        Para verificar o resultado, basta acessar o console na aba de serviços e encontrar a <b>URL</b> fornecida para inserir no seu navegador.
      </span >
      <br >
      <br >
    </div >
    <hr />
    <h3>PS: Não esquecer de trocar [nome-do-usuario] pelo nome da sua conta no Docker Hub.</h3>
    <hr />
  </div >
</div >
