package com.example;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ServiceA {

    private ServiceB serviceB;

    public ServiceA() {
        System.out.println("[CREATION] ServiceA no-arg constructor called");
    }

    @Autowired
    public void setServiceB(ServiceB serviceB) {
        this.serviceB = serviceB;
        System.out.println("[INJECTION] ServiceA.setServiceB called (setter injection)");
    }

    public void doSomething() {
        System.out.println("[BUSINESS] ServiceA doing something");
        serviceB.doSomething();
    }
}