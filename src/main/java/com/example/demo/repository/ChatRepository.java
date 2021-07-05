package com.example.demo.repository;

import com.example.demo.model.entity.Chat;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ChatRepository extends JpaRepository<Chat, Long> {
    List<Chat> findByParticipant1OrParticipant2(Long participant1, Long participant2);
}
