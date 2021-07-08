package com.example.demo.model.websocket;


import lombok.Data;

@Data
public class ChatMessage {
    private MessageType Type;
    private String roomId;
    private String content;
    private String sender;

}
