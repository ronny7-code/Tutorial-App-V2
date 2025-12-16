package com.itn.TutorialApp.dao;

import com.itn.TutorialApp.entity.Course;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CourseRepository extends JpaRepository<Course, Long> {
}