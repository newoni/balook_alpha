package com.example.demo.model.websocket;

import com.example.demo.service.ChatService;
import lombok.Builder;
import lombok.Getter;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.socket.WebSocketSession;

import java.io.IOException;
import java.util.HashSet;
import java.util.Set;

@Getter
@Slf4j
public class ChatRoom {
    private String roomId;
    private String name;
    private Set<WebSocketSession> sessions = new HashSet<>();

    @Builder
    public ChatRoom(String roomId, String name){
        this.roomId = roomId;
        this.name = name;
    }

    public void handleActions(WebSocketSession session, ChatMessage chatMessage, ChatService chatService) throws IOException {
        System.out.println("handleActions is invoked");

        log.info("sessions:");
        log.info(sessions.toString());
        log.info("this will be added");
        log.info(session.toString());

        if(chatMessage.getType().equals(ChatMessage.MessageType.ENTER)){
            sessions.add(session);
            chatMessage.setMessage(chatMessage.getSender()+" is entered");
            log.info("after add, sessions");
            System.out.println(sessions);
        }

        log.info("sendMessage will invoke");
        sendMessage(chatMessage, chatService);

    }

    public <T> void sendMessage(T message, ChatService chatService) throws IOException {

            sessions.parallelStream().forEach(session -> chatService.sendMessage(session, message));
    }
}
