package com.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class StudentController {

	@GetMapping("/student")
	public String student(Model model) {

	    model.addAttribute("name", "Rahul Patel");
	    model.addAttribute("course", "Java Full Stack Development");
	    model.addAttribute("city", "Rajkot");

	    return "student";
	}
    @GetMapping("/about")
    public String about() {

        System.out.println("About method executed");

        return "student";
    }
}
