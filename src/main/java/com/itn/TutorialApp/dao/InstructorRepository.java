package com.itn.TutorialApp.dao;

import com.itn.TutorialApp.entity.Instructor;
import org.springframework.data.jpa.repository.JpaRepository;

public interface InstructorRepository extends JpaRepository<Instructor, Long> {
}