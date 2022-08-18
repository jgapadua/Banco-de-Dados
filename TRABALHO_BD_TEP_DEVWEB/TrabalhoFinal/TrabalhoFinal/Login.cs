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
    public partial class Login : Form
    {
        public Login()
        {
            InitializeComponent();
        }
        Login2 objlogin = new Login2();

        private void btnentrar_Click(object sender, EventArgs e)
        {
            if (objlogin.validarUsuario(txtlogin.Text, txtsenha.Text))
            {
                this.Visible = false;
                frmMenu menu = new frmMenu();
                menu.ShowDialog();
                this.Visible = true;
            }
            else
            {
                MessageBox.Show("Login ou senha invalido...", "ERRO LOGIN", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void btncadastrar_Click(object sender, EventArgs e)
        {
            frmCadastroEmpresa cadempresa = new frmCadastroEmpresa();
            cadempresa.ShowDialog();
        }
    }
}
