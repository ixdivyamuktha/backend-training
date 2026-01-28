import java.util.*;
public class Prob2{
  public static void main(String args[]){
    Scanner sc=new Scanner(System.in);
    int n=sc.nextInt();
    int i=1;
    while(i<=n){
      System.out.println(i);
      i++;
    }
    for(int j=1;j<=n;j++){
      if(j%2==0){
        System.out.println(j);
      }
    }
    int sum=0;
    for(int j=1;j<=n;j++){
      sum+=j;
    }
    System.out.println(sum);

    sc.close();
  }
}