package com.itn.TutorialApp.service;

import com.itn.TutorialApp.dao.InstructorRepository;
import com.itn.TutorialApp.entity.Instructor;
import jakarta.persistence.EntityNotFoundException;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class InstructorServiceImpl implements InstructorService{

    @Autowired
    private InstructorRepository instructorRepository;

    @Override
    @Transactional
    public void addInstructor(Instructor instructor) {
        instructorRepository.save(instructor);
    }

    @Override
    public List<Instructor> getAllInstructors() {
        return instructorRepository.findAll();
    }

    @Override
    public Optional<Instructor> getInstructorById(Long id) {
        return instructorRepository.findById(id);
    }

    @Override
    @Transactional
    public void deleteInstructorById(Long id) {
        instructorRepository.deleteById(id);
    }

    @Override
    @Transactional
    public Instructor updateInstructor(Instructor updatedInstructor) {

        Instructor instructor = instructorRepository.findById(updatedInstructor.getId())
                .orElseThrow(() -> new EntityNotFoundException(
                        "Instructor not found with id: " + updatedInstructor.getId()));

        // Update only editable fields
        instructor.setName(updatedInstructor.getName());
        instructor.setSubject(updatedInstructor.getSubject());
        instructor.setEmail(updatedInstructor.getEmail());
        instructor.setPhoneNumber(updatedInstructor.getPhoneNumber());
        instructor.setAddress(updatedInstructor.getAddress());

        return instructorRepository.save(instructor);
    }

}