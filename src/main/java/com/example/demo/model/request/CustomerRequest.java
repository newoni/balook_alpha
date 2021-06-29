package com.example.demo.model.request;

import lombok.Data;

@Data
public class CustomerRequest {
    private String userId;
    private String password;
    private String name;
    private String email;
    private String domain;
    private String frontPhoneNumber;
    private String backPhoneNumber;
}
