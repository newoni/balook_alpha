package com.example.demo.model.network.request;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Accessors(chain = true)
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
    private String picturePath;

}
