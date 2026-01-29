/*Problem-4
Create a program that:
Accepts numeric input as strings.
Converts them into appropriate wrapper objects.
Stores them in a List<Number>.
Calculates:
Sum of all integers
Average of floating-point numbers
Logs invalid inputs.
Must Use
✔ Wrapper classes (Integer, Double, etc.)
✔ Autoboxing / Unboxing
✔ ArrayList
✔ NumberFormatException
✔ Iteration techniques (for-each / iterator) */
import java.util.*;

public class Prob4 {
  
  public static void main(String args[]){
    Scanner sc=new Scanner(System.in);
    String n=sc.nextLine();
    try{
      String s[]=n.split(",");
      List<Number> numbers = new ArrayList<>();
      List<String> invalidInputs = new ArrayList<>();
      for (String input : s ){
        try {
          numbers.add(parseNumber(input.trim()));
        } catch (NumberFormatException e) {
          invalidInputs.add(input.trim());
        }
      }
      if (!invalidInputs.isEmpty()) {
        System.out.println("Invalid inputs: " + invalidInputs);
      }
      long integerSum = 0;
      for (Number num : numbers) {
        if (num instanceof Integer) {
          integerSum += num.longValue();
        }
      }
      System.out.println("Sum of integers: " + integerSum);
      double floatSum = 0;
      int floatCount = 0;
      for (Number num : numbers) {
        if (num instanceof Double) {
          floatSum += num.doubleValue();
          floatCount++;
        }
      }
      if (floatCount > 0) {
        double average = floatSum / floatCount;
        System.out.println("Average of floating-point numbers: " + average);
      } else {
        System.out.println("No floating-point numbers found");
      }
  
    }
    catch(Exception e){
      System.out.println("Error: " + e.getMessage());
    }
    sc.close();
  }
  public static Number parseNumber(String value) {
    if (value.contains(".")) {
      return Double.parseDouble(value);
    } else {
      return Integer.parseInt(value);  
    }
  }
}
