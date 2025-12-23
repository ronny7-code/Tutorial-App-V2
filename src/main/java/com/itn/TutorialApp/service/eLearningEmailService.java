package com.itn.TutorialApp.service;

import java.io.File;

public interface eLearningEmailService {

    boolean sendMail(String to, String subject, String message);
    boolean sendMail(String to, String subject, String message, File file);
}
