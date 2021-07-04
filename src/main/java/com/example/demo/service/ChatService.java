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

    public Header<ChatListResponse> showChatList(Header<ChatRequest> request){
        ChatRequest chatRequest = request.getData();

        Customer customer = customerRepository.findByNickNameLike(chatRequest.getNickName());

        List<Chat> resChatList = chatRepository.findByParticipant1OOrAndParticipant2(customer.getId(), customer.getId());

        ArrayList<ChatResponse> chatResponseList = new ArrayList<ChatResponse>();

        for(Chat chat: resChatList){
            Customer participant1 = customerRepository.findById(chat.getParticipant1()).get();
            Customer participant2 = customerRepository.findById(chat.getParticipant2()).get();

            ChatResponse chatResponse = ChatResponse.builder()
                    .participant1(participant1.getNickName())
                    .participant2(participant2.getNickName())
                    .contents(chat.getFilePath())
                    .build();

            chatResponseList.add(chatResponse);
        }

        ChatListResponse chatListResponse = ChatListResponse.builder()
                .chatResponseList(chatResponseList)
                .build();
        return Header.OK(chatListResponse);

    }
}
