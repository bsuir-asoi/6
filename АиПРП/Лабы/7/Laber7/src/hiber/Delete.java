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

public class Delete extends Frame implements ActionListener {
//TODO: change SQL command 
    TextArea textDelete;
    Button button_d;
    Button button_exit;
    Laber7 fr;
    Label l1;
    
    public Delete(Laber7 fr) {
        super("Delete");
        setLayout(null);
        setBackground(new Color(182, 59, 59));
        setSize(500, 100);
        textDelete = new TextArea();
        button_d = new Button("Delete");
        button_exit = new Button("Exit");
        add(textDelete);
        textDelete.setBounds(20, 40, 350, 50);
        add(button_d);
        add(button_exit);
        button_d.setBounds(400, 40, 90, 20);
        button_d.addActionListener(this);
        button_exit.setBounds(400, 70, 90, 20);
        button_exit.addActionListener(this);
        l1 = new Label("Name");
        l1.setBounds(20, 30, 100, 10);
        add(l1);
        this.fr = fr;
        fr.setVisible(false);
        setVisible(true);
    }

    @Override
    public void actionPerformed(ActionEvent ae) {if(ae.getSource()== button_d){
        fr.sessionFactory = new Configuration().configure().buildSessionFactory();
        fr.session = fr.sessionFactory.openSession();
        Transaction t = fr.session.beginTransaction();
        fr.session.createSQLQuery("DELETE FROM ROOT.STUDENT WHERE fio ='" + textDelete.getText() + "'").executeUpdate();
        t.commit();
        setVisible(false);
        fr.setVisible(true);
        fr.getAll();
    }else if(ae.getSource() == button_exit){
            setVisible(false);
            fr.setVisible(true);
        }
    }
}
