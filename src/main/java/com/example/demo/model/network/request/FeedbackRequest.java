package com.example.demo.model.network.request;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

@Data
@Builder
@Accessors(chain = true)
@NoArgsConstructor
@AllArgsConstructor
public class FeedbackRequest {
    private String requestUserNickName;
    private String responseUserNickName;
    private Long boardId;
    private String title;
    private String contents;
    private String nickName;
}
