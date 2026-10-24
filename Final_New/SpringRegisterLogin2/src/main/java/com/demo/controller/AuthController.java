
package com.demo.controller;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AuthController {

    // Temporary storage for registered users
    private static final Map<String, String> users =
            new ConcurrentHashMap<>();

    // Home page
    @GetMapping("/")
    public String home() {
        return "redirect:/login";
    }

    // Show registration page
    @GetMapping("/register")
    public String showRegisterPage() {
        return "register";
    }

    // Process registration form
    @PostMapping("/register")
    public String register(
            @RequestParam("username") String username,
            @RequestParam("password") String password,
            Model model) {

        String cleanUsername = username.trim();

        if (cleanUsername.isEmpty() || password.isEmpty()) {
            model.addAttribute(
                    "error",
                    "Username and password are required."
            );
            return "register";
        }

        if (users.putIfAbsent(cleanUsername, password) != null) {
            model.addAttribute(
                    "error",
                    "Username already exists. Please login."
            );
            return "register";
        }

        model.addAttribute(
                "message",
                "Registration successful! Please login."
        );

        return "login";
    }

    // Show login page
    @GetMapping("/login")
    public String showLoginPage(HttpSession session) {

        if (session.getAttribute("username") != null) {
            return "redirect:/dashboard";
        }

        return "login";
    }

    // Process login form
    @PostMapping("/login")
    public String login(
            @RequestParam("username") String username,
            @RequestParam("password") String password,
            HttpServletRequest request,
            Model model) {

        String cleanUsername = username.trim();
        String savedPassword = users.get(cleanUsername);

        if (savedPassword != null && savedPassword.equals(password)) {

            // Invalidate the old session, if present
            HttpSession oldSession = request.getSession(false);

            if (oldSession != null) {
                oldSession.invalidate();
            }

            // Create a new session after successful login
            HttpSession session = request.getSession(true);
            session.setAttribute("username", cleanUsername);

            return "redirect:/dashboard";
        }

        model.addAttribute(
                "error",
                "Invalid username or password."
        );

        return "login";
    }

    // Dashboard page - only logged-in users can access
    @GetMapping("/dashboard")
    public String dashboard(HttpSession session, Model model) {

        String username = (String) session.getAttribute("username");

        if (username == null) {
            return "redirect:/login";
        }

        model.addAttribute("username", username);

        return "dashboard";
    }

    // Logout and destroy session
    @GetMapping("/logout")
    public String logout(HttpSession session) {

        session.invalidate();

        return "redirect:/login?logout";
    }
}
