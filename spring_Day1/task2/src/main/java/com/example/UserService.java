package com.example;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;

@Service
public class UserService implements InitializingBean, DisposableBean {

    private final UserRepository userRepository;

    @Autowired
    public UserService(UserRepository userRepository) {
        System.out.println("[CREATION] UserService Constructor - Object instantiated");
        this.userRepository = userRepository;
    }

    @PostConstruct
    public void init() {
        System.out.println(" [INITIALIZATION] @PostConstruct - UserService initialized");
    }

    @Override
    public void afterPropertiesSet() throws Exception {
        System.out.println(" [INITIALIZATION] InitializingBean.afterPropertiesSet() - Additional setup");
    }

    public void performService() {
        System.out.println(" [EXECUTION] UserService performing business logic:");
        System.out.println("   UserService is working with: " + userRepository.getUserData());
    }

    @PreDestroy
    public void cleanup() {
        System.out.println(" [DESTRUCTION] @PreDestroy - Starting cleanup");
    }

    @Override
    public void destroy() throws Exception {
        System.out.println(" [DESTRUCTION] DisposableBean.destroy() - Final cleanup");
    }
}