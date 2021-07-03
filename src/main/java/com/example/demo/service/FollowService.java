package com.example.demo.service;

import com.example.demo.model.entity.Customer;
import com.example.demo.model.network.Header;
import com.example.demo.model.network.request.FollowRequest;
import com.example.demo.model.network.response.FollowResponse;
import com.example.demo.repository.CustomerRepository;
import com.example.demo.repository.FollowRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FollowService {
    @Autowired
    FollowRepository followRepository;

    @Autowired
    CustomerRepository customerRepository;

    public Header<FollowResponse> countFollow(Header<FollowRequest> request){
        FollowRequest followRequest = request.getData();

        Long followCount;

        try {
            Customer customer = customerRepository.findByNickName(followRequest.getNickName());
            followCount = followRepository.countByFollowBy(customer.getId());
        }catch(Exception e){
            followCount = 0L;
        }
            FollowResponse followResponse = FollowResponse.builder()
                    .followCount(followCount)
                    .build();

        return Header.OK(followResponse);

    }
}
