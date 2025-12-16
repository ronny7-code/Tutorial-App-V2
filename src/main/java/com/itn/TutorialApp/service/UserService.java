package com.itn.TutorialApp.service;

import com.itn.TutorialApp.entity.User;

import java.util.List;
import java.util.Optional;

public interface UserService {

    void addUser(User user);

    List<User> getAllUser();

    Optional<User> getUserById(Long id);

    void deleteUserById(Long id);

    void updateUser(User user);

    User findByUsername(String username);
}