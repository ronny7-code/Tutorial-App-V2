package com.itn.TutorialApp.dao;

import com.itn.TutorialApp.entity.Enrollment;
import org.springframework.data.jpa.repository.JpaRepository;

public interface EnrollmentRepository extends JpaRepository<Enrollment, Long> {


}
