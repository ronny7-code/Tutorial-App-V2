package com.itn.TutorialApp.controller;

import com.itn.TutorialApp.entity.User;
import com.itn.TutorialApp.entity.UserRole;
import com.itn.TutorialApp.service.CourseService;
import com.itn.TutorialApp.service.InstructorService;
import com.itn.TutorialApp.service.UserService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;

@Controller
public class HomeController {

	@Autowired
	private CourseService courseService;

	@Autowired
	private UserService userService;

	@Autowired
	private PasswordEncoder passwordEncoder;

	@Autowired
	private InstructorService instructorService;


	// Home page
	@GetMapping({"/", "/home"})
	public String getHomePage(Model model) {
		model.addAttribute("courseList", courseService.findAllCourse());
		model.addAttribute("instructorList", instructorService.getAllInstructors());

		return "index";
	}

	// Login page
	@GetMapping("/login")
	public String getLoginPage(Model model) {
		return "login";
	}

	// Registration page
	@GetMapping("/signup")
	public String getRegisterPage(Model model) {
		model.addAttribute("courseList", courseService.findAllCourse());
		return "register";
	}

	// User signup
	@PostMapping("/signup")
	public String signup(@ModelAttribute User user) throws IOException {

		// Safe password comparison to prevent NullPointerException
		if (!java.util.Objects.equals(user.getPassword(), user.getCPassword())) {
			throw new IllegalArgumentException("Password is not matching");
		}

		// Enable the user
		user.setActive("1"); // 1 = enabled, 0 = disabled

		// Assign default role
		UserRole userRole = new UserRole();
		userRole.setRole("USER");
		userRole.setUser(user);
		user.setUserRole(userRole);

		// Setting the profile picture name in the DB
		user.setProfilePicture(user.getProfileImage().getOriginalFilename());

		Path path =Path.of( "C:\\Users\\STUDENT\\Documents\\GIt Stuffs\\Tutorial-App-V2\\src\\main\\resources\\static\\UserProfilePictures\\" + user.getProfileImage().getOriginalFilename());

		Files.copy(user.getProfileImage().getInputStream(), path , StandardCopyOption.REPLACE_EXISTING);

		// Encode password before saving
		user.setPassword(passwordEncoder.encode(user.getPassword()));

		// Save user
		userService.addUser(user);

		// Redirect to login page with success
		return "redirect:/login?success";
	}

	// Logout user
	@GetMapping("/logout")
	public String logoutUser(HttpSession session) {
		session.invalidate();
		return "redirect:/login";
	}

	// Welcome page redirect based on role
	@GetMapping("/welcome")
	public String getAdminHome(Authentication authentication) {

		String authority = authentication.getAuthorities().toString();

		if (authority.contains("ADMIN")) {
			return "redirect:/admin/home";
		} else if (authority.contains("TUTOR")) {
			return "redirect:/tutor/home";
		} else {
			return "redirect:/user/profile";
		}
	}


}