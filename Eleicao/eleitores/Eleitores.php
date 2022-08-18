<?php
header("Content-type:text/html;charset=utf8");
define('server','mysql:host=localhost;dbname=eleicao');
define('usuario','root');
define('senha','');
class Eleitores
{
    //Criando atributos
    public $Codigo;
    public $Nome;
    public $Endereco;
    public $CPF;
    public $RG;
    public $Titulo;
    public $Zona;
    public $Secao;
    //Metodos

    //Lista todos os Eleitores
    public function ListarTodos()
    {
        //Criar conexão com o db
        $pdo = new pdo(server,usuario,senha,array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES 'utf8'"));
        //Criar o comando sql
        $smtp = $pdo->prepare("select * from eleitor");
        //Executar comando
        $smtp->execute();
        //Verificar se retornou valores
        if($smtp->rowCount()>0)
        {
            return $result = $smtp->fetchAll(PDO::FETCH_CLASS);
        }
    }
     //Insere Eleitor
    public function inserir()
    {
        //Verifica se os parametros estão setados
        if(isset($_GET["nome"]) && isset($_GET["endereco"]) && isset($_GET["CPF"]) && isset($_GET["RG"]) && isset($_GET["titulo"])&& isset($_GET["zona"]) && isset($_GET["secao"]))
        {
            //Preencher os atributos com os valores informados pelo usuário
            $this->Nome = $_GET['nome'];
            $this->Endereco = $_GET['endereco'];
            $this->CPF = $_GET['CPF'];
            $this->RG = $_GET['RG'];
            $this->Titulo = $_GET['titulo'];
            $this->Zona = $_GET['zona'];
            $this->Secao = $_GET['secao'];
            //Criar conexão com o db
            $pdo = new pdo(server,usuario,senha,array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES 'utf8'"));
            //Cria o comando sql
            $smtp = $pdo->prepare("insert into eleitor(Codigo,Nome,Endereco,CPF,RG,Titulo,Zona,Secao) values(null,:nome,:endereco,:cpf,:rg,:titulo,:zona,:secao)");
            
            //Executa o comando sql
            $smtp->execute(array(                
                ':nome' => $this->Nome,
                ':endereco' => $this->Endereco,
                ':cpf' => $this->CPF,
                ':rg' => $this->RG,
                ':titulo' => $this->Zona,
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
    }

     //Exclui Eleitor
    public function excluir($codigo)
    {
        //Preenche os atributos com os valores informados pelo usuário
        $this->Codigo = $codigo;
       //Criar conexão com o db
        $pdo = new pdo(server,usuario,senha,array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES 'utf8'"));
        //Cria o comando sql
        $smtp = $pdo->prepare("Delete from eleitor where codigo = :codigo");
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
    }

     //Lista Cargo específico
    public function listarCodigo($codigo)
    {
        if(isset($codigo))
        {
             $this->Codigo = $codigo;
            //Criar conexão com o db
            $pdo = new pdo(server,usuario,senha,array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES 'utf8'"));                //Cria o comando sql
            $smtp = $pdo->prepare("Select * from eleitor where codigo = :codigo");
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
   //Altera dados
    public function alterar()
    {
        //Preencher os atributos com os valores informados pelo usuário
        $this->Nome = $_POST['nome'];
        $this->Endereco = $_POST['endereco'];
        $this->CPF = $_POST['CPF'];
        $this->RG = $_POST['RG'];
        $this->Titulo = $_POST['titulo'];
        $this->Zona = $_POST['zona'];
        $this->Secao = $_POST['secao'];
        $this->Codigo = $_GET["codigo"];
        //Criar conexão com o db
        $pdo = new pdo(server,usuario,senha,array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES 'utf8'"));
        $smtp = $pdo->prepare("update eleitor set Nome = :nome,Endereco=:endereco,CPF=:cpf,RG=:rg,Titulo=:titulo,Zona=:zona,Secao=:secao  where Codigo = :codigo");
        //Executa o comando sql
            $smtp->execute(array(    
                ':codigo' => $this->Codigo,            
                ':nome' => $this->Nome,
                ':endereco' => $this->Endereco,
                ':cpf' => $this->CPF,
                ':rg' => $this->RG,
                ':titulo' => $this->Zona,
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
                 print_r($stmt->errorInfo());
            }

    }
}