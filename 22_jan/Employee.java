import java.util.*;
public class Employee{
  int id,monthlySalary;
  static String companyName;
  public Employee(int id, int monthlySalary){
      this.id=id;
      this.monthlySalary=monthlySalary;
  }
  public int calculateAnnualSalary(int monthlySalary){
    return monthlySalary*12;
  }
  public void displayEmployeeDetails(int id, int monthlySalary){
    System.out.println("Employee ID: "+id);
    System.out.println("Monthly Salary: "+monthlySalary);
    System.out.println("Annual Salary: "+calculateAnnualSalary(monthlySalary));
    System.out.println("Company Name: "+companyName);
  }
  public static void main(String args[]){
    Scanner sc=new Scanner(System.in);
    companyName="Abc";
    Employee e1=new Employee(101, 5000);
    e1.displayEmployeeDetails(e1.id, e1.monthlySalary);
    Employee e2=new Employee(102, 7000);
    e2.displayEmployeeDetails(e2.id, e2.monthlySalary);
    sc.close();
  }
}