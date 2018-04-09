package perst;

import java.io.*;
 
 public class Stud implements Serializable{
  
   private String fio;
   private int age;
 
   public Stud() {}
 
   public Stud(String name, int g) {
       this.fio = name;
       this.age = g;
   }
    public void setFio(String name) {
        this.fio = name;
    }
     public int getAge() {
        return age;
    }
 
    public String getFio() {
        return fio;
    }
    public void setAge(int g) {
        this.age = g;
    }
}