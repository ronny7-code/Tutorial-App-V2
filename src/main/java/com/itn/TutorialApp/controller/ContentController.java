package com.itn.TutorialApp.controller;

import com.itn.TutorialApp.entity.Content;
import com.itn.TutorialApp.entity.Course;
import com.itn.TutorialApp.service.ContentService;
import com.itn.TutorialApp.service.CourseService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.time.LocalDate;

@Controller
@RequiredArgsConstructor
public class ContentController {

    private final ContentService contentService;
    private final CourseService courseService;

    @GetMapping("/admin/content/add")
    public String getContentPage(Model model){
        model.addAttribute("contentList", contentService.getAllContents());
        model.addAttribute("courseList", courseService.findAllCourse());
        return "admin/content";
    }


    @PostMapping("/admin/content/add")
    public String saveContent(@RequestParam String name,
                              @RequestParam String type,
                              @RequestParam String description,
                              @RequestParam MultipartFile file,
                              @RequestParam Course course){
        Content content = new Content();
        content.setName(name);
        content.setType(type);
        content.setDescription(description);
        //content.setFile(file);  // do not save file into database
        content.setFileName(file.getOriginalFilename());
        content.setAddedDate(LocalDate.now());
        content.setCourse(course);

        // send to upload the content file
        contentService.uploadContent(file);
        // after upload save content object into database
        contentService.addContent(content);
        return "redirect:/admin/content/add?success=true";
    }

    @GetMapping("/admin/content/update/{id}")
    public String updateContent(@PathVariable("id") Long id, Model model){
        Content content = contentService.getContentById(id).orElseThrow();
        model.addAttribute("content", content);
        model.addAttribute("contentList", contentService.getAllContents());
        model.addAttribute("courseList", courseService.findAllCourse());
        return "admin/content";
    }

    @PostMapping("admin/content/update/{id}")
    public String updatingContent(@PathVariable Long id,
                                  @RequestParam("name")String name,
                                  @RequestParam("type")String type,
                                  @RequestParam("description")String description,
                                  @RequestParam("course") Course course,
                                  @RequestParam("file") MultipartFile file){

        Content content = contentService.getContentById(id).orElseThrow();
        content.setName(name);
        content.setType(type);
        content.setCourse(course);
        content.setDescription(description);
        content.setFileName(file.getOriginalFilename());
        content.setAddedDate(LocalDate.now());

        return "redirect:/admin/content/add?update=success";
    }


    @GetMapping("/admin/content/delete/{id}")
    public String deleteCategory(@PathVariable("id") Long id, Model model){
        model.addAttribute("contentList", contentService.getAllContents());
        model.addAttribute("courseList", courseService.findAllCourse());
        contentService.deleteContentById(id);
        return "redirect:/admin/course/add?delete=success";
    }
}