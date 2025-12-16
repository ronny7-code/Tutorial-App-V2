package com.itn.TutorialApp.service;

import java.util.List;
import java.util.Optional;

import com.itn.TutorialApp.entity.CourseCategory;

public interface CourseCategoryService {

	void saveCourseCategory(CourseCategory category);

	List<CourseCategory> findAllCourseCategories();

	Optional<CourseCategory> findCourseCategoryById(Long id);
	
	CourseCategory updateCourseCategory(Long courseId, CourseCategory updatedCategory);
	
	void deleteCourseCategory(Long id);
}