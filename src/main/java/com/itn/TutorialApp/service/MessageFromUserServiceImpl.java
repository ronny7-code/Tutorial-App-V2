package com.itn.TutorialApp.service;

import com.itn.TutorialApp.dao.MessageFromUserRepository;
import com.itn.TutorialApp.entity.MessageFromUser;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class MessageFromUserServiceImpl implements MessageFromUserService{

    @Autowired
    private MessageFromUserRepository messageRepo;

    @Override
    @Transactional
    public void addMessage(MessageFromUser message) {
        messageRepo.save(message);
    }

    @Override
    public List<MessageFromUser> getAllMessagesFromTheUser() {
        return messageRepo.findAll();
    }

    @Override
    public Optional<MessageFromUser> getMessageFromUserById(Long id) {
        return messageRepo.findById(id);
    }

    @Override
    @Transactional
    public void deleteMessageFromUser(Long id) {
        messageRepo.deleteById(id);
    }
}