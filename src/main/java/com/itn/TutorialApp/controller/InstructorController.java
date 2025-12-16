package com.itn.TutorialApp.controller;

import com.itn.TutorialApp.entity.Instructor;
import com.itn.TutorialApp.service.CourseService;
import com.itn.TutorialApp.service.InstructorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class InstructorController {

    @Autowired
    private InstructorService instructorService;

    @Autowired
    private CourseService courseService;

    // Show Instructor Page (Add & List)
    @GetMapping("/admin/instructor/add")
    public String instructorPage(Model model) {
        model.addAttribute("instructorList", instructorService.getAllInstructors());
        model.addAttribute("courseList", courseService.findAllCourse());
        return "admin/addInstructor";
    }

    // Add new Instructor
    @PostMapping("/admin/instructor/add")
    public String addInstructor(@ModelAttribute Instructor instructor) {
        instructorService.addInstructor(instructor);
        return "redirect:/admin/instructor/add?success";
    }

    // Show update form on the same page
    @GetMapping("/admin/instructor/update/{id}")
    public String updateInstructorForm(@PathVariable("id") Long id, Model model) {
        Instructor instructor = instructorService.getInstructorById(id)
                .orElseThrow(() -> new IllegalArgumentException("Instructor not found with id: " + id));
        model.addAttribute("instructor", instructor);
        model.addAttribute("instructorList", instructorService.getAllInstructors());
        model.addAttribute("courseList", courseService.findAllCourse());
        return "admin/addInstructor";
    }

    // Handle update
    @PostMapping("/admin/instructor/update/{id}")
    public String updateInstructor(
            @PathVariable("id") Long id,
            @RequestParam("name") String name,
            @RequestParam("subject") String subject,
            @RequestParam("email") String email,
            @RequestParam("phoneNumber") String phoneNumber,
            @RequestParam("address") String address,
            Model model
    ) {
        Instructor instructor = instructorService.getInstructorById(id)
                .orElseThrow(() -> new IllegalArgumentException("Instructor not found with id: " + id));

        instructor.setName(name);
        instructor.setSubject(subject);
        instructor.setEmail(email);
        instructor.setPhoneNumber(phoneNumber);
        instructor.setAddress(address);

        instructorService.addInstructor(instructor);

        return "redirect:/admin/instructor/add?updateSuccess";
    }

    // Delete Instructor
    @GetMapping("/admin/instructor/delete/{id}")
    public String deleteInstructor(@PathVariable("id") Long id) {
        instructorService.deleteInstructorById(id);
        return "redirect:/admin/instructor/add?deleteSuccess";
    }
}