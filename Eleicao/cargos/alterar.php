<?php   
header("Content-type:text/html;charset=utf8");
require_once("Cargos.php");
$cargo = new Cargos();
if(isset($_GET['codigo']))
{
    $lista = $cargo->listarCodigo($_GET['codigo']);
}

if(isset($_POST["salvar"]))
{
    $cargo->alterar();
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
                <li><a href="../cargos/index.php">Cargos</a></li>
                <li><a href="../partidos/index.php">Partidos</a></li>
                <li><a href="../candidatos/index.php">Candidatos</a></li>
                <li><a href="../eleitores/index.php">Eleitores</a></li>
                <li><a href="../urna/index.php">Urna</a></li>
            </ul>
        </li>
            <ul class="dropdown-menu">
                <li><a href="../Sobre.html">Sobre</a></li>
                <li><a href="../">Sair</a></li>
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
        <li><a href="../Eleicao">Sair</a></li>
    </ul>
  </div>
</nav>
	
<div class="container">
    <div class="row">
    	<div class="col-md-4"></div>
	    <div class="col-md-4"></div>
	    <div class="col-md-4"></div>  
        <div class="col-md-4"></div>
        <div class="col-md-4">
        <form action="alterar.php?codigo=<?php echo $lista->Codigo; ?>" method="post">
            <div class="form-group">
                <label for="nome">Nome</label>
                <input type="text" class="form-control" name="nome" value="<?php echo $lista->Nome; ?>">
            </div>
            <div class="form-group">
                <label for="tipo">Tipo</label>
                <select name="tipo" class="form-control" value="<?php echo $lista->Tipo; ?>">
                    <option value="Municipal">Municipal</option>
                    <option value="Estadual">Estadual</option>
                    <option value="Federal">Federal</option>
                </select>                
            </div>
            <div class="form-group col-md-6" style="padding:4.15px;">
                <button type="submit" name="salvar" class="btn btn-success form-control">Salvar</button>
            </div>
            <div class="form-group col-md-6" style="padding:4.15px;">
                <button type="reset" class="btn btn-danger form-control">Sair</button>
            </div>
                
        </form>
        </div>
    </div>
</div>
</body>
</html>
