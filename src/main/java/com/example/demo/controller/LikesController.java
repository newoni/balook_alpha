package com.example.demo.controller;

import com.example.demo.model.network.Header;
import com.example.demo.model.network.request.LikesRequest;
import com.example.demo.model.network.response.LikesResponse;
import com.example.demo.service.CustomerService;
import com.example.demo.service.LikesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/likes")
class LikesController {
    @Autowired
    private LikesService likesService;



}
