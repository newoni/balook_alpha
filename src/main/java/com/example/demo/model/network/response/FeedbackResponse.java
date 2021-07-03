package com.example.demo.model.network.response;

import lombok.Builder;
import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Builder
@Accessors(chain = true)
public class FeedbackResponse {
    private String status;
    private String contents;
    private String requestTo;
    private String requestBy;
}
