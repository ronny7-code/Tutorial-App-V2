package com.itn.TutorialApp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMailMessage;
import org.springframework.stereotype.Service;

import java.io.File;
import java.util.logging.Level;
import java.util.logging.Logger;

@Service
public class eLearningEmailServiceImpl implements eLearningEmailService{

    private static final Logger logger = Logger.getLogger("Email Service");

    @Autowired
    private JavaMailSender javaMailSender;

    @Override
    public boolean sendMail(String to, String subject, String message) {
        try {
            SimpleMailMessage mail = new SimpleMailMessage();
            mail.setFrom("bijay98813@gmail.com");
            mail.setTo(to);
            mail.setSubject(subject);
            mail.setText(message);
            javaMailSender.send(mail);

        }
        catch (Exception e) {
            logger.log(Level.SEVERE, "Email could not be sent", e);
            return false;
        }
        return true;
    }

    @Override
    public boolean sendMail(String to, String subject, String message, File file) {

//        try {
//            MimeMailMessage mail = new MimeMailMessage();
//            mail.setFrom("bijay98813@gmail.com");
//            mail.setTo(to);
//            mail.setSubject(subject);
//            mail.setText(message);
//            javaMailSender.send(mail);
//        }
//        catch (Exception e) {
//            logger.log(Level.SEVERE, "Email could not be sent", e);
//            return false;
//        }

        return true;
    }
}
