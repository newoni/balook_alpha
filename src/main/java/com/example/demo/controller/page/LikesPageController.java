package com.example.demo.controller.page;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/likes")
public class LikesPageController {
    @RequestMapping(value="/likeStatus" ,method = RequestMethod.GET)
    public String likeStatus(){
        return "/jsp/like_status";
    }
}
