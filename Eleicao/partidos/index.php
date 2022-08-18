<?php
header("Content-type:text/html;charset=utf8");
require_once "Partidos.php";
//Instanciando partido
$partido = new Partido();
//Criando lista de Partidos
$lista = $partido->ListarTodos();

//Verificando se o parametro codigo está setado
if(isset($_GET['codigo']))
{
    echo "ok";
    //Exclui cargo
    $partido->excluir($_GET['codigo']);
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

<header>
<div class="row">
    <div class="col-md-2"></div>
    <div class="col-md-8">
        <h2>Lista de Partidos</h2>
    </div>
    <div class="col-md-2 h2">
        <a href="cadastrar.php" class="btn btn-primary">Novo Partido</a>
    </div>
</div>
</header>
<div class="container">
    <div class="col-md-2"></div>
    <div class="col-md-8">
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>Código</th>
                    <th>Nome</th>
                    <th>Sigla</th>
                    <th>Presidente</th>
                    <th>UF</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <?php if($lista) : ?>
                <?php foreach ($lista as $partido) :?>
                <tr>
                    <th><?php echo $partido->Codigo;?></th>
                    <th><?php echo $partido->Nome;?></th>
                    <th><?php echo $partido->Sigla;?></th>
                    <th><?php echo $partido->Presidente;?></th>
                    <th><?php echo $partido->UF;?></th>
                    <td>
                    	<a href="alterar.php?codigo=<?php echo $partido->Codigo; ?>" class="btn btn-success">Alterar</a>
                    	<a href="index.php?codigo=<?php echo $partido->Codigo; ?>" class="btn btn-danger">Excluir</a>
                    </td>
                </tr>
            <?php endforeach; ?>
            <?php else : ?>
            <tr>
                <td colspan="5">Nenhum registro encontrado</td>
            </tr>
            <?php endif ?>
            </tbody>
        </table>
    </div>
    <div class="col-md-2"></div>
</div>

</body>
</html>
