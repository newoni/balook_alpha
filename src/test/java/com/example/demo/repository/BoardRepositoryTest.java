package com.example.demo.repository;

import com.example.demo.model.entity.Board;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class BoardRepositoryTest {
    @Autowired
    BoardRepository boardRepository;

    @Test
    public void create(){
        Board board = Board.builder()
                .id(1L)
                .author("newoni")
                .title("test Title")
                .filePath("test")
                .build();

        System.out.println(board);

        Board newBoard = boardRepository.save(board);
    }


}
