package hiber;
import java.awt.Button;
import java.awt.Color;
import java.awt.Frame;
import java.awt.Label;
import java.awt.TextArea;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.List;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import perst.*;

public class Search extends Frame implements ActionListener {
    TextArea textSearch;
    Button button_s;
    Laber7 fr;
    Label l1;
    public Search(Laber7 fr) {
        super("Search");
        setLayout(null);
        setBackground(new Color(182, 59, 59));
        setSize(600, 300);
        textSearch = new TextArea();
        button_s = new Button("Search!");
        add(textSearch);
        textSearch.setBounds(20, 100, 350, 50);
        add(button_s);
        button_s.setBounds(400, 50, 90, 20);
        button_s.addActionListener(this);
        l1 = new Label("Name");
        l1.setBounds(20, 40, 100, 10);
        add(l1);
        this.fr = fr;
        fr.setVisible(false);
        setVisible(true);
    }

    public void actionPerformed(ActionEvent ae) {
        String answer = "";
        fr.sessionFactory = new Configuration().configure().buildSessionFactory();
        fr.session = fr.sessionFactory.openSession();
        Transaction t = fr.session.beginTransaction();
        List<Object[]> result = fr.session.createSQLQuery("SELECT * FROM ROOT.STUDENT WHERE fio LIKE '%" + textSearch.getText() + "%'").list();
        for (Object[] st : result) {
            Stud student = new Stud((String) st[0], (int) st[1]);
            answer += student.getFio() + "    " + student.getAge() + "\n";
        }
        fr.textStudents.setText(answer);
        t.commit();
        setVisible(false);
        fr.setVisible(true);
    }
}
