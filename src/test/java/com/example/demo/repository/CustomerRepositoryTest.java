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
        Customer customer1 = new Customer();
        customer1.setId(1L);
        customer1.setCustomerId("testId");
        customer1.setPassword("testPw");
        customer1.setNickName("newoni");
        customer1.setName("KH");

        Customer customer2 = Customer.builder()
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
        System.out.println(customer1);
        System.out.println(customer2);

        Customer newCustomer1 = customerRepository.save(customer1);
        Customer newCustomer2 = customerRepository.save(customer2);
//
        System.out.println("hi....");
        System.out.println("hi....");
        System.out.println("hi....");
        System.out.println("hi....");

        System.out.println("customer1");
        System.out.println(newCustomer1);

        System.out.println("customer2");
        System.out.println(newCustomer2);
        }
}
