package com.example.demo.controller.page;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class controller {
    @RequestMapping(value = "/main",method = RequestMethod.GET)
    public String main(){
        return "/jsp/main";
    }

//    @RequestMapping(value = "/board", method = RequestMethod.GET, produces="application/json; charset=utf-8")
    @RequestMapping(value = "/board", method = RequestMethod.GET)
    public String board_write() {
        return "/jsp/board_write";         // 실제 호출될 /WEB-INF/jsp/views/viewtest.jsp
    }
}
