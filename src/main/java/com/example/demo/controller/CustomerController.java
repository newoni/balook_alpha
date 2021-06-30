package com.example.demo.controller;

import com.example.demo.model.network.Header;
import com.example.demo.model.network.request.CustomerRequest;
import com.example.demo.model.network.response.CustomerResponse;
import com.example.demo.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;

@RestController
@RequestMapping(value="/customer")
public class CustomerController {
    @Autowired
    CustomerService customerService;

//    @RequestMapping(value = "/test", method = RequestMethod.GET, produces = "application/json; charset=utf8")
    @RequestMapping(value = "/test", method = RequestMethod.GET)
    public String member_log_in() {
        return "/jsp/login";         // 실제 호출될 /WEB-INF/jsp/views/viewtest.jsp
    }

    @RequestMapping(value = "", method = RequestMethod.POST)
    public Header<CustomerResponse> create(@RequestBody Header<CustomerRequest> header){
        System.out.println(header);
        return customerService.signUp(header);
    }
}