using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

//Adicionar bibliotecas

using System.Data;

namespace TrabalhoFinal
{
    class Login2
    {
        //variavel  estatica - unica da classe
        //para armazenar o nome e o tipo de usuario
        private static string login;
        private static string senha;
        //metodo para validar o usuario
        public bool validarUsuario(string login, string senha)
        {
            //instanciar a classe de conexão com o banco de dados
            ConexaoBD bd = new ConexaoBD();
            string sql = string.Format("select * from empresa where login='{0}' and senha ='{1}'", login, senha);
            DataTable dt = new DataTable();
            dt = bd.ConsultarDados(sql);
            //verificar se a consulta retornou valores
            if (dt.Rows.Count > 0)
            {
                //recuperar o nome e o tipo de usuario
                login = dt.Rows[0]["login"].ToString();
                senha = dt.Rows[0]["senha"].ToString();
                //retorna verdadeiro
                return true;
            }
            else
            {
                //retorna falso
                return false;
            }
        }
        //metodo para retornar o nome do usuario
        public string UsuarioLogado()
        {
            return login;
        }
        //metodo para retornar o tipo do usuario
        public string SenhaUsuario()
        {
            return senha;
        }
    }
}