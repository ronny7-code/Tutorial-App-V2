package com.itn.TutorialApp.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import org.springframework.web.multipart.MultipartFile;

import java.time.LocalDate;

@Entity
@Getter
@Setter
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String firstName;
    private String lastName;
    private String phoneNumber;
    private String address;
    private String gender;
    private LocalDate DOB;
    @Column(unique = true)
    private String username;
    private String password;
    @Transient
    private String cPassword;
    private String active;
    @Transient
    private String authority;
    @Transient
    private MultipartFile profileImage;
    private String profilePicture;

    @OneToOne(mappedBy = "user", cascade = CascadeType.ALL)
    private UserRole userRole;

}