/*Problem-3
Build a validation framework that:
Validates username, age, and email
Throws custom exceptions for invalid data
Differentiates checked vs unchecked exceptions
Logs validation completion
Must Use
✔ Checked exceptions
✔ Unchecked exceptions
✔ try-catch-finally
✔ throw vs throws
✔ Custom exception classes */
import java.util.logging.Logger;
import java.util.Scanner;
import java.io.*;
class InvalidNameException extends Exception{
    public InvalidNameException(String msg){
        super(msg);
    }
}
class InvalidAgeException extends RuntimeException{
    public InvalidAgeException(String msg){
        super(msg);
    }
}
class InvalidEmailException extends Exception{
    public InvalidEmailException(String msg){
        super(msg);
    }
}
public class Prob3 {
    private static final Logger logger = Logger.getLogger(Prob3.class.getName());
    public void validateName(String name) throws InvalidNameException {
       
        if (name == null || name.isEmpty()) {
            throw new InvalidNameException("name cannot be null or empty");
        }
    }
    public void validateAge(int age){
        if (age < 0 || age > 50) {
            throw new InvalidAgeException("Age must be between 0 and 50");
        }
    }
    public void validateEmail(String email)throws InvalidEmailException{
        if (!email.contains("@")) {
            throw new InvalidEmailException("Email must contain '@'");
        }
    }
            
            
        
    public static void main(String[] args) {
        Prob3 validator = new Prob3();
        Scanner sc=new Scanner(System.in);
        String name=sc.nextLine();
        int age=sc.nextInt();
        String email=sc.nextLine();
        try{
        validator.validateName(name);
        }
        catch(InvalidNameException e){
            logger.warning("Validation Error: " + e.getMessage());
        }
        finally{
            logger.info("Name validation completed");
        }
        try{
        validator.validateAge(age);
        }
        catch(InvalidAgeException e){
            logger.warning("Validation Error: " + e.getMessage());
        }
        finally{
            logger.info("Age validation completed");
        }
        try{
        validator.validateEmail(email);
        }
        catch(InvalidEmailException e){
            logger.warning("Validation Error: " + e.getMessage());
        }
        finally{
            logger.info("Email validation completed");
        }

        sc.close();
    }
}
