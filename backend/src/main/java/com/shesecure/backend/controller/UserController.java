package com.shesecure.backend.controller;

import com.shesecure.backend.model.User;
import com.shesecure.backend.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/users")
public class UserController {

    @Autowired
    private UserService userService;

    // REGISTER
    @PostMapping("/register")
    public User registerUser(@RequestBody User user) {
        return userService.registerUser(user);
    }

    // LOGIN FOR BROWSER TESTING (NO POSTMAN NEEDED)
    @PostMapping("/login")
    public String loginUser(@RequestParam String email,
                            @RequestParam String password) {
        return userService.loginUser(email, password);
    }
}