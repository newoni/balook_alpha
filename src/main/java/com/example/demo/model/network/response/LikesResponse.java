package com.example.demo.model.network.response;

import lombok.Builder;
import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Builder
@Accessors(chain = true)
public class LikesResponse {
    private String author;
    private String targetBoard;
    private Long likeCount;
}
