package com.itn.TutorialApp.service;

import com.itn.TutorialApp.entity.Course;
import com.itn.TutorialApp.entity.Enrollment;
import com.itn.TutorialApp.entity.User;

import java.util.List;

public interface EnrollmentService {

    public void enrollUser(Enrollment enrollment);

    public Enrollment getEnrollmentById(Long id);

    public List<Enrollment> getAllEnrollments();

    public List<Enrollment> getEnrollmentByUser(User user);

    public List<Enrollment> getEnrollmentByCourse(Course course);

    public List<Enrollment> getEnrollmentByStatus(String status);

    public void updateEnrollment(Enrollment enrollment);

    public void deleteEnrollment(Enrollment enrollment);

}
