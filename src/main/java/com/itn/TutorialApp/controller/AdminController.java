package com.itn.TutorialApp.controller;

import com.itn.TutorialApp.dao.MessageFromUserRepository;
import com.itn.TutorialApp.entity.Admin;
import com.itn.TutorialApp.entity.AdminRole;
import com.itn.TutorialApp.entity.MessageFromUser;
import com.itn.TutorialApp.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class AdminController {

	@Autowired
	private AdminService adminService;

	@Autowired
	private MessageFromUserRepository messageRepo;

	@Autowired
	private PasswordEncoder passwordEncoder;

	@GetMapping("/admin/home")
	public String adminDashboard() {
		return "admin/dashboard";
	}

	@GetMapping("/admin/add")
	public String addNewAdmin(Model model) {
		model.addAttribute("adminList", adminService.getAllAdmins());
		return "admin/addAdmin";
	}

	@PostMapping("/admin/add")
	public String saveAdmin(@ModelAttribute Admin admin) {

		// 1️⃣ Validate password & confirm password
		if (!java.util.Objects.equals(admin.getPassword(), admin.getCPassword())) {
			throw new IllegalArgumentException("Password is not matching");
		}

		// 2️⃣ Assign Role
		AdminRole adminRole = new AdminRole();
		adminRole.setAdmin(admin);
		adminRole.setRole("ADMIN");

		admin.setAdminRole(adminRole);

		// 3️⃣ Encode password
		admin.setPassword(passwordEncoder.encode(admin.getPassword()));

		// 4️⃣ Save admin
		adminService.addAdmin(admin);

		// 5️⃣ Redirect with success message
		return "redirect:/admin/add?success";
	}

	@PostMapping("/contact/message")
	public String messageFromTheUser(@ModelAttribute MessageFromUser message) {
		messageRepo.save(message);
		return "redirect:/home?messageSent=true";
	}


	@GetMapping("/admin/contact/message")
	public String getMessage(Model model){
		model.addAttribute("messages", messageRepo.findAll());
		return "admin/messageFromUser";
	}

	@GetMapping("/admin/update/{id}")
	public String updateAdmin(@PathVariable("id") Long id, Model model){
		Admin admin = adminService.getAdminById(id).orElseThrow();
		model.addAttribute("admin", admin);
		model.addAttribute("adminList", adminService.getAllAdmins());
		return "admin/addAdmin";
	}

	@PostMapping("/admin/update/{id}")
	public String updateAdminInfo(
			@PathVariable("id") Long id,
			@RequestParam("name") String name,
			@RequestParam("address") String address,
			@RequestParam("gender") String gender,
			@RequestParam("email") String email,
			@RequestParam("phoneNumber") String phoneNumber,
			@RequestParam("username") String username,
			@RequestParam("password") String password,
			@RequestParam("cPassword") String cPassword,
			Model model
	) {
		// Fetch the existing admin
		Admin admin = adminService.getAdminById(id).orElseThrow(() ->
				new IllegalArgumentException("Admin not found with id: " + id)
		);

		// Check if password and confirm password match
		if (!password.equals(cPassword)) {
			model.addAttribute("admin", admin);
			model.addAttribute("adminList", adminService.getAllAdmins());
			model.addAttribute("error", "Password and Confirm Password do not match!");
			return "admin/addAdmin";
		}

		// Update admin fields
		admin.setName(name);
		admin.setAddress(address);
		admin.setGender(gender);
		admin.setEmail(email);
		admin.setPhoneNumber(phoneNumber);
		admin.setUsername(username);
		admin.setPassword(passwordEncoder.encode(admin.getPassword())); // ideally encode the password

		// Save updated admin
		adminService.addAdmin(admin);

		return "redirect:/admin/add"; // redirect to admin list page or same page
	}

	@GetMapping("/admin/delete/{id}")
	public String deleteAdmin(@PathVariable("id") Long id){
		adminService.deleteAdminById(id);
		return "redirect:/admin/add? adminDelete=success";
	}

}