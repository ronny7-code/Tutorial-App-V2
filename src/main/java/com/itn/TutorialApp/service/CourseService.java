package com.itn.TutorialApp.service;

import com.itn.TutorialApp.entity.Course;

import java.util.List;
import java.util.Optional;

public interface CourseService {

    void saveCourse(Course category);

    List<Course> findAllCourse();

    Optional<Course> findCourseById(Long id);

    Course updateCourse(Long courseId, Course updatedCourse);

    void deleteCourse(Long id);
}