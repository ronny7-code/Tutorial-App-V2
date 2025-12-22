package com.itn.TutorialApp.controller;

import com.itn.TutorialApp.entity.*;
import com.itn.TutorialApp.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.time.LocalDate;
import java.util.UUID;

@Controller
public class CourseController {

    @Autowired
    private CourseService courseService;

    @Autowired
    private CourseCategoryService courseCategoryService;

    @Autowired
    private UserService userService;

    @Autowired
    private EnrollmentService enrollmentService;

    @Autowired
    private PaymentSecurityService paymentSecurityService;

    @GetMapping({"/admin/course/add", "/admin/course/show"})
    public String getCourseForm(Model model){
        model.addAttribute("courseList", courseService.findAllCourse());
        model.addAttribute("categoryList", courseCategoryService.findAllCourseCategories());
        return "admin/course";
    }

    @PostMapping("/admin/course/add")
    public String addCourse(
            @RequestParam("name") String name,
            @RequestParam("description") String description,
            @RequestParam("category") CourseCategory category,
            @RequestParam("price") double price) {

        Course course = new Course();
        course.setName(name);
        course.setDescription(description);
        course.setCourseCategory(category);
        course.setPrice(price);

        courseService.saveCourse(course);

        return "redirect:/admin/course/add?save=success";
    }

    @GetMapping("/admin/course/update/{id}")
    public String updateCourse(@PathVariable("id") Long id, Model model){
        Course course = courseService.findCourseById(id).orElseThrow();
        model.addAttribute("course", course);
        model.addAttribute("category_list", courseService.findAllCourse());
        model.addAttribute("categoryList", courseCategoryService.findAllCourseCategories());
        return "admin/course";
    }

    @PostMapping("/admin/course/update/{id}")
    public String updatingCourse(@PathVariable Long id,
                                 @RequestParam("name") String name,
                                 @RequestParam("description") String description,
                                 @RequestParam("category") CourseCategory category,
                                 @RequestParam("price") double price){

        Course course = courseService.findCourseById(id)
                .orElseThrow();
        course.setName(name);
        course.setDescription(description);
        course.setCourseCategory(category);
        courseService.saveCourse(course);
        course.setPrice(price);
        return "redirect:/admin/course/add?update=success";
    }

    @GetMapping("/admin/course/delete/{id}")
    public String deleteCategory(@PathVariable("id") Long id, Model model){
        model.addAttribute("courseList", courseService.findAllCourse());
        model.addAttribute("categoryList", courseCategoryService.findAllCourseCategories());
        courseService.deleteCourse(id);
        return "redirect:/admin/course/add?delete=success";
    }

    // User course access
    @GetMapping("/user/course/{id}")
    public String showCourse(@PathVariable("id") Long id, Model model){
        Course course = courseService.findCourseById(id).orElse(new Course());
        model.addAttribute("course", course);
        model.addAttribute("courseList", courseService.findAllCourse());
        return "courseDetail";
    }

    @GetMapping("/user/enroll/{id}")
    public String enrollCourse(@PathVariable Long id, Principal principal, Model model){
        Enrollment enrollment  =  new Enrollment();
        enrollment.setUser(userService.findByUsername(principal.getName()));
        enrollment.setCourse(courseService.findCourseById(id).orElse(new Course()));
        enrollment.setEnrollDate(LocalDate.now());
        enrollment.setStatus("PENDING");
        enrollment.setPayAmount(String.valueOf(enrollment.getCourse().getPrice()));
        enrollment.setPaymentMode("ESEWA");
        enrollment.setEnrollEnds(LocalDate.now().plusYears(1));  // one year validity

        // PaymentModel
        EsewaPayment payment = new EsewaPayment();
        payment.setAmount(enrollment.getCourse().getPrice());
        payment.setFailureURL("http://localhost:7777/user/enroll_payment/esewa?success=false");
        payment.setSuccessURL("http://localhost:7777/user/enroll_payment/esewa?success=true");
        payment.setProductCode("EPAYTEST");
        payment.setSignedFieldNames("total_amount,transaction_uuid,product_code");
        payment.setTransactionUUID(UUID.randomUUID()+"_E_LEARNING");
        payment.setTaxAmount((payment.getAmount() * 13)/100);
        payment.setProductServiceCharge(0);
        payment.setProductDeliveryCharge(0);
        payment.setTotalAmount(payment.getAmount()+ (payment.getAmount() * 13)/100);
        String message="total_amount="+payment.getTotalAmount()
                        +",transaction_uuid="+payment.getTransactionUUID()
                        +",product_code="+ payment.getProductCode();
        System.out.println("Message:"+message);
        // encrypt this message string
        payment.setSignature(paymentSecurityService.generateSignature(message));

        payment.setEnrollment(enrollment);
        enrollment.setEsewaPayment(payment);
        enrollmentService.enrollUser(enrollment);
        // enrollment complete now proceed to payment via e-sewa;

        model.addAttribute("payment", payment);
        return "esewa_payment";
    }


}