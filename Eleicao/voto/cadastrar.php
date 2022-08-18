<?php
header("Content-type:text/html;charset=utf8");
require_once("Votos.php");
$voto = new Votos();

if(isset($_GET["salvar"]))
{
    $voto->inserir();
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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script>
        function numVoto(x) {
            //  debugger;
            voto = document.getElementById("numero").value;
            if(voto.length >= 0 && voto.length <2) {
                document.getElementById("numero").value += x;
                carregaFoto();
            }

        }
        function carregaFoto(){
            // debugger;
            voto = document.getElementById("numero").value;
            if(voto.length == 2){
                switch(voto){
                    case '13':{
                        document.getElementById("imgfoto").src = "../fotos/haddad.jpg";
                        break;
                    }
                    case '27':{
                        document.getElementById("imgfoto").src = "../fotos/Eymael.jpg";
                        break;
                    }
                    case '17':{
                        document.getElementById("imgfoto").src = "../fotos/bolsonaro.jpg";
                        break;
                    }
                    case '13':{
                        document.getElementById("imgfoto").src = "../fotos/alvaro.jpg";
                        break;
                    }
                    case '13':{
                        document.getElementById("imgfoto").src = "../fotos/haddad.jpg";
                        break;
                    }
                    case '13':{
                        document.getElementById("imgfoto").src = "../fotos/haddad.jpg";
                        break;
                    }
                    case '13':{
                        document.getElementById("imgfoto").src = "../fotos/haddad.jpg";
                        break;
                    }
                    case '13':{
                        document.getElementById("imgfoto").src = "../fotos/haddad.jpg";
                        break;
                    }
                    case '13':{
                        document.getElementById("imgfoto").src = "../fotos/haddad.jpg";
                        break;
                    }
                    case '13':{
                        document.getElementById("imgfoto").src = "../fotos/haddad.jpg";
                        break;
                    }
                    case '13':{
                        document.getElementById("imgfoto").src = "../fotos/haddad.jpg";
                        break;
                    }
                    case '13':{
                        document.getElementById("imgfoto").src = "../fotos/haddad.jpg";
                        break;
                    }
                    case '13':{
                        document.getElementById("imgfoto").src = "../fotos/haddad.jpg";
                        break;
                    }

                }
            }
        }
    </script>
    <style>
        #botoes{
            color: white;
            text-align: center;
            background-color: transparent;
            width: 80px;
            height: 80px;
        }
    </style>

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
                    <span class="caret"></span></a>
                <ul class="dropdown-menu">
                    <li><a href="../cargos/index.php">Cargos</a></li>
                    <li><a href="../partidos/index.php">Partidos</a></li>
                    <li><a href="../candidatos/index.php">Candidatos</a></li>
                    <li><a href="../eleitores/index.php">Eleitores</a></li>
                    <li><a href="../urna/index.php">Urna</a></li>
                </ul>
            </li>
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">Votação
                    <span class="caret"></span></a>
                <ul class="dropdown-menu">
                    <li><a href="#">Eleição</a></li>
                    <li><a href="#">Voto</a></li>

                </ul>
            </li>
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">Relatórios
                    <span class="caret"></span></a>
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
<div class="row">

    <form action="" method="post">
        <div class="row" style="padding-left: 250px; padding-top: 100px">
            <div class="col-sm-8 text-center">
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <h3 class="panel-title">Eleição 2018 - Presidente</h3>
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-sm-6" style="background-color: cadetblue; padding: 10px">
                                <div class="row" >
                                    <div class="col-sm-4">
                                        <h4>Seu Voto para Presidente</h4>

                                    </div>
                                    <div class="col-sm-8">

                                        <img src="../img/candidato.jpg" style="width: 200px; height: 200px" name="imgfoto" id="imgfoto">
                                    </div>
                                </div>
                                <div class="row" >
                                    <div class="col-sm-6" style="padding-right: 100px; padding-top: 150px;height: 240px; text-align: left">
                                        <form id="frm" name="frm">

                                            <label>Número:</label> <input type="number" maxlength="2" style="width:50px" ;  name="numero" id="numero" disabled="true">
                                            <br><label>Nome: </label><br>
                                            <label>Partido: </label>

                                    </div>

                                </div>

                            </div>
                            <div class="col-sm-6" style="background-color: black; padding: 20px;">
                                <button  id="botoes" onclick="numVoto(1)" type="button">1</button>
                                <button id="botoes" onclick="numVoto(2)" type="button">2</button>
                                <button id="botoes" onclick="numVoto(3)" type="button">3</button><br>

                                <button  id="botoes" onclick="numVoto(4)" type="button">4</button>
                                <button id="botoes" onclick="numVoto(5)" type="button">5</button>
                                <button id="botoes" onclick="numVoto(6)" type="button">6</button><br>

                                <button  id="botoes" onclick="numVoto(7)" type="button">7</button>
                                <button id="botoes" onclick="numVoto(8)" type="button">8</button>
                                <button id="botoes" onclick="numVoto(9)" type="button">9</button><br>

                                <button  id="botoes" onclick="numVoto(0)" type="button">0</button><br><br>

                                <button  class="btn btn-button btn-default" style="height:80px; width: 100px; color: black">BRANCO</button>
                                <button class="btn btn-button btn-warning" style="height:80px; width: 100px; color: black">CORRIGE</button>
                                <button class="btn btn-button btn-success" style="height:80px; width: 100px; color: black">CONFIRMA</button><br>
    </form>
</div>
</div>

</div>
</div>
</div>
</div>

</form>
</div>


</div>





</body>

</html>
