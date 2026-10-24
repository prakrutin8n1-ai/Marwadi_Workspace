package Scope1.Scope2;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Main {

    public static void main(String[] args) {

        ApplicationContext context =
            new ClassPathXmlApplicationContext("beans.xml");

        Student s1 = context.getBean("student", Student.class);
        Student s2 = context.getBean("student", Student.class);

        s1.study();

        System.out.println(s1 == s2);

        ((ClassPathXmlApplicationContext) context).close();
    }
}
