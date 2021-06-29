package com.example.demo.model.request;

import lombok.Data;

import java.util.Date;

@Data
public class ChatRequest {
    private Date date;
    private String contents;
    private String nickName;
}


