package com.itn.TutorialApp.dao;

import com.itn.TutorialApp.entity.Content;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ContentRepository extends JpaRepository<Content, Long> {
}