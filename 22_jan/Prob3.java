import java.util.*;
public class Prob3{
  public static void main(String args[]){
    Prob3 p=new Prob3();
    Scanner sc=new Scanner(System.in);
    int a=sc.nextInt();
    int b=sc.nextInt();
    System.out.println(p.add(a,b));
    System.out.println(p.isEven(a));
    System.out.println(p.findFactorial(b));
    sc.close();
  }
  public int add(int a, int b){
     return a+b;
  }
  public boolean isEven(int n){
    return n%2==0;
  }
  public int findFactorial(int n){
    int f=1;
    for(int i=1;i<=n;i++){
      f*=i;
    }
    return f;
  }

}