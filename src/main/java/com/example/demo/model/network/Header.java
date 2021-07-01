package com.example.demo.model.network;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.time.LocalDateTime;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Accessors(chain = true)
public class Header<T> {
    private String time;
    private T data;
    private String resultCode;

    public static<T> Header<T> OK(T responseData){
         return (Header<T>)Header.builder()
                 .time(LocalDateTime.now().toString())
                 .data(responseData)
                 .resultCode("OK")
                 .build();

    }

    public static<T> Header<T> OK(){
        return (Header<T>)Header.builder()
                .time(LocalDateTime.now().toString())
                .resultCode("OK")
                .build();
    }

    public static<T> Header<T> ERROR(){
        return (Header<T>)Header.builder()
                .time(LocalDateTime.now().toString())
                .resultCode("ERROR")
                .build();
    }
}
