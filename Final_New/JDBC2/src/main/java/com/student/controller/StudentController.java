
package com.student.controller;

import java.sql.SQLException;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.student.dao.StudentDAO;
import com.student.model.Student;

@Controller
public class StudentController {

    private final StudentDAO studentDAO;

    public StudentController(StudentDAO studentDAO) {
        this.studentDAO = studentDAO;
    }

    // HOME PAGE
    @GetMapping("/")
    public String home(Model model) {
        model.addAttribute("student", new Student());
        return "student-form";
    }

    // SHOW REGISTRATION FORM
    @GetMapping("/register")
    public String showRegistrationForm(Model model) {
        model.addAttribute("student", new Student());
        return "student-form";
    }

    // INSERT STUDENT
    @PostMapping("/save")
    public String saveStudent(
            @ModelAttribute("student") Student student,
            Model model) {

        try {
            studentDAO.saveStudent(student);
            return "redirect:/students";

        } catch (SQLException e) {
            e.printStackTrace();
            model.addAttribute("error",
                    "Unable to save student: " + e.getMessage());
            return "student-form";
        }
    }

    // VIEW ALL STUDENTS
    @GetMapping("/students")
    public String listStudents(Model model) {
        try {
            List<Student> students = studentDAO.getAllStudents();
            model.addAttribute("students", students);
            return "student-list";

        } catch (SQLException e) {
            e.printStackTrace();
            model.addAttribute("error",
                    "Unable to load students: " + e.getMessage());
            model.addAttribute("students", List.of());
            return "student-list";
        }
    }

    // OPEN EDIT FORM
    @GetMapping("/edit/{id}")
    public String editStudent(@PathVariable("id") int id, Model model) {
        try {
            Student student = studentDAO.getStudentById(id);

            if (student == null) {
                return "redirect:/students";
            }

            model.addAttribute("student", student);
            return "student-form";

        } catch (SQLException e) {
            e.printStackTrace();
            return "redirect:/students";
        }
    }

    // UPDATE STUDENT
    @PostMapping("/update")
    public String updateStudent(
            @ModelAttribute("student") Student student) {

        try {
            studentDAO.updateStudent(student);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return "redirect:/students";
    }

    // DELETE STUDENT
    @PostMapping("/delete/{id}")
    public String deleteStudent(@PathVariable("id") int id) {

        try {
            studentDAO.deleteStudent(id);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return "redirect:/students";
    }
}
