package com.example;

import org.springframework.stereotype.Repository;

@Repository
public class UserRepository {

    public String getUserData() {
        return "Data from UserRepository";
    }
}