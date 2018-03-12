/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com;

import java.util.List;
import javax.ejb.Remote;


 
 @Remote
public interface EJBLabRemote {
    String getStudentInfo(String fio);
    void addStudent(String fio, String department, String group);
    void deleteStudent(String fio);
    List<Student> getAllStudents();
    List<Student> getStudentsByGroup(String group);
    List<Student> getStudentsByDepartment(String department);
    Student getStudent(String fio);
    

}
