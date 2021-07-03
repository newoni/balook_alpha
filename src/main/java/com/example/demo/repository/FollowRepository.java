package com.example.demo.repository;

import com.example.demo.model.entity.Follow;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface FollowRepository extends JpaRepository<Follow, Long>{
    Long countByFollowTo(Long followTo);
}
