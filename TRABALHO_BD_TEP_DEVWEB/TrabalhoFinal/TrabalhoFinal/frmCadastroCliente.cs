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
    public partial class frmCadastroCliente : Form
    {
        public frmCadastroCliente()
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
            cbxEstado.SelectedIndex = -1;
            txttelefone.Clear();
            txtemail.Clear();
            txtLogin.Clear();
            txtSenha.Clear();
        }
        public void Listar()
        {
            sql = "Select * from clientes";
            dtglistar.DataSource = bd.ConsultarDados(sql);

        }

        private void frmCadastroCliente_Load(object sender, EventArgs e)
        {
            Listar();
        }

        private void btnsalvar_Click(object sender, EventArgs e)
        {
            sql = string.Format("insert into clientes values(null,'{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}')", txtnome.Text, txtendereco.Text,  txtcidade.Text, cbxEstado.Text,  txttelefone.Text, txtemail.Text,txtLogin, txtSenha.Text);
            bd.AlterarDados(sql);
            MessageBox.Show("Cadastro do Cliente efetuado com sucesso!", "Cliente", MessageBoxButtons.AbortRetryIgnore, MessageBoxIcon.Information);
            limpar();
            Listar();
        }

        private void btncancelar_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void dtglistar_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            txtnome.Text = dtglistar.Rows[e.RowIndex].Cells[0].Value.ToString();
            txtendereco.Text = dtglistar.Rows[e.RowIndex].Cells[1].Value.ToString();
            txtcidade.Text = dtglistar.Rows[e.RowIndex].Cells[2].Value.ToString();
            cbxEstado.Text = dtglistar.Rows[e.RowIndex].Cells[3].Value.ToString();
            txttelefone.Text = dtglistar.Rows[e.RowIndex].Cells[4].Value.ToString();
            txtemail.Text = dtglistar.Rows[e.RowIndex].Cells[5].Value.ToString();
            txtLogin.Text = dtglistar.Rows[e.RowIndex].Cells[6].Value.ToString();
            txtSenha.Text = dtglistar.Rows[e.RowIndex].Cells[7].Value.ToString();
        }

        
    }
}