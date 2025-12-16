package com.itn.TutorialApp.service;

import com.itn.TutorialApp.entity.MessageFromUser;

import java.util.List;
import java.util.Optional;

public interface MessageFromUserService {

    void addMessage(MessageFromUser message);

    List<MessageFromUser> getAllMessagesFromTheUser();

    Optional<MessageFromUser> getMessageFromUserById(Long id);

    void deleteMessageFromUser(Long id);

}