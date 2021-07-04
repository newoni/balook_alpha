package com.example.demo.controller.page;

import nonapi.io.github.classgraph.json.JSONUtils;
import org.springframework.jdbc.datasource.init.ScriptUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value= "/chat")
public class ChatPageController {

    @RequestMapping(value="/showChatListPage", method = RequestMethod.GET)
    public String showChatList(){

        System.out.println("here is chat controller showChatList is invoked");
        return "/jsp/chatting";
    }

    @RequestMapping(value="/showChat", method = RequestMethod.GET)
    public String showChat(){
        return "/jsp/chatting_view";
    }
}
