package com.example.demo.model.network.request;

import lombok.Data;

import java.time.LocalDate;
import java.util.Date;

@Data
public class ChatRequest {
    private LocalDate date;
    private String contents;
    private String nickName;
}


