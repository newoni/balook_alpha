package com.example.demo.controller;

import com.example.demo.model.network.Header;
import com.example.demo.model.network.request.LikesRequest;
import com.example.demo.model.network.response.BoardResponse;
import com.example.demo.model.network.response.LikesResponse;
import com.example.demo.service.CustomerService;
import com.example.demo.service.LikesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

@RestController
@RequestMapping("/likes")
class LikesController {
    @Autowired
    private LikesService likesService;

    @RequestMapping(value="/check/{author}/{title}", method = RequestMethod.GET)
    public void create(@PathVariable String author, @PathVariable String title, HttpSession session){

        Boolean isExist = likesService.check(session.getAttribute("nickname").toString(), author, title);
        if(isExist){ // delete
            System.out.println(isExist);
            likesService.delete(session.getAttribute("nickname").toString(), author, title);
        }else { // create
            System.out.println(isExist);
            likesService.create(session.getAttribute("nickname").toString(), author, title);
        }
    }

    @RequestMapping(value="/likeStatus/{nickname}", method=RequestMethod.GET)
    public String showLikedBoards(@PathVariable String nickname, HttpSession session) throws IOException {
        System.out.println("Here is show Liked Boards which is in Likes Controller");
        try{
        ArrayList<BoardResponse> boardResponseArrayList = likesService.showLikedBoards(nickname).getData().getBoardList();
        session.setAttribute("boardList", boardResponseArrayList);
        return "OK";
        }catch(Exception e){
            return "ERROR";
        }

    }
}
