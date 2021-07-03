package com.example.demo.model.network.response;

import lombok.Builder;
import lombok.Data;
import lombok.experimental.Accessors;

import java.time.LocalDate;
import java.util.Date;

@Data
@Builder
@Accessors(chain = true)
public class BoardResponse {
    private Long id;
    private String title;
    private String author;
    private String filePath;
    private String contents;
    private LocalDate boardedAt;
    private LocalDate updatedAt;
}
