package com.itn.TutorialApp.service;

import com.itn.TutorialApp.entity.Content;
import com.itn.TutorialApp.dao.ContentRepository;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

@Service
public class ContentServiceImpl implements ContentService{

    @Autowired
    private ContentRepository contentRepository;

    @Override
    @Transactional
    public void addContent(Content content) {
        contentRepository.save(content);
    }

    @Override
    public List<Content> getAllContents() {
        return contentRepository.findAll();
    }

    @Override
    public Optional<Content> getContentById(Long id) {
        return contentRepository.findById(id);
    }

    @Override
    @Transactional
    public void deleteContentById(Long id) {
        contentRepository.deleteById(id);
    }

    @Override
    @Transactional
    public Content updateContent(Content content, Long id) {
        Content content1 = contentRepository.findById(id).orElseThrow();
        content1.setName(content.getName());
        content1.setType(content.getType());
        content1.setFileName(content.getFileName());
        content1.setCourse(content.getCourse());
        content1.setDescription(content.getDescription());
        content1.setAddedDate(LocalDate.now());
        content1.setMultipartFile(content.getMultipartFile());

        return contentRepository.save(content1);
    }

    @Override
    @Transactional
    public void uploadContent(MultipartFile file) {
        try {
            String fileName = file.getOriginalFilename();
            Path path = Paths.get("C://Users//bijay//Documents//Tutorial_App_Contents//" + fileName);
            Files.createDirectories(path.getParent());
            Files.copy(file.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);

//            String downloadUri = ServletUriComponentsBuilder.fromCurrentContextPath()
//                    .path("/files/download/")
//                    .path(fileName)
//                    .toUriString();


        } catch (IOException e) {
            System.out.println("File upload failed.");
        }

    }
}