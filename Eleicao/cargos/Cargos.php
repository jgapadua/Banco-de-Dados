<?php
header("Content-type:text/html;charset=utf8");
define('server','mysql:host=localhost;dbname=eleicao');
define('usuario','root');
define('senha','');
class Cargos
{
    //Criando atributos
    public $Codigo;
    public $Nome;
    public $Tipo;
    //Metodos

    //Lista todos os cargios
    public function ListarTodos()
    {
        //Criar conexão com o db
        $pdo = new pdo(server,usuario,senha,array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES 'utf8'"));
        //Criar o comando sql
        $smtp = $pdo->prepare("select * from cargo");
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
        $this->Tipo = $_POST["tipo"];   
        $this->Codigo = $_GET["codigo"];
        //Criar conexão com o db
        $pdo = new pdo(server,usuario,senha,array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES 'utf8'"));
        $smtp = $pdo->prepare("update cargo set nome = :nome, tipo = :tipo where codigo = :codigo");
        //Executa o comando sql
            $smtp->execute(array(    
                ':codigo' => $this->Codigo,            
                ':nome' => $this->Nome,
                ':tipo' => $this->Tipo
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
                 print_r($stmt->errorInfo());
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
        $smtp = $pdo->prepare("Delete from cargo where codigo = :codigo");
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
        if(isset($_GET["nome"]) && isset($_GET["tipo"]))
        {
            //Preencher os atributos com os valores informados pelo usuário
            $this->Nome = $_GET["nome"];
            $this->Tipo = $_GET["tipo"];
            //Criar conexão com o db
            $pdo = new pdo(server,usuario,senha,array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES 'utf8'"));
            //Cria o comando sql
            $smtp = $pdo->prepare("insert into cargo(codigo,nome,tipo) values(null,:nome,:tipo)");
            
            //Executa o comando sql
            $smtp->execute(array(                
                ':nome' => $this->Nome,
                ':tipo' => $this->Tipo
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
                $smtp = $pdo->prepare("Select * from cargo where codigo = :codigo");
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