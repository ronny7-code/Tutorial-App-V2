package com.itn.TutorialApp.service;

import com.itn.TutorialApp.entity.Admin;
import com.itn.TutorialApp.entity.Instructor;

import java.util.List;
import java.util.Optional;

public interface InstructorService {

    void addInstructor(Instructor instructor);

    List<Instructor> getAllInstructors();

    Optional<Instructor> getInstructorById(Long id);

    void deleteInstructorById(Long id);

    Instructor updateInstructor(Instructor instructor);
}