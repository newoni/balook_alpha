package com.example.demo.controller;

import com.example.demo.model.network.Header;
import com.example.demo.model.network.request.ChatRequest;
import com.example.demo.model.network.response.ChatListResponse;
import com.example.demo.model.network.response.ChatResponse;
import com.example.demo.service.ChatService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value="/chat")
public class ChatListController {
    @Autowired
    ChatService chatService;

    @RequestMapping(value= "/showChatList", method= RequestMethod.GET)
    public Header<ChatListResponse> showChatList(@RequestBody Header<ChatRequest> request){
        System.out.println("here is chat rest controller header is");
        System.out.println(request);

        return chatService.showChatList(request);
    }
}
