package com.example.demo.model.network.response;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

@Data
@Builder
@Accessors(chain = true)
@AllArgsConstructor
@NoArgsConstructor
public class ChatResponse {
    private String participant1;
    private String participant2;
    private String contents;
    private String opponentPicturePath;
}
