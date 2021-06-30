package com.example.demo.model.network.request;

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
    private String nickname;
    private String passwordCheck;
}
