<?php
header("Content-type:text/html;charset=utf8");
define('server','mysql:host=localhost;dbname=eleicao');
define('usuario','root');
define('senha','');
class Partido
{
    //Criando atributos
    public $Codigo;
    public $Nome;
    public $Sigla;
    public $Presidente;
    public $UF;
    
    //Metodos

    //Lista todos os Partidos
    public function ListarTodos()
    {
        //Criar conexão com o db
        $pdo = new pdo(server,usuario,senha,array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES 'utf8'"));
        //Criar o comando sql
        $smtp = $pdo->prepare("select * from partido");
        //Executar comando
        $smtp->execute();
        //Verificar se retornou valores
        if($smtp->rowCount()>0)
        {
            return $result = $smtp->fetchAll(PDO::FETCH_CLASS);
        }
    }

    //Altera dados
    public function alterar()
    {
        //Preencher os atributos com os valores informados pelo usuário
        $this->Nome = $_POST["nome"];
        $this->Sigla = $_POST["sigla"]; 
        $this->Presidente = $_POST["presidente"];
        $this->UF = $_POST["UF"];  
        $this->Codigo = $_GET["codigo"];
        //Criar conexão com o db
        $pdo = new pdo(server,usuario,senha,array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES 'utf8'"));
        $smtp = $pdo->prepare("update partido set Nome = :nome, Sigla =  :sigla , Presidente = :presidente, UF=:UF where Codigo = :codigo");
        //Executa o comando sql
            $smtp->execute(array(    
                ':codigo' => $this->Codigo,            
                ':nome' => $this->Nome,
                ':sigla' => $this->Sigla,
                ':presidente' => $this->Presidente,
                ':UF' => $this->UF
            ));
        //Verifica se a execução do comando funcionou
            if($smtp->rowCount() > 0)
            {
                //Retornar para index
                header('location:./');
            }
            else
            {//Se não enviou valores retornar para index.php
                //Retornar para index
                 header('location:./');
            }

    }
    //Exclui Cargo
    public function excluir($codigo)
    {
        //Preenche os atributos com os valores informados pelo usuário
        $this->Codigo = $codigo;
       //Criar conexão com o db
        $pdo = new pdo(server,usuario,senha,array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES 'utf8'"));
        //Cria o comando sql
        $smtp = $pdo->prepare("Delete from partido where codigo = :codigo");
        //Executar o comando no banco de dados passando os parametros
        $smtp->execute(array(                
            ':codigo' => $this->Codigo
        ));
        //Verifica se a execução do comando funcionou
        if($smtp->rowCount() > 0)
        {
            //Retornar para index
            header('location:./');
        }
        else
        {//Se não enviou valores retornar para index.php
            //Retornar para index
            header('location:./');
        }
            
    }

    //Insere Cargo
    public function inserir()
    {
        //Verifica se os parametros estão setados
        if(isset($_GET["codigo"]) && isset($_GET["nome"]) && isset($_GET["sigla"]) && isset($_GET["presidente"]) && isset($_GET["UF"]))
        {
            //Preencher os atributos com os valores informados pelo usuário
            $this->Codigo = $_GET["codigo"];
            $this->Nome = $_GET["nome"];
            $this->Sigla = $_GET["sigla"];
            $this->Presidente = $_GET["presidente"];
            $this->UF = $_GET["UF"];
            //Criar conexão com o db
            $pdo = new pdo(server,usuario,senha,array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES 'utf8'"));
            //Cria o comando sql
            $smtp = $pdo->prepare("insert into partido(Codigo,Nome,Sigla,Presidente,UF) values(:codigo,:nome,:sigla,:presidente,:uf)");
            
            //Executa o comando sql
            $smtp->execute(array(                
                ':codigo' => $this->Codigo, 
                ':nome' => $this->Nome,
                ':sigla' => $this->Sigla,
                ':presidente' => $this->Presidente,
                ':uf' => $this->UF
            ));
            //Verifica se a execução do comando funcionou
            if($smtp->rowCount() > 0)
            {
                //Retornar para index
                header('location:./');
            }
            else
            {//Se não enviou valores retornar para index.php
                //Retornar para index
               print_r($smtp->errorInfo());

            }
        }
    }

    //Lista Cargo específico
    public function listarCodigo($codigo)
        {
            if(isset($codigo))
            {
                $this->Codigo = $codigo;
                //Criar conexão com o db
                $pdo = new pdo(server,usuario,senha,array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES 'utf8'"));
                //Cria o comando sql
                $smtp = $pdo->prepare("Select * from partido where codigo = :codigo");
                //Executar o comando no banco de dados passando os parametros
                $smtp->execute(array(                
                    ':codigo' => $this->Codigo
                ));
                //Verificar se retornou dados
                if($smtp->rowCount() > 0)
                {
                    return $result = $smtp->fetchObject();
                }
            }
        }
}
?>