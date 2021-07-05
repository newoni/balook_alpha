package com.example.demo.model.network.response;

import com.example.demo.model.Stone;
import lombok.Builder;
import lombok.Data;
import lombok.experimental.Accessors;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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
    private ArrayList<Stone> gibo;
}
