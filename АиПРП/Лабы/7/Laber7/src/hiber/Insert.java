package hiber;
import java.awt.Button;
import java.awt.Color;
import java.awt.Frame;
import java.awt.Label;
import java.awt.TextArea;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import perst.*;

public class Insert extends Frame implements ActionListener {

    TextArea textFio;
    TextArea textAge;
    Button button_i;
    Laber7 fr;
    Label l1;
    Label l2;
    
    public Insert(Laber7 fr) {
        super("Insert");
        setLayout(null);
        setBackground(new Color(182, 59, 59));
        setSize(500, 300);
        textFio = new TextArea();
        textAge = new TextArea();
        button_i = new Button("Insert");
        add(textFio);
        textFio.setBounds(20, 70, 350, 50);
        add(textAge);
        textAge.setBounds(20, 160, 350, 50);
        add(button_i);
        button_i.setBounds(400, 50, 90, 20);
        button_i.addActionListener(this);
        l1 = new Label("Name");
        l2 = new Label("Age");
        l1.setBounds(20, 40, 100, 10);
        l2.setBounds(20, 130, 100, 10);
        add(l1);
        add(l2);
        this.fr = fr;
        fr.setVisible(false);
        setVisible(true);
    }

    public void actionPerformed(ActionEvent ae) {
        
        fr.sessionFactory = new Configuration().configure().buildSessionFactory();
        fr.session = fr.sessionFactory.openSession();
       
        Transaction t = fr.session.beginTransaction();
        fr.session.createSQLQuery("INSERT INTO ROOT.STUDENT VALUES ('" + textFio.getText() + "', " + Integer.parseInt(textAge.getText()) + ")").executeUpdate();
        t.commit();
        setVisible(false);
        fr.setVisible(true);
        fr.getAll();
    }
}
