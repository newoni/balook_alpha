package com.example.demo.controller;

import com.example.demo.model.network.Header;
import com.example.demo.model.network.request.CommentsRequest;
import com.example.demo.model.network.response.CommentsListResponse;
import com.example.demo.model.network.response.CommentsResponse;
import com.example.demo.service.CommentsService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;

@RestController
@RequestMapping(value="/comments")
@Slf4j
public class CommentsController {
    @Autowired
    CommentsService commentsService;

    @RequestMapping(value="/createComments", method = RequestMethod.POST)
    public Header<CommentsResponse> create(@RequestBody Header<CommentsRequest> request, HttpSession session){
        log.info("request: " +request);
        log.info("comments create method is invoked");
        Header<CommentsResponse> result = commentsService.create(request, session.getAttribute("nickname").toString());

        log.info("getOneBoardCommentsList is invoked which is comments repository method");
        Header<CommentsListResponse> headerWithCommentsListResponse = commentsService.getOneBoardCommentsList(request.getData().getAuthor(), request.getData().getTitle());

        log.info("set session commentsList");
        session.setAttribute("commentsList", headerWithCommentsListResponse.getData().getCommentsResponseArrayList());

        return result;
    }
}
