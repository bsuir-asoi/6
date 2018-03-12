/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejbclient;


import com.EJBLabRemote;
import com.Student;
import java.util.List;
import javax.ejb.EJB;


public class Main {

    @EJB
    private static EJBLabRemote labRemote;

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        labRemote.addStudent("Ivanov", "KSIS", "10");
        labRemote.addStudent("Petrov", "FITU", "10");
        labRemote.addStudent("Sidorov", "FTK", "12");
        labRemote.addStudent("Einstein", "KSIS", "12");
        labRemote.addStudent("Newton", "FITU", "14");

        System.out.println(labRemote.getStudentInfo("Newton"));
        
System.out.println("__________________________________");
        List<Student> studentsFromGroup = labRemote.getStudentsByGroup("12");
        for (Student student : studentsFromGroup) {
            System.out.println(student.getFio());
        }
System.out.println("__________________________________");
        List<Student> studentsFromDepartment = labRemote.getStudentsByDepartment("FITU");
        for (Student student : studentsFromDepartment) {
            System.out.println(student.getFio());
        }
 System.out.println("__________________________________");
        
        List<Student> allStudents = labRemote.getAllStudents();
        for (Student student : allStudents) {
            System.out.println(student.getFio());
        }
        
 System.out.println("__________________________________");       
         labRemote.deleteStudent("Einstein");
         
        
 System.out.println("__________________________________");
 
 allStudents = labRemote.getAllStudents();
 for (Student student : allStudents) {
            System.out.println(student.getFio());
        }
 
        
    }
    
}
