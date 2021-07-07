package com.example.demo.controller.page;

import com.example.demo.model.network.Header;
import com.example.demo.model.network.request.LikesRequest;
import com.example.demo.model.network.response.LikesResponse;
import com.example.demo.service.LikesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping(value = "/likes")
public class LikesPageController {
    @Autowired
    LikesService likesService;

    @RequestMapping(value="/likeStatus", method = RequestMethod.GET)
    public String likeStatus(){
        return "/jsp/like_status";
    }


}
