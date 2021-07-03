package com.example.demo.controller.page;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/feedback")
public class FeedbackPageStatus {
    @RequestMapping(value="feedbackStatus", method = RequestMethod.GET)
    public String followStatus(){return "/jsp/feedback_status";}
}
