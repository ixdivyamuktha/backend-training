package com.example;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ServiceB {

    private ServiceA serviceA;


    public ServiceB() {
        System.out.println("[CREATION] ServiceB no-arg constructor called");
    }

    @Autowired
    public void setServiceA(ServiceA serviceA) {
        this.serviceA = serviceA;
        System.out.println("[INJECTION] ServiceB.setServiceA called (setter injection)");
    }

    public void doSomething() {
        System.out.println("[BUSINESS] ServiceB doing something");
    }
}