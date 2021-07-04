package com.example.demo.controller.page;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value= "/chat")
public class ChatPageController {

    @RequestMapping(value="/ChatList", method = RequestMethod.GET)
    public String showChatList(){
        return "/jsp/chatting";
    }

    @RequestMapping(value="/showChat", method = RequestMethod.GET)
    public String showChat(){
        return "/jsp/chatting_view";
    }
}
