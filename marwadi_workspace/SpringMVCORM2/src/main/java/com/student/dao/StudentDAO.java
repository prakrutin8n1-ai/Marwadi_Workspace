package com.student.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.student.model.Student;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;

@Repository
public class StudentDAO {

    @PersistenceContext
    private EntityManager entityManager;

    // Get all students
    public List<Student> getAllStudents() {
        return entityManager
                .createQuery(
                    "SELECT s FROM Student s ORDER BY s.id",
                    Student.class
                )
                .getResultList();
    }

    // Get student by ID
    public Student getStudentById(int id) {
        return entityManager.find(Student.class, id);
    }

    // Insert or update student
    public void saveStudent(Student student) {

        if (student.getId() == 0) {
            entityManager.persist(student);
        } else {
            Student existingStudent =
                    entityManager.find(Student.class, student.getId());

            if (existingStudent != null) {
                existingStudent.setName(student.getName());
                existingStudent.setEmail(student.getEmail());
                existingStudent.setCourse(student.getCourse());
            }
        }
    }

    // Delete student by ID
    public void deleteStudent(int id) {

        Student student = entityManager.find(Student.class, id);

        if (student != null) {
            entityManager.remove(student);
        }
    }
}