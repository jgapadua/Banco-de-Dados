<?php
header("Content-type:text/html;charset=utf8");
define('server','mysql:host=localhost;dbname=eleicao');
define('usuario','root');
define('senha','');
class Candidatos
{
    //Criando atributos
    public $Numero;
    public $Nome;
    public $Endereco;
    public $Cidade;
    public $UF;
    public $Foto;
    public $Idade;
    public $Partido_Codigo;
    public $Cargo_Codigo;
    public $Partido;
    public $Cargo; 
    
    //Metodos

    //Lista todas as Urnas
    public function ListarTodos()
    {
        //Criar conexão com o db
        $pdo = new pdo(server,usuario,senha,array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES 'utf8'"));
        //Criar o comando sql
        $smtp = $pdo->prepare("select * from candidato");
        //Executar comando
        $smtp->execute();
        //Verificar se retornou valores
        if($smtp->rowCount()>0)
        {
            return $result = $smtp->fetchAll(PDO::FETCH_CLASS);
        }
    }
    public function SelectPartidos()
    {
        //Criar conexão com o db
        $pdo = new pdo(server,usuario,senha,array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES 'utf8'"));
        //Criar o comando sql
        $smtp = $pdo->prepare("select Nome,Codigo from partido");
        //Executar comando
        $smtp->execute();
        //Verificar se retornou valores
        if($smtp->rowCount()>0)
        {
            return $result = $smtp->fetchAll(PDO::FETCH_CLASS);
        }
    }

    public function SelectCargos()
    {
         //Criar conexão com o db
        $pdo = new pdo(server,usuario,senha,array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES 'utf8'"));
        $smtp = $pdo->prepare("Select Nome,Codigo from cargo");
        $smtp->execute();
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
        $smtp = $pdo->prepare("Delete from candidato where Numero = :numero");
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
        if($_POST["numero"] && isset($_POST["nome"]) && $_POST["endereco"] && $_POST["cidade"] && $_POST["UF"] && $_POST["foto"] && $_POST["idade"] && $_POST["partido"] && $_POST["cargo"])
        {
            //Preencher os atributos com os valores informados pelo usuário
            $this->Nome = $_POST["nome"];
            $this->Endereco = $_POST["endereco"];
            $this->Cidade = $_POST["cidade"];
            $this->UF = $_POST["UF"];
            $this->Foto = $_POST["foto"];
            $this->Idade = $_POST["idade"];
            $this->Partido = $_POST["partido"];
            $this->Cargo = $_POST["cargo"];
            $this->Numero = $_POST["numero"];
            //Criar conexão com o db
            $pdo = new pdo(server,usuario,senha,array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES 'utf8'"));
            
             $smtp = $pdo->prepare("Insert into Candidato(Numero,Nome,Endereco,Cidade,UF,Foto,Idade,Partido_Codigo,Cargo_Codigo) values(:numero,:nome,:endereco,:cidade,:uf,:foto,:idade,:partido,:cargo)");
              $smtp->execute(array(    
                ':numero' => $this->Numero,
                ':nome' => $this->Nome,
                ':endereco' => $this->Endereco,
                ':cidade' => $this->Cidade,
                ':uf' => $this->UF,
                ':foto' => $this->Foto,
                ':idade' => $this->Idade,
                ':partido' => $this->Partido,
                ':cargo' => $this->Cargo
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

    //Altera dados
    public function alterar()
    {
        //Preencher os atributos com os valores informados pelo usuário
        $this->Nome = $_POST["nome"];
        $this->Endereco = $_POST["endereco"];
        $this->Cidade = $_POST["cidade"];
        $this->UF = $_POST["UF"];
        $this->Foto = $_POST["foto"];
        $this->Idade = $_POST["idade"];
        $this->Partido = $_POST["partido"];
        $this->Cargo = $_POST["cargo"];
        $this->Numero = $_GET["numero"];
        //Criar conexão com o db
        $pdo = new pdo(server,usuario,senha,array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES 'utf8'"));
        $smtp = $pdo->prepare("update candidato set Nome=:nome,Endereco=:endereco,Cidade=:cidade,UF=:uf,Foto=:foto,Idade=:idade,Partido_Codigo=:partido,Cargo_Codigo=:cargo where Numero=:numero");
        //Executa o comando sql
            $smtp->execute(array(    
                ':numero' => $this->Numero,
                ':nome' => $this->Nome,
                ':endereco' => $this->Endereco,
                ':cidade' => $this->Cidade,
                ':uf' => $this->UF,
                ':foto' => $this->Foto,
                ':idade' => $this->Idade,
                ':partido' => $this->Partido,
                ':cargo' => $this->Cargo
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
                $smtp = $pdo->prepare("Select * from candidato where Numero = :numero");
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