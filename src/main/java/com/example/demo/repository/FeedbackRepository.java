package com.example.demo.repository;

import com.example.demo.model.entity.Feedback;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface FeedbackRepository extends JpaRepository<Feedback, Long> {
    Long countByRequestTo(Long requestTo);

    List<Feedback> findByTargetBoard(Long targetBoard);
}
