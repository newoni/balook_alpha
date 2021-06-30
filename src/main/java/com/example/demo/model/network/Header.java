package com.example.demo.model.network;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Header<T> {
    private String time;
    private T data;
}
