package com.itn.TutorialApp.service;

import com.itn.TutorialApp.dao.AdminRepository;
import com.itn.TutorialApp.entity.Admin;
import com.itn.TutorialApp.entity.AdminDetail;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class AdminDetailService implements UserDetailsService {

    private final AdminRepository adminRepository;

    // Constructor injection (recommended)
    public AdminDetailService(AdminRepository adminRepository) {
        this.adminRepository = adminRepository;
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Admin admin = adminRepository.findByUsername(username);
        if (admin == null) throw new UsernameNotFoundException("Admin not found");

        // Copy only the fields needed — no entity references
        String role = (admin.getAdminRole() != null) ? admin.getAdminRole().getRole() : "ADMIN";
        return new AdminDetail(admin.getUsername(), admin.getPassword(), role);
    }

}