package com.example.demo.controller;

import com.example.demo.model.network.Header;
import com.example.demo.model.network.request.ChatRequest;
import com.example.demo.model.network.response.ChatListResponse;
import com.example.demo.model.network.response.ChatResponse;
import com.example.demo.model.websocket.ChatRoom;
import com.example.demo.service.ChatService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@RestController
@RequestMapping(value="/chat")
public class ChatController {
    @Autowired
    ChatService chatService;

    @RequestMapping(value= "/showChatList/{nickname}", method= RequestMethod.GET)
    public Header<ChatListResponse> showChatList(@PathVariable String nickname, HttpSession session){
        System.out.println("here is chat rest controller nickname is");
        System.out.println(nickname);


        Header<ChatListResponse> resHeader =  chatService.showChatList(nickname);

        session.setAttribute("chats", resHeader);

        System.out.println("here is chat rest controller resHeader is");
        System.out.println(resHeader);

        return resHeader;
    }

    @PostMapping(value="")
    public ChatRoom createRoom(@RequestParam String name){
        return chatService.createRoom(name);
    }

    @GetMapping
    public List<ChatRoom> findAllRoom(){
        return chatService.findAllRoom();
    }
}
