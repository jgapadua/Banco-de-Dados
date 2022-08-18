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
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }
        ConexaoBD bd = new ConexaoBD();
        string sql;
        DateTime data,data2;


        public void limpar()
        {
            txtcodigo.Clear();
            cbxtipo.SelectedIndex = -1;
            txtPreco.Clear();
            txtQuantidade.Clear();
            dtp_fabricacao.Text=DateTime.Now.ToString();
            dtp_validade.Text = DateTime.Now.ToString();     
           
        }
        public void Listar()
        {
            sql = "Select * from produtos";
            dtglistar.DataSource = bd.ConsultarDados(sql);

        }

        private void Form1_Load(object sender, EventArgs e)
        {
            Listar();
        }

        private void btnconfirmar_Click(object sender, EventArgs e)
        {
            data= DateTime.Parse(dtp_fabricacao.Text);
            data2 = DateTime.Parse(dtp_validade.Text);

            sql = string.Format("insert into produtos values(null,'{0}','{1}','{2}','{3}','{4}')", cbxtipo.Text, txtPreco.Text, txtQuantidade.Text, data.ToString("yyyy-MM-dd"), data2.ToString("yyyy-MM-dd"));
            bd.AlterarDados(sql);
            MessageBox.Show("Cadastro do Produto efetuado com sucesso!", "Produto", MessageBoxButtons.AbortRetryIgnore, MessageBoxIcon.Information);
            limpar();
            Listar();
        }

        private void btnvoltar_Click(object sender, EventArgs e)
        {
            this.Close();
        }

      
        private void dtglistar_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            txtcodigo.Text = dtglistar.Rows[e.RowIndex].Cells[0].Value.ToString();
            cbxtipo.Text = dtglistar.Rows[e.RowIndex].Cells[1].Value.ToString();
            txtPreco.Text = dtglistar.Rows[e.RowIndex].Cells[2].Value.ToString();
            txtQuantidade.Text = dtglistar.Rows[e.RowIndex].Cells[3].Value.ToString();
            dtp_fabricacao.Text = dtglistar.Rows[e.RowIndex].Cells[4].Value.ToString();
            dtp_validade.Text = dtglistar.Rows[e.RowIndex].Cells[5].Value.ToString();
           
        }

     
    }
}

