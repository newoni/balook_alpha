package com.example.demo.controller;

import com.example.demo.model.network.Header;
import com.example.demo.model.network.request.FeedbackRequest;
import com.example.demo.model.network.response.FeedbackListResponse;
import com.example.demo.model.network.response.FeedbackResponse;
import com.example.demo.service.CustomerService;
import com.example.demo.service.FeedbackService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;

@RestController
@RequestMapping(value="/feedback")
@Slf4j
public class FeedbackController {
    @Autowired
    private FeedbackService feedbackService;

    @RequestMapping(value="/createFeedback", method=RequestMethod.POST)
    Header<FeedbackResponse> createFeedback(@RequestBody Header<FeedbackRequest> request, HttpSession session){
        log.info("request: " + request);
        Header<FeedbackResponse> result = feedbackService.create(request, session.getAttribute("nickname").toString());

        log.info("get One Board Feedback List is invoked -> feedback repository method");
        Header<FeedbackListResponse> headerWithFeedbackListResponse = feedbackService.getOneBoardFeedbackList(request.getData().getRequestUserNickName(), request.getData().getTitle());

        session.setAttribute("feedbackList", headerWithFeedbackListResponse.getData().getFeedbackResponseArrayList());

        return result;
    }


}
