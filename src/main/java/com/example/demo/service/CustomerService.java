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

        CustomerResponse customerResponse = CustomerResponse.builder()
                .customerId(newCustomer.getCustomerId())
                .nickName(newCustomer.getNickName())
                .build();
        return Header.OK(customerResponse);
    }

    public Header<CustomerResponse> findIdByNickName(Header<CustomerRequest> header){
        CustomerRequest customerRequest = header.getData();
        Customer customer = Customer.builder()
                .customerId(customerRequest.getUserId())
                .build();

        Customer findCustomer = customerRepository.findByCustomerIdLike(customer.getCustomerId());

        CustomerResponse customerResponse = CustomerResponse.builder()
                .customerId(findCustomer.getCustomerId())
                .build();

        return Header.OK(customerResponse);
    }

}
