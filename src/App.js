import './App.css';

function App() {
  return (
    <div style={{ marginTop: "10%", marginLeft: "10%" }} >
      <h1 style={{ fontSize: "50px" }} >
        Tutorial de como fazer um deploy simples e prático!
      </h1 >
      <br />
      <div style={{ fontSize: "40px" }} >
        <span >
          Leia o&nbsp;
          <strong >
          <a
            href="https://github.com/jeffersontavaresdm/tutorial-deployment/blob/main/README.md"
            target={"_blank"}
            rel="noreferrer"
          >
            README.md
          </a >
        </strong > para:
        </span >
        <ul >
          <li style={{ marginBottom: "10px" }} >
            Aprender como fazer o deploy em uma máquina <b >EC2</b > da <b >AWS</b >
          </li >
          <li >
            Aprender como fazer o deploy utilizando o <b >Google Cloud Run</b >
          </li >
        </ul >
      </div >
    </div >
  );
}

export default App;