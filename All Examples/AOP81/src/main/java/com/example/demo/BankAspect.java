package com.example.demo;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class BankAspect {

    @Around(
        "execution(* com.example.demo.BankService.transferMoney(..))"
    )
    public Object monitorTransaction(
            ProceedingJoinPoint joinPoint) throws Throwable {

        System.out.println("Transaction Started");

        long start = System.currentTimeMillis();

        try {
            Object result = joinPoint.proceed();

            System.out.println("Transaction Successful");

            return result;

        } catch (Throwable ex) {
            System.out.println(
                "Transaction Failed: " + ex.getMessage()
            );

            throw ex;

        } finally {
            long end = System.currentTimeMillis();

            System.out.println(
                "Execution Time: " + (end - start) + " ms"
            );
        }
    }
}