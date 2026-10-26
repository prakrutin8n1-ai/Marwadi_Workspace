package com.example.demo;

import org.springframework.stereotype.Service;

@Service
public class BankService {

    public String transferMoney() {

        System.out.println("Processing transaction...");

        try {
            Thread.sleep(2000);
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
            throw new RuntimeException(e);
        }

        System.out.println("Money transferred!");

        return "SUCCESS";
    }
}