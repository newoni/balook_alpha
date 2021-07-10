package com.example.demo.model.network.response;

import lombok.Builder;
import lombok.Data;
import lombok.experimental.Accessors;

import java.time.LocalDate;

@Data
@Builder
@Accessors(chain = true)
public class CommentsResponse {
    private String author;
    private String contents;
    private LocalDate boardedAt;
}
