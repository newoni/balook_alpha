package com.example.demo.repository;

import com.example.demo.model.entity.Customer;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class CustomerRepositoryTest{
    @Autowired
    private CustomerRepository customerRepository;

    @Test
    public void create() {
        Customer customer = Customer.builder()
                .id(1L)
                .customerId("testId")
                .password("testPw")
                .nickName("newoni")
                .name("KH")
                .build();
        System.out.println("hello");
        System.out.println("hello");
        System.out.println("hello");
        System.out.println("hello");
        System.out.println(customer);

        Customer newCustomer = customerRepository.save(customer);

        System.out.println("hi....");
        System.out.println("hi....");
        System.out.println("hi....");
        System.out.println("hi....");

        System.out.println(newCustomer);
        }
}
