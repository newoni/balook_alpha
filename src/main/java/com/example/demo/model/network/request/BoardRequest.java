package com.example.demo.model.network.request;

import lombok.Builder;
import lombok.Data;
import lombok.experimental.Accessors;

import java.util.Date;

@Data
@Builder
@Accessors(chain = true)
public class BoardRequest {
    Long id;
    String title;
    String author;
    String filePath;
    String contents;
    Date boardedAt;
    Date updatedAt;
}
