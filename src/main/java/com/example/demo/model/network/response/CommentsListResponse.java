package com.example.demo.model.network.response;

import lombok.Builder;
import lombok.Data;
import lombok.experimental.Accessors;

import java.util.ArrayList;

@Data
@Builder
@Accessors(chain = true)
public class CommentsListResponse {
    private ArrayList<CommentsResponse> commentsResponseArrayList;
}
