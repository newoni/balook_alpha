package com.example.demo.model.network.response;

import lombok.Builder;
import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Builder
@Accessors(chain = true)
public class CustomerResponse {
    private String customerId;
    private String password;
    private String nickName;
    private String picturePath;
}
