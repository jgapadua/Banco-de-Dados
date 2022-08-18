using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace TrabalhoFinal
{
    public partial class frmCadastroEmpresa : Form
    {
        public frmCadastroEmpresa()
        {
            InitializeComponent();
        }
        ConexaoBD bd = new ConexaoBD();
        string sql;
        

        public void limpar()
        {
            txtnome.Clear();
            txtendereco.Clear();
            txtcidade.Clear();
            txttelefone.Clear();
            txtemail.Clear();
            txtsite.Clear();
            txtLogin.Clear();
            txtSenha.Clear();
        }
        public void Listar()
        {
            sql = "Select * from empresa";
            
        }

        private void btnsalvar_Click(object sender, EventArgs e)
        {
            sql = string.Format("insert into empresa values(null,'{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}')", txtnome.Text, txtendereco.Text, txtcidade.Text, txttelefone.Text, txtemail.Text, txtsite.Text, txtLogin.Text, txtSenha.Text);
            bd.AlterarDados(sql);
            MessageBox.Show("Cadastro da Empresa efetuado com sucesso!", "Empresa", MessageBoxButtons.AbortRetryIgnore, MessageBoxIcon.Information);
            limpar();
        }

        private void btncancelar_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
