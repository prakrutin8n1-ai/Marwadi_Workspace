package com.student.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.student.model.Student;

@Repository
@Transactional
public class StudentDAO {

    @Autowired
    private SessionFactory sessionFactory;

    public List<Student> getAllStudents() {
        return sessionFactory.getCurrentSession()
                .createQuery("from Student", Student.class)
                .getResultList();
    }

    public Student getStudentById(int id) {
        return sessionFactory.getCurrentSession()
                .get(Student.class, id);
    }

    public void saveStudent(Student student) {
        sessionFactory.getCurrentSession().saveOrUpdate(student);
    }

    public void deleteStudent(int id) {
        Student student = getStudentById(id);

        if (student != null) {
            sessionFactory.getCurrentSession().delete(student);
        }
    }
}