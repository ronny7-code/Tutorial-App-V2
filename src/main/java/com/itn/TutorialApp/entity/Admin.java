package com.itn.TutorialApp.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
public class Admin {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;
    private String username;
    private String password;

    @Transient
    private String cPassword;

    private String email;
    private String phoneNumber;
    private String address;
    private String gender;

    // Fetch only what is needed to avoid lazy-loading problems
    @OneToOne(mappedBy = "admin", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private AdminRole adminRole;
}