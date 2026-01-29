/*Problem-2
Given an array of employee names (with duplicates):
Convert array → ArrayList
Remove duplicates using HashSet
Create a HashMap<String, Integer> for frequency count
Display data using multiple iteration techniques
Must Use
✔ Arrays
✔ ArrayList
✔ HashSet
✔ HashMap
✔ Iterators and enhanced for-loop
✔ equals() internally (HashSet behavior) */
import java.util.*;
// import java.io.*;

public class Prob2 {
  public static void main(String args[]){
    Scanner sc=new Scanner(System.in);
    int n=sc.nextInt();
    String [] a=new String[n];
    for(int i=0;i<n;i++){
      a[i]=sc.next();
    }
    ArrayList<String> st=new ArrayList<>(Arrays.asList(a));
    HashSet<String> hs=new HashSet<>();
    for(int i=0;i<n;i++){
      if(!hs.contains(st.get(i))){
        hs.add(st.get(i));
      }
    }
    HashMap<String, Integer> hm=new HashMap<>();
    for(int i=0;i<n;i++){
      hm.put(st.get(i),hm.getOrDefault(st.get(i),0 )+1);
    }
    for(int i=0;i<n;i++){
      System.out.println(st.get(i));
    }
    for (String string : hs) {
    System.out.println(string);
    }
    Iterator<String> it = st.iterator();
    while (it.hasNext()) {
      String name = it.next();
      System.out.println(name);
    }
    sc.close();
  }
}
