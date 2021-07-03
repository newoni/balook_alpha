package com.example.demo.repository;

import com.example.demo.model.entity.Feedback;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface FeedbackRepository extends JpaRepository<Feedback, Long> {
    Long countByRequestTo(Long requestTo);
}
