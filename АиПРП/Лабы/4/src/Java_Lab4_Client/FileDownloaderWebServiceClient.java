package Java_Lab4_Client;

import javax.swing.*;
import javax.swing.event.ListSelectionEvent;
import javax.swing.event.ListSelectionListener;
import javax.xml.namespace.QName;
import javax.xml.ws.Service;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;

import Java_Lab4_Server.FileDownloaderWebService;

public class FileDownloaderWebServiceClient extends JFrame implements ActionListener{
    JPanel list_panel = new JPanel();
    JPanel text_field_panel = new JPanel();
    ArrayList<String> catalog = new ArrayList<>();
    String string = new String();

    DefaultListModel list_model = new DefaultListModel();
    JList list = null;
    JTextArea text_field = new JTextArea();
    JButton get_catalog_button = new JButton("Get Files");
    JButton get_file_button = new JButton("Get Contents");
    JButton exit_button = new JButton("Exit");
    JScrollPane list_scrollPane, text_field_scrollPane;
    URL url;
    QName qname;
    Service service;
    FileDownloaderWebService service_instance;
    public FileDownloaderWebServiceClient() throws MalformedURLException
    {
        super("File Browser");
        setLayout(null);
        list = new JList(list_model);
        list.addListSelectionListener(new ListSelectionListener() {
            @Override
            public void valueChanged(ListSelectionEvent e) {
                if (!e.getValueIsAdjusting())
                {
                    string = list.getSelectedValue().toString();
                }
            }
        });
        list_scrollPane = new JScrollPane(list);
        list_panel.setLayout(new BorderLayout());
        list_panel.add(list_scrollPane, BorderLayout.CENTER);
        add(list_panel);
        list_panel.setBounds(0,0,400,200);
        text_field_scrollPane = new JScrollPane(text_field);
        text_field_panel.setLayout(new BorderLayout());
        text_field_panel.add(text_field_scrollPane, BorderLayout.CENTER);
        add(text_field_panel);
        text_field_panel.setBounds(0,200,400,200);
        setSize(415,500); //+15 to width to see ScrollPane
        add(get_catalog_button);
        add(get_file_button);
        add(exit_button);
        get_catalog_button.addActionListener(this);
        get_file_button.addActionListener(this);
        exit_button.addActionListener(this);
        get_catalog_button.setBounds(0,400,135,80);
        get_file_button.setBounds(135,400,135,80);
        exit_button.setBounds(270,400,130,80);
        setVisible(true);
        url = new URL("http://localhost:9000/services/webservice?wsdl");
        qname = new QName("http://Java_Lab4_Server/", "FileDownloaderWebServiceImplService");
        service = Service.create(url, qname);
        service_instance = service.getPort(FileDownloaderWebService.class);
    }
    public void actionPerformed(ActionEvent e)
    {
        if (e.getSource() == exit_button)
        {
            System.exit(0);
        }
        if (e.getSource() == get_catalog_button)
        {
            list_model.clear();
            catalog = service_instance.GetCatalog();
            for (int i = 0;i < catalog.size();i++)
            {
                string = catalog.get(i);
                list_model.addElement(string);
            }
        }
        if (e.getSource() == get_file_button)
        {
            string = service_instance.GetFile(string);
            text_field.setText(string);
        }
    }
    public static void main(String[] args) throws MalformedURLException
    {
        new FileDownloaderWebServiceClient();
    }
}