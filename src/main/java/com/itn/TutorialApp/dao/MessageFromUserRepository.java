package com.itn.TutorialApp.dao;

import com.itn.TutorialApp.entity.MessageFromUser;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MessageFromUserRepository extends JpaRepository<MessageFromUser, Long> {
}