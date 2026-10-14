package com.student.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.student.model.Student;
import com.student.service.StudentService;

@Controller
public class StudentController {

    @Autowired
    private StudentService studentService;

    @GetMapping("/")
    public String home(Model model) {
        model.addAttribute(
            "students", studentService.getAllStudents()
        );
        return "students";
    }

    @GetMapping("/student/add")
    public String addForm(Model model) {
        model.addAttribute("student", new Student());
        return "student-form";
    }

    @PostMapping("/student/save")
    public String saveStudent(@ModelAttribute("student") Student student) {
        studentService.saveStudent(student);
        return "redirect:/";
    }

    @GetMapping("/student/edit/{id}")
    public String editStudent(@PathVariable int id, Model model) {
        Student student = studentService.getStudentById(id);

        if (student == null) {
            return "redirect:/";
        }

        model.addAttribute("student", student);
        return "student-form";
    }

    @GetMapping("/student/delete/{id}")
    public String deleteStudent(@PathVariable int id) {
        studentService.deleteStudent(id);
        return "redirect:/";
    }
}