package com.example.demo.controller;

import com.example.demo.model.network.Header;
import com.example.demo.model.network.request.FollowRequest;
import com.example.demo.model.network.response.FollowResponse;
import com.example.demo.service.CustomerService;
import com.example.demo.service.FollowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value="/follow")
public class FollowController {
    @Autowired
    private FollowService followService;


}
