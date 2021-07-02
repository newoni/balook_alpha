package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class controller {

    @RequestMapping(value = "/main",method = RequestMethod.GET)
    public String main(){
        return "/jsp/main";
    }

    @RequestMapping(value = "/customer/signIn", method = RequestMethod.GET)
    public String login(){
        return "/jsp/login";
    }

    @RequestMapping(value = "/customer/findCustomerId", method = RequestMethod.GET)
    public String findCustomerId(){
        return "/jsp/find_id";
    }

    @RequestMapping(value = "/customer/findCustomerPassword", method = RequestMethod.GET)
    public String findCustomerPassword(){
        return "/jsp/find_pw";
    }

    @RequestMapping(value = "/customer/signUp", method = RequestMethod.GET)
    public String member_join() {
        return "/jsp/member_join";         // 실제 호출될 /WEB-INF/jsp/views/viewtest.jsp
    }

//    @RequestMapping(value = "/board", method = RequestMethod.GET, produces="application/json; charset=utf-8")
    @RequestMapping(value = "/board", method = RequestMethod.GET)
    public String board_write() {
        return "/jsp/board_write";         // 실제 호출될 /WEB-INF/jsp/views/viewtest.jsp
    }
}
