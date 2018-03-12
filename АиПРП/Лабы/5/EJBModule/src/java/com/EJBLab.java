/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com;

import java.util.List;
import javax.ejb.Stateless;
import java.util.ArrayList;


@Stateless
public class EJBLab implements EJBLabRemote {

    private List<Student> students = new ArrayList<>();

    @Override
    public String getStudentInfo(String fio) {
        for (Student student : students) {
            if (student.getFio().equals(fio)) {
                return "FIO: " + student.getFio()
                        + ", department: " + student.getDepartment()
                        + ", group: " + student.getGroup();
            }
        }
        return null;
    }

             
    
    @Override
    public void addStudent(String fio, String department, String group) {
        Student student = new Student(fio, department, group);
        students.add(student);
    }

    @Override
    public void deleteStudent(String name) {
         System.out.println("Delete "+name);
         for (Student student : students) {
            if(student.getFio().equals(name)) students.remove(student); }
        
        System.out.println("OK");
    }

    @Override
    public List<Student> getAllStudents() {
        return students;
    }

    @Override
    public List<Student> getStudentsByGroup(String group) {
        List<Student> studentsFromGroup = new ArrayList<>();
        for (Student student : students) {
            if (student.getGroup().equals(group)) {
                studentsFromGroup.add(student);
            }
        }
        return studentsFromGroup;
    }

    @Override
    public List<Student> getStudentsByDepartment(String department) {
        List<Student> studentsFromDepartment = new ArrayList<>();
        for (Student student : students) {
            if (student.getDepartment().equals(department)) {
                studentsFromDepartment.add(student);
            }
        }
        return studentsFromDepartment;
    }

    @Override
    public Student getStudent(String fio) {
        for (Student student : students) {
            if (student.getFio().equals(fio)) {
                return student;
            }
        }
        return null;
    }

    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")
}
