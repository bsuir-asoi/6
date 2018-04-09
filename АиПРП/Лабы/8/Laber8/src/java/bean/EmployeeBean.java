package bean;

import entity.Employee;

import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import java.util.ArrayList;
import java.util.List;

@ManagedBean
@SessionScoped
//экземпляр должен сохраняться на протяжении всего сеанса
public class EmployeeBean {

    private List<Employee> employees = new ArrayList<Employee>();
    private Employee searchedEmployee;
    private String searchedName;
    private String name;
    private String department;
    private String address;
    private int salary;


    public void addEmployee() {
        Employee employee = new Employee();
        employee.setName(name);
        employee.setAddress(address);
        employee.setDepartment(department);
        employee.setSalary(salary);
        employees.add(employee);
    }

    public void deleteEmployee(Employee employee) {
        employees.remove(employee);
    }

    public void getEmployeeByName() {
        for (Employee employee : employees) {
            if (employee.getName().equalsIgnoreCase(searchedName)) {
                this.searchedEmployee = employee;
            }
        }
    }

    public void setEmployees(List<Employee> employees) {
        this.employees = employees;
    }

    public String getSearchedName() {
        return searchedName;
    }

    public void setSearchedName(String searchedName) {
        this.searchedName = searchedName;
    }

    public String getName() {
        return name;
    }

    public String getDepartment() {
        return department;
    }

    public String getAddress() {
        return address;
    }

    public int getSalary() {
        return salary;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setSalary(int salary) {
        this.salary = salary;
    }

    public List<Employee> getEmployees() {
        return employees;
    }

    public void setSearchedEmployee(Employee searchedEmployee) {
        this.searchedEmployee = searchedEmployee;
    }

    public Employee getSearchedEmployee() {
        return searchedEmployee;
    }
}
