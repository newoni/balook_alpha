package com.example.demo.service;

import com.example.demo.model.entity.Board;
import com.example.demo.model.entity.Customer;
import com.example.demo.model.network.Header;
import com.example.demo.model.network.request.LikesRequest;
import com.example.demo.model.network.response.LikesResponse;
import com.example.demo.repository.BoardRepository;
import com.example.demo.repository.CustomerRepository;
import com.example.demo.repository.LikesRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class LikesService {
    @Autowired
    LikesRepository likesRepository;
    @Autowired
    CustomerRepository customerRepository;

    public Header<LikesResponse> countLike(Header<LikesRequest> header){
        LikesRequest likesRequest = header.getData();
        Long likeCountNumber;


        try {
            Customer resCustomer = customerRepository.findByNickName(likesRequest.getAuthor());
            likeCountNumber = likesRepository.countByAuthor(resCustomer.getId());
        }catch(Exception e){
            e.printStackTrace();
            likeCountNumber = 0L;
        }

        LikesResponse likesResponse = LikesResponse.builder()
                .likeCount(likeCountNumber)
                .build();

        return Header.OK(likesResponse);
    }
}
