
package com.example.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;

@SpringBootApplication
public class Main {

    public static void main(String[] args) {
        SpringApplication.run(Main.class, args);
    }

    @Bean
    CommandLineRunner run(BankService bankService) {
        return args -> {

            System.out.println("===== BANK TRANSACTION DEMO =====");

            String result = bankService.transferMoney();

            System.out.println("Final Result: " + result);

            System.out.println("===== DEMO COMPLETED =====");
        };
    }
}
