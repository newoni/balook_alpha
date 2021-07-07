package com.example.demo.repository;

import com.example.demo.model.entity.Likes;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface LikesRepository extends JpaRepository<Likes, Long> {
    Long countByAuthor(Long authorId);

    Likes findByAuthorAndTargetBoard(Long author, Long targetBoard);

    List<Likes> findByAuthor(Long author);
}
