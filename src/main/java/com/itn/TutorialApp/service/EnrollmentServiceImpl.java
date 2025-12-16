package com.itn.TutorialApp.service;

import com.itn.TutorialApp.dao.EnrollmentRepository;
import com.itn.TutorialApp.entity.Course;
import com.itn.TutorialApp.entity.Enrollment;
import com.itn.TutorialApp.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authorization.method.AuthorizeReturnObject;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class EnrollmentServiceImpl implements EnrollmentService {

    @Autowired
    private EnrollmentRepository enrollmentRepository;

    @Override
    public void enrollUser(Enrollment enrollment) {
        enrollmentRepository.save(enrollment);
    }

    @Override
    public Enrollment getEnrollmentById(Long id) {
        return enrollmentRepository.findById(id).get();
    }

    @Override
    public List<Enrollment> getAllEnrollments() {
        return enrollmentRepository.findAll();
    }

    @Override
    public List<Enrollment> getEnrollmentByUser(User user) {
        return List.of();
    }

    @Override
    public List<Enrollment> getEnrollmentByCourse(Course course) {
        return List.of();
    }

    @Override
    public List<Enrollment> getEnrollmentByStatus(String status) {
        return List.of();
    }

    @Override
    public void updateEnrollment(Enrollment enrollment) {

    }

    @Override
    public void deleteEnrollment(Enrollment enrollment) {

    }
}
