package com.itn.TutorialApp.service;

import com.itn.TutorialApp.dao.AdminRepository;
import com.itn.TutorialApp.dao.UserRepository;
import com.itn.TutorialApp.entity.User;
import com.itn.TutorialApp.entity.Admin;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class CombinedUserDetailService implements UserDetailsService {

    private final UserRepository userRepository;
    private final AdminRepository adminRepository;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

        // 1️⃣ Try finding as a regular user
        User user = userRepository.findUserByUsername(username);
        if (user != null) {
            // UserDetail should include roles for "USER"
            return org.springframework.security.core.userdetails.User.builder()
                    .username(user.getUsername())
                    .password(user.getPassword())
                    .roles("USER")  // ROLE_USER
                    .build();
        }

        // 2️⃣ Try finding as admin
        Admin admin = adminRepository.findByUsername(username);
        if (admin != null) {
            String role = (admin.getAdminRole() != null) ? admin.getAdminRole().getRole() : "ADMIN";

            return org.springframework.security.core.userdetails.User.builder()
                    .username(admin.getUsername())
                    .password(admin.getPassword())
                    .roles(role)  // ROLE_ADMIN
                    .build();
        }

        throw new UsernameNotFoundException("User/Admin not found: " + username);
    }
}