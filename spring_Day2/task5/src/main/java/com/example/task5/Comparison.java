package com.example.task5;

public class Comparison {
    static class ServiceA {
        public String call() {
            return "ServiceA called";
        }
    }

    static class Consumer {
        private final ServiceA serviceA;

        // manual constructor wiring
        public Consumer(ServiceA serviceA) {
            this.serviceA = serviceA;
        }

        public void doWork() {
            System.out.println("Consumer.doWork -> " + serviceA.call());
        }
    }

    public static void main(String[] args) {
        // without Spring
        System.out.println("=== without Spring ===");
        ServiceA a = new ServiceA();
        Consumer c = new Consumer(a);
        c.doWork();

        // with Spring
        System.out.println("\n=== with Spring ===");
        org.springframework.context.annotation.AnnotationConfigApplicationContext ctx =
                new org.springframework.context.annotation.AnnotationConfigApplicationContext();
        ctx.register(ManagedConfig.class);
        ctx.refresh();
        Consumer springConsumer = ctx.getBean(Consumer.class);
        springConsumer.doWork();
        ctx.close();
    }
}

@Configuration
class ManagedConfig {
    @org.springframework.context.annotation.Bean
    public ServiceA serviceA() {
        return new ServiceA();
    }

    @org.springframework.context.annotation.Bean
    public Comparison.Consumer consumer(ServiceA a) {
        return new Comparison.Consumer(a);
    }
}
