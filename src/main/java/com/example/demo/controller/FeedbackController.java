package com.example.demo.controller;

import com.example.demo.model.network.Header;
import com.example.demo.model.network.request.FeedbackRequest;
import com.example.demo.model.network.response.FeedbackResponse;
import com.example.demo.service.CustomerService;
import com.example.demo.service.FeedbackService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value="/feedback")
public class FeedbackController {
    @Autowired
    private FeedbackService feedbackService;


}
