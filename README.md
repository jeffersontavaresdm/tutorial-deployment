<div style="width: 100%; height: 100%" >
  <h1 align="center" >
    Tutorial de Deploy simples
  </h1 >
  <br/ >
  <div style="width: 80%; margin-top: 100px; margin-left: 200px" >
    <h3>No tutorial será mostrado:</h3>
    <ul>
      <li>
        <b>Aplicação:</b> React
      </li>
      <li>
        <b>Servidor:</b> NGINX
      </li>
      <li>
        <b>Maquina:</b> EC2 (<b>AWS</b>)
      </li>
    </ul>
    <hr/ >
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
      &nbsp;&nbsp;- Exemplo do arquivo <b ><i style="color: forestgreen" >Dockerfile</i ></b > no <b>projeto</b>.
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
      <li >docker build -t [repositorio] .</li >
      <li >docker tag [repositorio]:[versao] [usuario/repositorio]</li >
      <li >docker push [usuario/repositorio:versao]</li >
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
      <li >sudo docker pull [usuario/repositorio]</li >
      <li >sudo docker run -p [porta-para-acesso]:[porta-exposta] [usuario/repositorio]</li >
    </ul >
    <span >6: Para verificar: [http://[endereço_ip_publico]:[porta-para-acesso]</span >
  </div >
  <hr/>
</div >