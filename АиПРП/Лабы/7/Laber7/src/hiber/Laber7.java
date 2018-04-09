package hiber;

import org.hibernate.Transaction;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import java.util.List;
import org.hibernate.Session;
import java.awt.*;
import java.awt.event.*;
import perst.*;


public class Laber7 extends Frame implements ActionListener {

    public SessionFactory sessionFactory=null;
    public Session session = null;
    Button buttonExit = new Button("Exit");
    Button buttonGetAll = new Button("Get all students");
    Button buttonInsert = new Button("Insert");
    Button buttonDelete = new Button("Delete");
    Button buttonSearch = new Button("Search");
    TextArea textStudents = new TextArea();

    public Laber7() {
        super("Hibernate");
        setLayout(null);
        setBackground(new Color(182, 59, 59));
        setSize(1000, 500);

        add(buttonGetAll);
        buttonGetAll.setBounds(20, 400, 160, 30);
        buttonGetAll.addActionListener(this);
        add(buttonInsert);
        buttonInsert.setBounds(400, 400, 160, 30);
        buttonInsert.addActionListener(this);
        add(buttonDelete);
        buttonDelete.setBounds(600, 400, 160, 30);
        buttonDelete.addActionListener(this);
        add(buttonSearch);
        buttonSearch.setBounds(800, 400, 160, 30);
        buttonSearch.addActionListener(this);
        add(buttonExit);
        buttonExit.setBounds(200, 400, 160, 30);
        buttonExit.addActionListener(this);
        add(textStudents);
        textStudents.setBounds(20, 50, 500, 300);
        textStudents.setText("Existing students");
        this.setLocationRelativeTo(null);
       getAll();  
        setVisible(true);
    }

    public void actionPerformed(ActionEvent ae) {
        if (ae.getSource() == buttonExit) {
            System.exit(0);
        } else {
            if (ae.getSource() == buttonGetAll) {
                getAll();
            } else {
                if (ae.getSource() == buttonInsert) {
                    new Insert(this);
                } else {
                    if (ae.getSource() == buttonDelete) {
                        new Delete(this);
                    } else {
                        new Search(this);
                    }
                }
            }
        }
    }

    public void getAll() {
        String answer = "";
        //Configuration().configure()--зачитывается hibernate.cfg.xml
        //приложение получает фабрику (factory) для экземпляров класса Session
        sessionFactory = new Configuration().configure().buildSessionFactory();
        
        //Create database connection and open a Session on it.
        //The main runtime interface between a Java application and Hibernate.
        //This is the central API class abstracting the notion of a persistence service.
        session = sessionFactory.openSession();
        //далее возвращаем ссылку на коллекцию, но не ждём её загрузки. 
        //Выполняем транзакцию, чтобы данные успели загрузиться
        //Позволяет приложению определять единицы работы
        Transaction t = session.beginTransaction();
        List<Object[]> result = session.createSQLQuery("SELECT * FROM ROOT.STUDENT").list();
        //заносим данные в строку
        for (Object[] st : result) {
            Stud student = new Stud((String) st[0], (int) st[1]);
            answer += student.getFio() + "    " + student.getAge() + "\n";
        }
        textStudents.setText(answer);
        //Сброс связанного сеанса и завершение единицы работы
        t.commit();
    }

    public static void main(String[] args) {
        Laber7 fr = new Laber7();
    }
}
