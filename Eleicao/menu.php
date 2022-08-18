<?php 
header("Content-type:text/html;charset=utf8");
define('server','mysql:host=localhost;dbname=eleicao');
define('usuario','root');
define('senha','');
    if(isset($_POST['login']) && isset($_POST['senha']))
    {
        $login = $_POST['login'];
        $senha = $_POST['senha'];

        //Criar conexão com o db
        $pdo = new pdo(server,usuario,senha,array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES 'utf8'"));
        //Criar o comando sql
        $smtp = $pdo->prepare("select * from usuario");
        //Executar comando
        $smtp->execute();
        //Verificar se retornou valores
        if($smtp->rowCount()>0)
        {
            $bool = false;
            $result = $smtp->fetchAll(PDO::FETCH_CLASS);
            foreach ($result as $key => $value) {
                if($value->login == $login && $value->senha == $senha)
                {
                   $bool = true;
                }
            }
            if(!$bool)
            {
                header("location:./");
            }
        }
        else
        {
            header('location:./');
        }
    }
    else
    {
        header("location:./");
    }
?>
<!DOCTYPE html>
<html lang="pt-br">
<head>
  <title>Eleição</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid"> 
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Eleição</a>
    </div>
    <ul class="nav navbar-nav">
        <li class="active"><a href="#">Home</a></li>
        <li class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#">Cadastro
                <span class="caret"></span>
            </a>
            <ul class="dropdown-menu">
                 <li><a href="cargos/index.php">Cargos</a></li>
                <li><a href="partidos/index.php">Partidos</a></li>
                <li><a href="candidatos/index.php">Candidatos</a></li>
                <li><a href="eleitores/index.php">Eleitores</a></li>
                <li><a href="urna/index.php">Urna</a></li>
            </ul>
        </li>
        <li class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#">Relatórios
                <span class="caret"></span>
            </a>
            <ul class="dropdown-menu">
                <li><a href="#">Votos por Candidatos</a></li>
                <li><a href="#">Votos por Partidos</a></li>
            </ul>
        </li>
        <li><a href="../Sobre.html">Sobre</a></li>
        <li><a href="../">Sair</a></li>
    </ul>
  </div>
</nav>
<div class="container">
    <div class="row" style="text-align:center">  
        <div class="col-md-4">
            <h2>INICIAR VOTAÇÃO</h2>
            <button style="background-color: #FFF;" type="button" onclick="alert('Não implementado');" value=""><img class="col-md-12" src="img/voto4.jpg" class="img-responsive" alt="Voto4"></button>
        </div>
        <div class="col-md-4">
            <h2>VOTAR</h2>
            <button style="background-color: #FFF" type="button" onclick="alert('Não implementado');"><img class="col-md-12" src="img/voto.jpg" alt="Voto" class="img-responsive"></button>
        </div>
        <div class="col-md-4">
            <h2>RESULTADO</h2>
            <button style="background-color: #FFF" type="button" onclick="alert('Não implementado');"><img class="col-md-12" src="img/APURACAO.jpg" alt="Voto" class="img-responsive"></button>
        </div>
    </div>
</div>
</body>
</html>
