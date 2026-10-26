package com.controller;

import java.util.List;
import java.util.Scanner;

import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.bo.BO;
import com.model.Person;

public class MainClass {

    public static void main(String[] args) {

        try (ClassPathXmlApplicationContext acm =
                new ClassPathXmlApplicationContext("tops.xml");
             Scanner sc = new Scanner(System.in)) {

            BO bo = acm.getBean("bo", BO.class);

            while (true) {
                System.out.println("\n1. Insert Person");
                System.out.println("2. Update Person");
                System.out.println("3. Delete Person");
                System.out.println("4. Get All Persons");
                System.out.println("5. Get Single Person");
                System.out.println("0. Exit");
                System.out.print("Enter choice: ");

                int choice = sc.nextInt();

                switch (choice) {
                    case 1: {
                        Person p = new Person();

                        System.out.print("Enter Name: ");
                        p.setName(sc.next());

                        bo.insert(p);
                        break;
                    }

                    case 2: {
                        Person p = new Person();

                        System.out.print("Enter ID: ");
                        p.setId(sc.nextInt());

                        System.out.print("Enter New Name: ");
                        p.setName(sc.next());

                        bo.update(p);
                        break;
                    }

                    case 3: {
                        Person p = new Person();

                        System.out.print("Enter ID: ");
                        p.setId(sc.nextInt());

                        bo.delete(p);
                        break;
                    }

                    case 4: {
                        List<Person> list = bo.getall();

                        System.out.println("ID\t|\tName");

                        for (Person person : list) {
                            System.out.println(
                                person.getId() + "\t|\t"
                                + person.getName()
                            );
                        }
                        break;
                    }

                    case 5: {
                        Person p = new Person();

                        System.out.print("Enter ID: ");
                        p.setId(sc.nextInt());

                        Person result = bo.getSingle(p);

                        if (result != null) {
                            System.out.println(
                                result.getId() + " | "
                                + result.getName()
                            );
                        } else {
                            System.out.println("Person not found");
                        }
                        break;
                    }

                    case 0:
                        System.out.println("Program closed.");
                        return;

                    default:
                        System.out.println("Invalid choice");
                }
            }
        }
    }
}