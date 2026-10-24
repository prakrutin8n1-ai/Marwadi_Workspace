package com.demo;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.After;

@Aspect
public class LoggingAspect {

    @Before("execution(* com.demo.StudentService.display(..))")
    public void beforeMethod() {
        System.out.println("Before method execution");
    }

    @After("execution(* com.demo.StudentService.display(..))")
    public void afterMethod() {
        System.out.println("After method execution");
    }
}