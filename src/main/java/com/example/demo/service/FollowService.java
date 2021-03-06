package com.example.demo.service;

import com.example.demo.model.entity.Customer;
import com.example.demo.model.network.Header;
import com.example.demo.model.network.request.FollowRequest;
import com.example.demo.model.network.response.FollowResponse;
import com.example.demo.repository.CustomerRepository;
import com.example.demo.repository.FollowRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FollowService {
    @Autowired
    private FollowRepository followRepository;


}
