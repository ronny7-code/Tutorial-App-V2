package com.itn.TutorialApp.controller;

import com.itn.TutorialApp.entity.User;
import com.itn.TutorialApp.service.CourseService;
import com.itn.TutorialApp.service.InstructorService;
import com.itn.TutorialApp.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class ProfileController {

    @Autowired
    private UserService userService;

    @Autowired
    private CourseService courseService;


    // Show profile page
    @GetMapping("/user/profile")
    public String getUserProfile(Authentication authentication, Model model) {

        model.addAttribute("courseList", courseService.findAllCourse());

        if (authentication != null && authentication.isAuthenticated()) {
            String username = authentication.getName();

            User user = userService.findByUsername(username);
            if (user != null) {
                model.addAttribute("user", user);
            }
        }
        return "profile";
    }

    // Show update form
    @GetMapping("/user/profile/update/{id}")
    public String updateUserProfile(@PathVariable("id") Long id, Model model) {

        User user = userService.getUserById(id)
                .orElseThrow(() -> new UsernameNotFoundException("User not found"));

        model.addAttribute("user", user);
        model.addAttribute("courseList", courseService.findAllCourse());

        return "profile_update";
    }

    // Save updated user
    @PostMapping("/user/profile/update/save")
    public String saveUpdatedUser(@ModelAttribute("user") User updatedUser) {

        userService.updateUser(updatedUser);

        return "redirect:/user/profile?success";
    }


}