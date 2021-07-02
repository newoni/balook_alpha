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

    public Header<CustomerResponse> signIn(Header<CustomerRequest> header){
        CustomerRequest customerRequest = header.getData();

        Customer customer = Customer.builder()
                .customerId(customerRequest.getUserId())
                .password(customerRequest.getPassword())
                .build();
        try {
            Customer resCustomer = customerRepository.findByCustomerIdAndPassword(customer.getCustomerId(), customer.getPassword());

            CustomerResponse customerResponse = CustomerResponse.builder()
                    .customerId(resCustomer.getCustomerId())
                    .nickName(resCustomer.getNickName())
                    .build();

            return Header.OK(customerResponse);
        }catch(Exception e){
            return Header.ERROR();
        }
    }

    public Header<CustomerResponse> findCustomerId(Header<CustomerRequest> header){
        CustomerRequest customerRequest = header.getData();

        Customer customer = Customer.builder()
                .name(customerRequest.getName())
                .phoneNumber(customerRequest.getFrontPhoneNumber())
                .email(customerRequest.getEmail())
                .build();

        Customer newCustomer = customerRepository.findByNameAndEmailAndPhoneNumber(customer.getName(), customer.getEmail(), customer.getPhoneNumber());

        System.out.println("newCustomer");
        System.out.println(newCustomer);

        CustomerResponse customerResponse = CustomerResponse.builder()
                .customerId(newCustomer.getCustomerId())
                .build();

        System.out.println("customer response");
        System.out.println(customerResponse);

        return Header.OK(customerResponse);
    }

    public Header<CustomerResponse> findCustomerPassword(Header<CustomerRequest> header){
        CustomerRequest customerRequest = header.getData();

        Customer customer = Customer.builder()
                .name(customerRequest.getName())
                .phoneNumber(customerRequest.getFrontPhoneNumber())
                .email(customerRequest.getEmail())
                .customerId((customerRequest.getUserId()))
                .build();

        Customer newCustomer = customerRepository.findByNameAndEmailAndPhoneNumberAndCustomerId(customer.getName(), customer.getEmail(), customer.getPhoneNumber(), customer.getCustomerId());

        System.out.println("newCustomer");
        System.out.println(newCustomer);

        CustomerResponse customerResponse = CustomerResponse.builder()
                .password(newCustomer.getPassword())
                .build();

        System.out.println("customer response");
        System.out.println(customerResponse);

        return Header.OK(customerResponse);
    }

    public Header<CustomerResponse> signUp(Header<CustomerRequest> header){
        CustomerRequest customerRequest = header.getData();

//       check Duplication PW

        Customer customer = Customer.builder()
                .customerId(customerRequest.getUserId())
                .password(customerRequest.getPassword())
                .name(customerRequest.getName())
                .nickName(customerRequest.getNickname())
                .email(customerRequest.getEmail())
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
        System.out.println("print findID result ");
        System.out.println(findCustomer);
        System.out.println(findCustomer==null);
        if(findCustomer==null){
            return Header.OK();
        }else{
            return Header.ERROR();
        }
    }

}
