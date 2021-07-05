package com.example.demo.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

@Data
@Builder
@Accessors
@AllArgsConstructor
@NoArgsConstructor
public class Stone {
    private String player;
    private String row;
    private String col;
}
