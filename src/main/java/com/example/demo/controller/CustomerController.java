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

import javax.servlet.http.HttpSession;
import java.util.HashMap;

@RestController
@RequestMapping(value="/customer")
public class CustomerController {
    @Autowired
    CustomerService customerService;

//    @RequestMapping(value = "/test", method = RequestMethod.GET, produces = "application/json; charset=utf8")
    @RequestMapping(value = "/signIn", method = RequestMethod.POST)
    public Header<CustomerResponse> signIn(@RequestBody Header<CustomerRequest> header) {
        return customerService.signIn(header);
    }

    @RequestMapping(value = "/findCustomerId", method = RequestMethod.POST)
    public Header<CustomerResponse> findCustomerId(@RequestBody Header<CustomerRequest> header, HttpSession session) {
        System.out.println("header");
        System.out.println(header);


        Header<CustomerResponse> result = customerService.findCustomerId(header);
        session.setAttribute("customerId", result.getData().getCustomerId());
        return result;
    }

    @RequestMapping(value = "/findCustomerPassword", method = RequestMethod.POST)
    public Header<CustomerResponse> findCustomerPassword(@RequestBody Header<CustomerRequest> header, HttpSession session) {
        System.out.println("header");
        System.out.println(header);
        Header<CustomerResponse> result = customerService.findCustomerPassword(header);
        session.setAttribute("password", result.getData().getPassword());
        return result;
    }

    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public Header<CustomerResponse> create(@RequestBody Header<CustomerRequest> header){
        System.out.println(header);
        return customerService.signUp(header);
    }

    @RequestMapping(value = "/checkDuplication", method = RequestMethod.POST)
    public Header<CustomerResponse> checkDuplication(@RequestBody Header<CustomerRequest> header){
        System.out.println(header);
        return customerService.findIdByNickName(header);
    }
}