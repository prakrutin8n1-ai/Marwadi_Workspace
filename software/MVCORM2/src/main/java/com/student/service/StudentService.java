package com.student.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.student.dao.StudentDAO;
import com.student.model.Student;

@Service
@Transactional
public class StudentService {

    @Autowired
    private StudentDAO studentDAO;

    public List<Student> getAllStudents() {
        return studentDAO.getAllStudents();
    }

    public Student getStudentById(int id) {
        return studentDAO.getStudentById(id);
    }

    public void saveStudent(Student student) {
        studentDAO.saveStudent(student);
    }

    public void deleteStudent(int id) {
        studentDAO.deleteStudent(id);
    }
}