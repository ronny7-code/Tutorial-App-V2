package com.itn.TutorialApp.service;

import com.itn.TutorialApp.dao.AdminRepository;
import com.itn.TutorialApp.entity.Admin;
import jakarta.persistence.EntityNotFoundException;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class AdminServiceImpl implements AdminService{

    @Autowired
    private AdminRepository adminRepository;

    @Override
    @Transactional
    public void addAdmin(Admin admin) {
        adminRepository.save(admin);
    }

    @Override
    public List<Admin> getAllAdmins() {
        return adminRepository.findAll();
    }

    @Override
    public Optional<Admin> getAdminById(Long id) {
        return adminRepository.findById(id);
    }

    @Override
    @Transactional
    public void deleteAdminById(Long id) {
        adminRepository.deleteById(id);
    }

    @Override
    @Transactional
    public void updateAdmin(Admin updatedAdmin) {

        Admin admin = adminRepository.findById(updatedAdmin.getId())
                .orElseThrow(() -> new EntityNotFoundException(
                        "Admin not found with id: " + updatedAdmin.getId()
                ));

        // Update only editable fields
        admin.setName(updatedAdmin.getName());
        admin.setEmail(updatedAdmin.getEmail());
        admin.setUsername(updatedAdmin.getUsername());
        admin.setPhoneNumber(updatedAdmin.getPhoneNumber());
        admin.setAddress(updatedAdmin.getAddress());
        admin.setGender(updatedAdmin.getGender());

        adminRepository.save(admin);
    }

}