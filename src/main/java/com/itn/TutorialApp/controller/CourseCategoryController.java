package com.itn.TutorialApp.controller;

import com.itn.TutorialApp.entity.CourseCategory;
import com.itn.TutorialApp.service.CourseCategoryService;
import org.springframework.stereotype.Controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class CourseCategoryController {

    @Autowired
    private CourseCategoryService courseCategoryService;

    @GetMapping({"/admin/category/add","/admin/category/show"})
    public String getCourseCategoryForm(Model model){
        model.addAttribute("category_list", courseCategoryService.findAllCourseCategories());
        return "admin/courseCategory";
    }

    @PostMapping("/admin/category/add")
    public String addCourseCategory(
            @RequestParam("name") String name,
            @RequestParam("description") String description,
            @RequestParam("type") String type) {

        CourseCategory courseCategory = new CourseCategory();
        courseCategory.setName(name);
        courseCategory.setDescription(description);
        courseCategory.setType(type);

       courseCategoryService.saveCourseCategory(courseCategory);

        return "redirect:/admin/category/add?save=success";
    }

    @GetMapping("/admin/category/update/{id}")
    public String updateCourseCategory(@PathVariable("id") Long id, Model model){
        CourseCategory courseCategory = courseCategoryService.findCourseCategoryById(id).orElseThrow();
        model.addAttribute("category", courseCategory);
        model.addAttribute("category_list", courseCategoryService.findAllCourseCategories());
        return "admin/courseCategory";
    }

    @PostMapping("/admin/category/update/{id}")
    public String updatingCategory(@PathVariable Long id,
                                   @RequestParam String name,
                                   @RequestParam String description,
                                   @RequestParam("type") String type){

        CourseCategory category = courseCategoryService.findCourseCategoryById(id)
                .orElseThrow();
        category.setName(name);
        category.setDescription(description);
        category.setType(type);
        courseCategoryService.saveCourseCategory(category);
        return "redirect:/admin/category/add?update=success";
    }

    @GetMapping("/admin/category/delete/{id}")
    public String deleteCategory(@PathVariable("id") Long id, Model model){
        courseCategoryService.deleteCourseCategory(id);
        return "redirect:/admin/category/add?delete=success";
    }
}