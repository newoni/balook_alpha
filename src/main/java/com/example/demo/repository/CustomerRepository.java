package com.example.demo.repository;

import com.example.demo.model.entity.Customer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface CustomerRepository extends JpaRepository<Customer, Long> {
    Customer findByCustomerIdLike(String CustomerId);

    Customer findByCustomerIdAndPassword(String customerId, String password);

    Customer findByNameAndEmailAndPhoneNumber(String name, String email, String phoneNumber);

    Customer findByNameAndEmailAndPhoneNumberAndCustomerId(String name, String email, String phoneNumber, String CustomerId);

}
