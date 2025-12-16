package com.itn.TutorialApp.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.itn.TutorialApp.entity.CourseCategory;

import java.util.List;

public interface CourseCategoryRepository extends JpaRepository<CourseCategory, Long>{

    CourseCategory findByName(String name);

    List<CourseCategory> findByType(String type);

}