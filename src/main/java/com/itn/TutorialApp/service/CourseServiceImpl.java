package com.itn.TutorialApp.service;

import com.itn.TutorialApp.dao.CourseRepository;
import com.itn.TutorialApp.entity.Course;
import jakarta.persistence.EntityNotFoundException;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class CourseServiceImpl implements CourseService{

    @Autowired
    private CourseRepository courseRepository;

    @Override
    @Transactional
    public void saveCourse(Course category) {
        courseRepository.save(category);
    }

    @Override
    public List<Course> findAllCourse() {
        return courseRepository.findAll();
    }

    @Override
    public Optional<Course> findCourseById(Long id) {
        return courseRepository.findById(id);
    }

    @Override
    @Transactional
    public Course updateCourse(Long courseId, Course updatedCourse) {
        Course oldCourse = courseRepository.findById(courseId)
                .orElseThrow(() -> new EntityNotFoundException("Course not found with id: " + courseId));

        oldCourse.setName(updatedCourse.getName());
        oldCourse.setDescription(updatedCourse.getDescription());
        oldCourse.setCourseCategory(updatedCourse.getCourseCategory());
        oldCourse.setPrice(updatedCourse.getPrice());

        // Handle content
        if (updatedCourse.getContent() != null) {
            // Clear old content that are removed (orphanRemoval will delete them)
            oldCourse.getContent().clear();

            // Add updated content and set course reference
            for (var content : updatedCourse.getContent()) {
                content.setCourse(oldCourse);
                oldCourse.getContent().add(content);
            }
        }

        return courseRepository.save(oldCourse);
    }


    @Override
    @Transactional
    public void deleteCourse(Long id) {
        courseRepository.deleteById(id);
    }
}