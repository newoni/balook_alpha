package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class controller {
    @RequestMapping(value = "/board", method = RequestMethod.GET)
    public String helloworld() {
        return "helloworld";         // 실제 호출될 /WEB-INF/jsp/views/viewtest.jsp
    }
}
