package com.itn.TutorialApp.service;

import com.itn.TutorialApp.entity.Admin;

import java.util.List;
import java.util.Optional;

public interface AdminService {

    void addAdmin(Admin admin);

    List<Admin> getAllAdmins();

    Optional<Admin> getAdminById(Long id);

    void deleteAdminById(Long id);

    void updateAdmin(Admin admin);
}