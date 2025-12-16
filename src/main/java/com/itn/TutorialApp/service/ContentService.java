package com.itn.TutorialApp.service;

import com.itn.TutorialApp.entity.Content;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Optional;

public interface ContentService {

    void addContent(Content content);

    List<Content> getAllContents();

    Optional<Content> getContentById(Long id);

    void deleteContentById(Long id);

    Content updateContent(Content content, Long id);

    void uploadContent(MultipartFile file);
}