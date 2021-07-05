package com.example.demo.service;

import com.example.demo.model.entity.Chat;
import com.example.demo.model.entity.Customer;
import com.example.demo.model.network.Header;
import com.example.demo.model.network.request.ChatRequest;
import com.example.demo.model.network.response.ChatListResponse;
import com.example.demo.model.network.response.ChatResponse;
import com.example.demo.repository.ChatRepository;
import com.example.demo.repository.CustomerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class ChatService {
    @Autowired
    ChatRepository chatRepository;

    @Autowired
    CustomerRepository customerRepository;

    public Header<ChatListResponse> showChatList(String request){

        ArrayList<ChatResponse> chatResponseList = new ArrayList<ChatResponse>();
        String opponentPicturePath = "/img/myprofile";
        try {
            Customer customer = customerRepository.findByNickNameLike(request);
            System.out.println("here is chat service . showChatList method customer.getId() is");
            System.out.println(customer.getId());


            List<Chat> resChatList = chatRepository.findByParticipant1OrParticipant2(customer.getId(), customer.getId());

            for (Chat chat : resChatList) {
                Customer participant1 = customerRepository.findById(chat.getParticipant1()).get();
                Customer participant2 = customerRepository.findById(chat.getParticipant2()).get();

                if(participant1.getNickName().equals(request)){
                    try{
                        opponentPicturePath = participant2.getPicturePath();
                    }catch(Exception e){
                        System.out.println("picture Path is not exist");
                    }
                }else{
                    try {
                        opponentPicturePath = participant1.getPicturePath();
                    }catch(Exception e){
                        System.out.println("picture Path is not exist");
                    }
                }

                ChatResponse chatResponse = ChatResponse.builder()
                        .participant1(participant1.getNickName())
                        .participant2(participant2.getNickName())
                        .contents(chat.getFilePath())
                        .build();

                chatResponseList.add(chatResponse);
            }
        }catch(Exception e){}

        ChatListResponse chatListResponse = ChatListResponse.builder()
                .chatResponseList(chatResponseList)
                .build();
        return Header.OK(chatListResponse);

    }
}
