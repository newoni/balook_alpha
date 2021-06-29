package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.HashMap;

@Controller

@RequestMapping(value="/customer")
public class CustomerController {
    @RequestMapping(value = "", method = RequestMethod.GET)
    public String member_join() {
        return "/jsp/member_join";         // 실제 호출될 /WEB-INF/jsp/views/viewtest.jsp
    }

    @RequestMapping(value = "/test", method = RequestMethod.GET)
    public String member_log_in() {
        return "/jsp/login";         // 실제 호출될 /WEB-INF/jsp/views/viewtest.jsp
    }

    @RequestMapping(value = "/signUp", method = RequestMethod.POST)
    public void SignUp(@RequestBody HashMap<String, Object> map){
        System.out.println("hello world");
        System.out.println("hello world");
        System.out.println("hello world");
        System.out.println("hello world");
        System.out.println("hello world");
        System.out.println("hello world");
        System.out.println("hello world");
        System.out.println("hello world");
        System.out.println(map);
    }

}
