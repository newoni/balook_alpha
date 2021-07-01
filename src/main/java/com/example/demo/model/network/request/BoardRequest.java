package com.example.demo.model.network.request;

import lombok.Data;

import java.util.Date;

@Data
public class BoardRequest {
    Long id;
    String title;
    String author;
    String filePath;
    String contents;
    Date boardedAt;
    Date updatedAt;
}
