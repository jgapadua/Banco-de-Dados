using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

//Adicionar  bibliotecas

using System.Data;
using MySql.Data.MySqlClient;


namespace TrabalhoFinal
{
    class ConexaoBD
    {
        private MySqlConnection conexao;

        public void ConectarBD()
        {
            try
            {
                conexao = new MySqlConnection("Persist Security info = false; server=localhost;database=BD_LINGUICA;user=root;pwd=");
                conexao.Open();
            }
            catch
            {
                throw;
            }
        }
        // insert - delete - update

        public int AlterarDados (string sql)
        {
            try
            {
                ConectarBD();
                MySqlCommand cmd = new MySqlCommand(sql, conexao);
                return cmd.ExecuteNonQuery();
            }
            catch
            {
                throw;
            }
            finally
            {
                conexao.Close();
            }
        }
        //select
        public DataTable ConsultarDados(string sql)
        {
            try
            {
                ConectarBD();
                DataTable dt = new DataTable();
                MySqlDataAdapter da = new MySqlDataAdapter(sql, conexao);
                 da.Fill(dt);
                return dt;
            }
            catch
            {
                throw;
            }
            finally
            {
                conexao.Close();
            }
        }
    }
}
