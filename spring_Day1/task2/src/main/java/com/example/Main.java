package com.example;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

public class Main {
    public static void main(String[] args) {
        try (AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext(AppConfig.class)) {

            System.out.println("=====================================");
            System.out.println("   SPRING BEAN LIFECYCLE DEMO");
            System.out.println("=====================================\n");

            System.out.println("-------------------------------------");
            System.out.println("Step 1: Creating ApplicationContext");
            System.out.println("-------------------------------------");
            System.out.println("Spring creates and initializes all beans...\n");

            System.out.println("-------------------------------------");
            System.out.println("Step 2: Getting UserService Bean");
            System.out.println("-------------------------------------");
            UserService userService = context.getBean(UserService.class);

            System.out.println("-------------------------------------");
            System.out.println("Step 3: Executing Business Logic");
            System.out.println("-------------------------------------");
            userService.performService();

            System.out.println("\n-------------------------------------");
            System.out.println("Step 4: Context Shutdown (Exiting try block)");
            System.out.println("-------------------------------------");
            System.out.println("Spring now invokes destruction callbacks...\n");
        }

        System.out.println("=====================================");
        System.out.println("   APPLICATION TERMINATED");
        System.out.println("=====================================");
    }
}