using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Xml;
using System.Xml.Linq;
using System.Windows.Forms;

namespace XMLApplication1
{
    public partial class Form2 : Form
    {
        Form1 mainForm;
        String xml_file;
        public Form2()
        {
            InitializeComponent();
        }
        public Form2(Form1 mainForm, String path)
        {
            xml_file = path;
            this.mainForm = mainForm;
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (textBox1.Text == "" || textBox2.Text == "" || textBox3.Text == "" || textBox4.Text == "")
            {
                MessageBox.Show("Заполнены не все поля");
            }
            else
            {
                XDocument myXML = XDocument.Load("Product.xml");
                myXML.Element("Table").Add(
                    new XElement("Product",
                        new XElement("id", textBox1.Text),
                        new XElement("name", textBox2.Text),
                        new XElement("price", textBox3.Text),
                        new XElement("count", textBox4.Text)));
                myXML.Save("Product.xml");
                MessageBox.Show("Запись добавлена");
                this.Close();
            }
        }
    }
}
