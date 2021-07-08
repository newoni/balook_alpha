package com.example.demo.model.websocket;


import lombok.Data;

@Data
public class ChatMessage {
    public enum MessageType{
        ENTER, TALK
    }
    private MessageType type;
    private String roomId;
    private String message;
    private String sender;

}
