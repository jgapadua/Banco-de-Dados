namespace TrabalhoFinal
{
    partial class Form1
    {
        /// <summary>
        /// Variável de designer necessária.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Limpar os recursos que estão sendo usados.
        /// </summary>
        /// <param name="disposing">true se for necessário descartar os recursos gerenciados; caso contrário, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Código gerado pelo Windows Form Designer

        /// <summary>
        /// Método necessário para suporte ao Designer - não modifique 
        /// o conteúdo deste método com o editor de código.
        /// </summary>
        private void InitializeComponent()
        {
            this.lblpreco = new System.Windows.Forms.Label();
            this.backgroundWorker1 = new System.ComponentModel.BackgroundWorker();
            this.txtcodigo = new System.Windows.Forms.TextBox();
            this.dtp_fabricacao = new System.Windows.Forms.DateTimePicker();
            this.lblselecione = new System.Windows.Forms.Label();
            this.lblcodigo = new System.Windows.Forms.Label();
            this.lbldata = new System.Windows.Forms.Label();
            this.cbxtipo = new System.Windows.Forms.ComboBox();
            this.btnconfirmar = new System.Windows.Forms.Button();
            this.dtglistar = new System.Windows.Forms.DataGridView();
            this.btnvoltar = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.dtp_validade = new System.Windows.Forms.DateTimePicker();
            this.label2 = new System.Windows.Forms.Label();
            this.txtPreco = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.txtQuantidade = new System.Windows.Forms.TextBox();
            ((System.ComponentModel.ISupportInitialize)(this.dtglistar)).BeginInit();
            this.SuspendLayout();
            // 
            // lblpreco
            // 
            this.lblpreco.AutoSize = true;
            this.lblpreco.Location = new System.Drawing.Point(125, 125);
            this.lblpreco.Name = "lblpreco";
            this.lblpreco.Size = new System.Drawing.Size(0, 13);
            this.lblpreco.TabIndex = 2;
            // 
            // txtcodigo
            // 
            this.txtcodigo.Enabled = false;
            this.txtcodigo.Location = new System.Drawing.Point(310, 35);
            this.txtcodigo.Name = "txtcodigo";
            this.txtcodigo.Size = new System.Drawing.Size(123, 20);
            this.txtcodigo.TabIndex = 4;
            // 
            // dtp_fabricacao
            // 
            this.dtp_fabricacao.Location = new System.Drawing.Point(38, 74);
            this.dtp_fabricacao.Name = "dtp_fabricacao";
            this.dtp_fabricacao.Size = new System.Drawing.Size(249, 20);
            this.dtp_fabricacao.TabIndex = 5;
            // 
            // lblselecione
            // 
            this.lblselecione.AutoSize = true;
            this.lblselecione.Location = new System.Drawing.Point(35, 18);
            this.lblselecione.Name = "lblselecione";
            this.lblselecione.Size = new System.Drawing.Size(103, 13);
            this.lblselecione.TabIndex = 6;
            this.lblselecione.Text = "Selecione o Produto";
            // 
            // lblcodigo
            // 
            this.lblcodigo.AutoSize = true;
            this.lblcodigo.Location = new System.Drawing.Point(307, 18);
            this.lblcodigo.Name = "lblcodigo";
            this.lblcodigo.Size = new System.Drawing.Size(95, 13);
            this.lblcodigo.TabIndex = 7;
            this.lblcodigo.Text = "Código do Produto";
            // 
            // lbldata
            // 
            this.lbldata.AutoSize = true;
            this.lbldata.Location = new System.Drawing.Point(35, 58);
            this.lbldata.Name = "lbldata";
            this.lbldata.Size = new System.Drawing.Size(86, 13);
            this.lbldata.TabIndex = 8;
            this.lbldata.Text = "Data Fabricação";
            // 
            // cbxtipo
            // 
            this.cbxtipo.FormattingEnabled = true;
            this.cbxtipo.Items.AddRange(new object[] {
            "Linguiça de Camarão",
            "Linguiça de Jacaré",
            "Linguiça de Salmão",
            "Linguiça de Tilápia",
            "",
            ""});
            this.cbxtipo.Location = new System.Drawing.Point(38, 34);
            this.cbxtipo.Name = "cbxtipo";
            this.cbxtipo.Size = new System.Drawing.Size(132, 21);
            this.cbxtipo.TabIndex = 9;
            // 
            // btnconfirmar
            // 
            this.btnconfirmar.Location = new System.Drawing.Point(7, 322);
            this.btnconfirmar.Name = "btnconfirmar";
            this.btnconfirmar.Size = new System.Drawing.Size(189, 34);
            this.btnconfirmar.TabIndex = 10;
            this.btnconfirmar.Text = "Confirmar";
            this.btnconfirmar.UseVisualStyleBackColor = true;
            
            // 
            // dtglistar
            // 
            this.dtglistar.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dtglistar.Location = new System.Drawing.Point(7, 165);
            this.dtglistar.Name = "dtglistar";
            this.dtglistar.Size = new System.Drawing.Size(595, 151);
            this.dtglistar.TabIndex = 11;
            // 
            // btnvoltar
            // 
            this.btnvoltar.Location = new System.Drawing.Point(413, 322);
            this.btnvoltar.Name = "btnvoltar";
            this.btnvoltar.Size = new System.Drawing.Size(189, 34);
            this.btnvoltar.TabIndex = 12;
            this.btnvoltar.Text = "Voltar";
            this.btnvoltar.UseVisualStyleBackColor = true;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(307, 58);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(89, 13);
            this.label1.TabIndex = 14;
            this.label1.Text = "Data de Validade";
            // 
            // dtp_validade
            // 
            this.dtp_validade.Location = new System.Drawing.Point(310, 74);
            this.dtp_validade.Name = "dtp_validade";
            this.dtp_validade.Size = new System.Drawing.Size(249, 20);
            this.dtp_validade.TabIndex = 13;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(35, 105);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(90, 13);
            this.label2.TabIndex = 16;
            this.label2.Text = "Preço do Produto";
            // 
            // txtPreco
            // 
            this.txtPreco.Location = new System.Drawing.Point(38, 122);
            this.txtPreco.Name = "txtPreco";
            this.txtPreco.Size = new System.Drawing.Size(123, 20);
            this.txtPreco.TabIndex = 15;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(307, 105);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(117, 13);
            this.label3.TabIndex = 18;
            this.label3.Text = "Quantidade de Produto";
            // 
            // txtQuantidade
            // 
            this.txtQuantidade.Location = new System.Drawing.Point(310, 122);
            this.txtQuantidade.Name = "txtQuantidade";
            this.txtQuantidade.Size = new System.Drawing.Size(123, 20);
            this.txtQuantidade.TabIndex = 17;
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(614, 363);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.txtQuantidade);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.txtPreco);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.dtp_validade);
            this.Controls.Add(this.btnvoltar);
            this.Controls.Add(this.dtglistar);
            this.Controls.Add(this.btnconfirmar);
            this.Controls.Add(this.cbxtipo);
            this.Controls.Add(this.lbldata);
            this.Controls.Add(this.lblcodigo);
            this.Controls.Add(this.lblselecione);
            this.Controls.Add(this.dtp_fabricacao);
            this.Controls.Add(this.txtcodigo);
            this.Controls.Add(this.lblpreco);
            this.Name = "Form1";
            this.Text = "Cadastro Produto";
            this.Load += new System.EventHandler(this.Form1_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dtglistar)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private System.Windows.Forms.Label lblpreco;
        private System.ComponentModel.BackgroundWorker backgroundWorker1;
        private System.Windows.Forms.TextBox txtcodigo;
        private System.Windows.Forms.DateTimePicker dtp_fabricacao;
        private System.Windows.Forms.Label lblselecione;
        private System.Windows.Forms.Label lblcodigo;
        private System.Windows.Forms.Label lbldata;
        private System.Windows.Forms.ComboBox cbxtipo;
        private System.Windows.Forms.Button btnconfirmar;
        private System.Windows.Forms.DataGridView dtglistar;
        private System.Windows.Forms.Button btnvoltar;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.DateTimePicker dtp_validade;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox txtPreco;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox txtQuantidade;
    }
}

