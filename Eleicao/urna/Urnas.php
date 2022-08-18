<?php
header("Content-type:text/html;charset=utf8");
define('server','mysql:host=localhost;dbname=eleicao');
define('usuario','root');
define('senha','');
class Urnas
{
    //Criando atributos
    public $Numero;
    public $Municipio;
    public $Zona;
    public $Secao;
    
    //Metodos

    //Lista todas as Urnas
    public function ListarTodos()
    {
        //Criar conexão com o db
        $pdo = new pdo(server,usuario,senha,array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES 'utf8'"));
        //Criar o comando sql
        $smtp = $pdo->prepare("select * from urna");
        //Executar comando
        $smtp->execute();
        //Verificar se retornou valores
        if($smtp->rowCount()>0)
        {
            return $result = $smtp->fetchAll(PDO::FETCH_CLASS);
        }
    }

     //Exclui Urna
    public function excluir($numero)
    {
        //Preenche os atributos com os valores informados pelo usuário
        $this->Numero = $numero;
       //Criar conexão com o db
        $pdo = new pdo(server,usuario,senha,array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES 'utf8'"));
        //Cria o comando sql
        $smtp = $pdo->prepare("Delete from urna where Numero = :numero");
        //Executar o comando no banco de dados passando os parametros
        $smtp->execute(array(                
            ':numero' => $this->Numero
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

     //Insere Urna
    public function inserir()
    {
        //Verifica se os parametros estão setados
        if(isset($_GET["municipio"]) && isset($_GET["zona"]) && isset($_GET["secao"]))
        {
            //Preencher os atributos com os valores informados pelo usuário
            $this->Municipio = $_GET["municipio"];
            $this->Zona = $_GET["zona"];
            $this->Secao = $_GET["secao"];
  
            //Criar conexão com o db
            $pdo = new pdo(server,usuario,senha,array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES 'utf8'"));
            //Cria o comando sql
            $smtp = $pdo->prepare("insert into urna(Numero,Municipio,Zona,Secao) values(null,:municipio,:zona,:secao)");
            
            //Executa o comando sql
            $smtp->execute(array(                
                ':municipio' => $this->Municipio,
                ':zona' => $this->Zona,
                ':secao' => $this->Secao            
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

    //Altera dados
    public function alterar()
    {
        //Preencher os atributos com os valores informados pelo usuário
        $this->Municipio = $_POST["municipio"];
        $this->Zona = $_POST["zona"];
        $this->Secao = $_POST["secao"]; 
        $this->Numero = $_GET["numero"];
        //Criar conexão com o db
        $pdo = new pdo(server,usuario,senha,array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES 'utf8'"));
        $smtp = $pdo->prepare("update urna set Municipio=:municipio,Zona=:zona,Secao=:secao where Numero = :numero");
        //Executa o comando sql
            $smtp->execute(array(    
                ':numero' => $this->Numero,
                ':municipio' => $this->Municipio,
                ':zona' => $this->Zona,
                ':secao' => $this->Secao
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

         //Lista Urna específica
    public function listarNumero($numero)
        {
            if(isset($numero))
            {
                $this->Numero = $numero;
                //Criar conexão com o db
                $pdo = new pdo(server,usuario,senha,array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES 'utf8'"));
                //Cria o comando sql
                $smtp = $pdo->prepare("Select * from urna where Numero = :numero");
                //Executar o comando no banco de dados passando os parametros
                $smtp->execute(array(                
                    ':numero' => $this->Numero
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