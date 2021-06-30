package com.example.demo.service;

import com.example.demo.model.entity.Customer;
import com.example.demo.model.network.Header;
import com.example.demo.model.network.request.CustomerRequest;
import com.example.demo.model.network.response.CustomerResponse;
import com.example.demo.repository.CustomerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;

@Service
public class CustomerService {
    @Autowired
    CustomerRepository customerRepository;

    public Header<CustomerResponse> signUp(Header<CustomerRequest> header){
        CustomerRequest customerRequest = header.getData();

//       check Duplication PW

        Customer customer = Customer.builder()
                .customerId(customerRequest.getUserId())
                .password(customerRequest.getPassword())
                .name(customerRequest.getName())
                .nickName(customerRequest.getNickname())
                .eMail(customerRequest.getEmail())
                .phoneNumber(customerRequest.getFrontPhoneNumber())
                .build();

        Customer newCustomer = customerRepository.save(customer);

//        result part
        Header<CustomerResponse> resHeader = new Header<CustomerResponse>();
        CustomerResponse customerResponse = CustomerResponse.builder()
                .customerId(newCustomer.getCustomerId())
                .nickName(newCustomer.getNickName())
                .build();
        resHeader.setData(customerResponse);
        resHeader.setTime(LocalDateTime.now().toString());

        return resHeader;
    }

//    public Header<CustomerResponse> idDuplicationCheck(Header<CustomerRequest> header){
//        return resHeader;
//    }
//
//    public Boolean pwDuplicationCheck(Header<CustomerRequest> header){
//
//    }
}
