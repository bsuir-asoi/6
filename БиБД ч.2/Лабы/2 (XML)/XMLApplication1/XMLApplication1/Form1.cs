using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.OleDb;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Xml.Linq;
using System.Xml;
using System.IO;
using ADOX;
using ADODB;
namespace XMLApplication1
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }


        private void button1_Click_1(object sender, EventArgs e)
        {
            dGrid.Rows.Clear();
            XDocument myXML = XDocument.Load("Product.xml");
            var st = from sp in myXML.Descendants("Product")
                     select new
                     {
                         Id=sp.Element("id").Value,
                         Name = sp.Element("name").Value,
                         Price = sp.Element("price").Value,
                         Count = sp.Element("count").Value
                     };
            foreach (var x in st)
            {
                dGrid.Rows.Add(x.Id, x.Name, x.Price, x.Count);
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            List<XElement> columns = new List<XElement>();
            bool bl = true;
            XDocument myXML = new XDocument(new XDeclaration("1.0", "UTF-8", "yes"),
                new XElement("Table"));
            for (int i = 0; i < dGrid1.Rows.Count - 1; i++)
            {
                if (dGrid1.Rows[i].Cells[0].Value == null || dGrid1.Rows[i].Cells[1].Value == null || dGrid1.Rows[i].Cells[2].Value == null || dGrid1.Rows[i].Cells[3].Value == null)
                {
                    MessageBox.Show("Не заполнены все поля");
                    bl = false;
                }
                else
                {
                    for (int j = 0; j < dGrid1.Columns.Count; j++)
                    {
                        columns.Add(new XElement(dGrid1.Columns[j].HeaderText, dGrid1.Rows[i].Cells[j].Value));
                        myXML.Element("Table").Add(columns[j]);
                    }
                }
            }
            if (bl)
            {
                myXML.Save("d:\\Product.xml");
                MessageBox.Show("XML файл создан: d:\\Product.xml");
            }
        }

        private void button3_Click(object sender, EventArgs e)
        {
            System.Diagnostics.Process.Start("Product.xml");
        }

        private void button4_Click(object sender, EventArgs e)
        {
            Form2 subForm = new Form2(this,"Product.xml");
            subForm.Show();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            XDocument myXML = XDocument.Load("Product.xml");
            IEnumerable<XElement> elements =
                from ew in myXML.Descendants("Product")
                where ((string)ew.Element("id")) == textBox1.Text
                select ew;
            elements.Remove();
            myXML.Save("Product.xml");
            
        }

        private void button6_Click(object sender, EventArgs e)
        {
            dGrid.Rows.Clear();
            XDocument myXML = XDocument.Load("Product.xml");
            var st = from sp in myXML.Descendants("Product")
                     where sp.Element("name").Value.IndexOf(textBox2.Text) > -1//sp.Element("name").Value == textBox2.Text
                     select new
                     {
                         Id = sp.Element("id").Value,
                         Name = sp.Element("name").Value,
                         Price = sp.Element("price").Value,
                         Count = sp.Element("count").Value
                     };
            foreach (var x in st)
            {
                dGrid.Rows.Add(x.Id, x.Name, x.Price, x.Count);
            }
        }

        private void button7_Click(object sender, EventArgs e)
        {
            if (textBox3.Text != "" && textBox4.Text != "")
            {
                bool bl = false;
                XDocument myXML = XDocument.Load("Product.xml");
                foreach (XElement el in myXML.Root.Elements("Product"))
                {
                    if (el.Element("id").Value == textBox4.Text)
                    {
                        if (radioButton1.Checked) el.SetElementValue("price", textBox3.Text);
                        else el.SetElementValue("count", textBox3.Text);
                        bl = true;
                    }
                }
                if (bl) myXML.Save("Product.xml");
                else MessageBox.Show("Товар с ID "+textBox4.Text + " не найден");
            }
            else MessageBox.Show("Не заполнены все поля");
        }


        private void button9_Click(object sender, EventArgs e)
        {
            //openFileDialog1.Filter = "XML file|*.xml";
            //if (openFileDialog1.ShowDialog() == DialogResult.OK)
            //{
            //    OleDbConnection con = new OleDbConnection();
            //    con.ConnectionString =
            //        "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=d:\\Product.mdb";
            //    OleDbCommand cmd;
            //    OleDbDataAdapter da = new OleDbDataAdapter("Select * from Product",con );
            //    DataSet ds = new DataSet();
            //    XmlReader xmlr = XmlReader.Create(openFileDialog1.FileName,new XmlReaderSettings());
            //    ds.ReadXml(xmlr);
            //    con.Open();
            //    string sql;
            //    int id;
            //    string name;
            //    int price;
            //    int count;
            //    using (new OleDbCommandBuilder(da))
            //    {
            //        da.Update(ds);
            //    }
            //   // sql = "CREATE TABLE Table (Code INTEGER, Name CHAR(30),Address CHAR (30))";
            //   // cmd = new OleDbCommand(sql, con);
            //   // da.InsertCommand = cmd;
            //   // da.InsertCommand.ExecuteNonQuery();
            //   //// ds.Tables.
            //   // for (int i = 0; i<ds.Tables[0].Rows.Count-1; i++)
            //   // {

            //   //     id=Convert.ToInt32(ds.Tables[0].Rows[i].ItemArray[0]);
            //   //     name =Convert.ToString( ds.Tables[0].Rows[i].ItemArray[1]);
            //   //     price=Convert.ToInt32(ds.Tables[0].Rows[i].ItemArray[2]);
            //   //     count=Convert.ToInt32(ds.Tables[0].Rows[i].ItemArray[3]);
            //   //     sql="Insert into Product values ("+id+",'"+name+"',"+price+","+count+")";
            //   //     cmd = new OleDbCommand(sql,con);
            //   //     da.InsertCommand=cmd;
            //   //     da.InsertCommand.ExecuteNonQuery();
            //   // }
            //    con.Close();
            openFileDialog1.Filter = "XML file|*.xml";
            if (openFileDialog1.ShowDialog() == DialogResult.OK)
            {
                OleDbConnection con = new OleDbConnection();
                con.ConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source=d:\\Product.mdb";
                OleDbDataAdapter sda = new OleDbDataAdapter();
                DataSet ds = new DataSet();
                XmlReader xmlr = XmlReader.Create(openFileDialog1.FileName, new XmlReaderSettings());
                ds.ReadXml(xmlr);
                int n = ds.Tables[0].Columns.Count;
                con.Open();

                StringBuilder query = new StringBuilder();
                query.Append("CREATE TABLE ");
                query.Append(ds.Tables[0].TableName);
                query.Append(" ( ");
                for (int i = 0; i < n; i++)
                {

                    query.Append("[");
                    query.Append(ds.Tables[0].Columns[i].ColumnName);
                    query.Append("] ");
                 
                    query.Append("varchar(30)");
                    query.Append(", ");

                }
                query.Length -= 2;
                query.Append(");");
                OleDbCommand sqlQuery = new OleDbCommand(query.ToString(), con);
                //sqlQuery.ExecuteNonQuery();
                //sqlQuery.Connection.Open();
                sqlQuery.ExecuteNonQuery();
                for (int i = 0; i < ds.Tables[0].Rows.Count ; i++)
                {
                    StringBuilder sql = new StringBuilder();
                    sql.Append("INSERT INTO ");
                    sql.Append(ds.Tables[0].TableName);
                    sql.Append(" ");
                    sql.Append("( ");

                    for (int k = 0; k < n; k++)
                    {

                        sql.Append("[");
                        sql.Append(ds.Tables[0].Columns[k].ColumnName);
                        sql.Append("] ");
                        sql.Append(", ");

                    }
                    sql.Length -= 2;
                    sql.Append(")");
                    sql.Append(" values ( ");

                    for (int j = 0; j < n; j++)
                    {
                        sql.Append("'");
                        sql.Append(ds.Tables[0].Rows[i].ItemArray[j]);
                        sql.Append("'");
                        sql.Append(" , ");
                    }
                    sql.Length -= 2;
                    sql.Append(");");
                    OleDbCommand sqlQuery1 = new OleDbCommand(sql.ToString(), con);
                    sqlQuery1.ExecuteNonQuery();

                }
                con.Close();
                MessageBox.Show("Access файл создан");
            }
        }

        private void button8_Click(object sender, EventArgs e)
        {
            openFileDialog1.Filter = "Acces DB|*.mdb";
            if (openFileDialog1.ShowDialog() == DialogResult.OK)
            {
                // create a connection
                OleDbConnection con = new OleDbConnection();
                con.ConnectionString =
                    "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + openFileDialog1.FileName;
                // create a data adapter
                con.Open();
                DataTable tbls = con.GetSchema("Tables", new string[] { null, null, null, "TABLE" });
                foreach (DataRow row in tbls.Rows)
                {
                    string TableName = row["TABLE_NAME"].ToString();
                    comboBox1.Items.Add(TableName);
                }
                con.Close();
                comboBox1.SelectedIndex = 0;
                //OleDbDataAdapter da = new OleDbDataAdapter("Select * from stud", con);

                //DataSet ds = new DataSet();

                //da.Fill(ds, "Table");

                //ds.WriteXml("D:\\stud.xml");
                //MessageBox.Show("XML файл создан: d:\\stud.xml");
            }
        }

        private void button10_Click(object sender, EventArgs e)
        {

                 OleDbConnection con = new OleDbConnection();
                 con.ConnectionString =
                     "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + openFileDialog1.FileName;

                 con.Open();
                 OleDbDataAdapter da = new OleDbDataAdapter("Select * from "+comboBox1.SelectedItem, con);
                 DataSet ds = new DataSet();
                 da.Fill(ds, ""+comboBox1.SelectedItem);
                 ds.WriteXml("D:\\"+comboBox1.SelectedItem+".xml");
                 MessageBox.Show("XML файл создан: D:\\" + comboBox1.SelectedItem + ".xml");
                 con.Close();
        }

        private void button11_Click(object sender, EventArgs e)
        {
            OpenFileDialog openFileDialog = new OpenFileDialog();
            openFileDialog.Filter = "XML file|*.xml";
            if (openFileDialog.ShowDialog() == DialogResult.OK)
            {
                string nametag = "nametag";
                string name = "name";
                XmlDocument doc = new XmlDocument();
                doc.Load(openFileDialog.FileName);
                //string namet = doc.DocumentElement.Name;
                string namet = doc.ParentNode.Name;
                MessageBox.Show("" + doc.DocumentElement.Value);
                XmlNode firstNode = doc.SelectSingleNode(namet);
                XmlNode stud = doc.CreateElement(nametag);
                stud.InnerText = name;
                firstNode.AppendChild(stud);
                doc.Save(openFileDialog.FileName);
                MessageBox.Show("Запись добавлеена", "Добавление", MessageBoxButtons.OK);
            }
        }

        private void tabPage1_Click(object sender, EventArgs e)
        {

        }

        private void addColButton_Click(object sender, EventArgs e)
        {
            if (colName.Text != String.Empty)
            {
                dGrid1.ColumnCount++;
                dGrid1.Columns[dGrid1.ColumnCount - 1].Name = colName.Text;
            }
            else { MessageBox.Show("Дурак, введи имя колонки"); }
            

        }

        private int CheckExistingOfColumn(string name)
        {
            for (int i = 0; i < dGrid1.Columns.Count; i++ )
                if (name == dGrid1.Columns[i].HeaderText)
                    return i;
            return -1;
           
        }

        private void editColumn_Click(object sender, EventArgs e)
        {
            int i = CheckExistingOfColumn(columnNumber.Text);
            if (columnNumber.Text != String.Empty && i > -1 && colName.Text != String.Empty)
            {
                dGrid1.Columns[i].HeaderText = colName.Text;
            }
            else
            {
                MessageBox.Show("Дурак, введи имя колонки");
            }
        }





    }
}




