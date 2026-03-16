package com.example;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

public class Main {
    public static void main(String[] args) {
        System.out.println("First try: constructor injection on both sides (should fail)");
        try {
            ApplicationContext context = new AnnotationConfigApplicationContext(AppConfig.class);
            ServiceA serviceA = context.getBean(ServiceA.class);
            serviceA.doSomething();
            System.out.println("Application started with setter injection to resolve circular dependency");
        } catch (Exception e) {
            System.out.println("[ERROR] " + e.getMessage());
            System.out.println("Circular dependency detected when using constructors.");
        }

        System.out.println("\nExplanation: constructor injection requires the other bean to be created first, leading to a loop."
                + " Setter injection creates the bean first then sets the dependency after, breaking the cycle.");
    }
}