package com.example.demo.controller;

import com.example.demo.model.entity.Chat;
import com.example.demo.model.network.Header;
import com.example.demo.model.network.request.ChatRequest;
import com.example.demo.model.network.response.ChatListResponse;
import com.example.demo.model.network.response.ChatResponse;
import com.example.demo.model.websocket.ChatRoom;
import com.example.demo.service.ChatService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@RestController
@RequestMapping(value="/chat")
@Slf4j
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

    @RequestMapping(value="/check4Create", method=RequestMethod.POST)
    public Header<ChatResponse> check4Create(@RequestBody Header<ChatRequest> request, HttpSession session){

        log.info("request value is " + request);
        String nickname = session.getAttribute("nickname").toString();
        String partner = request.getData().getOpponent();

        log.info("partner is "+partner);
        Header<ChatResponse> result =  chatService.check4Create(nickname, partner);
        session.setAttribute("roomId",result.getData().getFilePath());

        return result;
    }

    @PostMapping
    public ChatRoom createRoom(@RequestParam String name){
        System.out.println("ChatRoom is invoked");
        return chatService.createRoom(name);
    }

    @GetMapping
    public List<ChatRoom> findAllRoom(){
        return chatService.findAllRoom();
    }
}
