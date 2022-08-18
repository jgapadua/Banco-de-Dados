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
                <li><a href="../cargos/cadastrar.php">Cargos</a></li>
                <li><a href="../partidos/cadastrar.php">Partidos</a></li>
                <li><a href="../candidatos/cadastrar.php">Candidatos</a></li>
                <li><a href="../eleitores/cadastrar.php">Eleitores</a></li>
                <li><a href="../urna/cadastrar.php">Urna</a></li>
            </ul>
        </li>
        <li class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#">Votação
                <span class="caret"></span>
            </a>
            <ul class="dropdown-menu">
                <li><a href="#">Eleição</a></li>
                <li><a href="#">Voto</a></li>
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
        <li><a href="#">Sobre</a></li>
        <li><a href="#">Sair</a></li>
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
            <div class="form-group">
                <label for="Nome">Descrição</label>
                <input type="text" class="form-control" name="descricao">
            </div>
            <div class="form-group">
                <label for="Data">Data</label>
                <input type="date" class="form-control" name="data">
            </div>
            <div class="form-group">
                <label for="Turno">Turno</label>
                <input type="text" class="form-control" name="turno">
            </div>
            <div class="form-group">
                <label for="Horario">Horário</label>
                <input type="time" class="form-control" name="horario">
            </div>
            <div class="form-group">
                <label for="Urna">Urna</label>
                <input type="text" class="form-control" name="urna">
            </div>
           
            <div class="form-group col-md-6" style="padding:4.15px;">
                <button class="btn btn-success form-control">Ent</button>
            </div>
            <div class="form-group col-md-6" style="padding:4.15px;">
                <button class="btn btn-danger form-control">Sair</button>
            </div>
        </div>
    </div>
</div>
</body>
</html>
