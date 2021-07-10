package com.example.demo.model.network.request;

import lombok.Builder;
import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Builder
@Accessors(chain = true)
public class CommentsRequest {
    private String author;
    private String contents;
    private String title;
}
