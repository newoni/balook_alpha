package com.example.demo.service;

import com.example.demo.model.entity.Chat;
import com.example.demo.model.entity.Customer;
import com.example.demo.model.network.Header;
import com.example.demo.model.network.request.ChatRequest;
import com.example.demo.model.network.response.ChatListResponse;
import com.example.demo.model.network.response.ChatResponse;
import com.example.demo.model.websocket.ChatRoom;
import com.example.demo.repository.ChatRepository;
import com.example.demo.repository.CustomerRepository;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import javax.annotation.PostConstruct;
import java.io.IOException;
import java.util.*;

@Service
@RequiredArgsConstructor
@Slf4j
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

    public Header<ChatResponse> check4Create(String nickname, String partner){
        Customer customer1 = customerRepository.findByNickNameLike(nickname);
        Customer customer2 = customerRepository.findByNickNameLike(partner);

        try {
            try {
                Chat resChat = chatRepository.findByParticipant1AndParticipant2(customer1.getId(), customer2.getId());

                ChatResponse chatResponse = ChatResponse.builder()
                        .participant1(nickname)
                        .participant2(partner)
                        .filePath(resChat.getFilePath())
                        .build();

                return Header.OK(chatResponse);

            } catch (Exception e) {
                log.info("There's no user/participant1, partner/participant2 pair");
                Chat resChat = chatRepository.findByParticipant1AndParticipant2(customer2.getId(), customer1.getId());

                ChatResponse chatResponse = ChatResponse.builder()
                        .participant1(nickname)
                        .participant2(partner)
                        .filePath(resChat.getFilePath())
                        .build();

                return Header.OK(chatResponse);
            }
        }catch(Exception e){
            log.info("there's no chat rooms");
            log.info("create chatRoom start");
            ChatRoom chatRoom = createRoom(nickname+partner);

            log.info("save chaRoom information to DB");

            Chat chat = Chat.builder()
                    .participant1(customer1.getId())
                    .participant2(customer2.getId())
                    .filePath(chatRoom.getRoomId())
                    .build();
            log.info("save chaRoom information to DB completed.");
            log.info("roomId is:" + chatRoom.getRoomId());
            Chat newChat = chatRepository.save(chat);

            Customer resCustomer1 = customerRepository.findById(newChat.getParticipant1()).get();
            Customer resCustomer2 = customerRepository.findById(newChat.getParticipant2()).get();

            ChatResponse chatResponse = ChatResponse.builder()
                    .participant1(resCustomer1.getNickName())
                    .participant2(resCustomer2.getNickName())
                    .filePath(newChat.getFilePath())
                    .build();

            return Header.OK(chatResponse);
        }

    }

    //#### s web socket chatting
    private final ObjectMapper objectMapper;
    private Map<String, ChatRoom> chatRooms;

    @PostConstruct
    private void init(){
        chatRooms = new LinkedHashMap<>();
    }

    public List<ChatRoom> findAllRoom(){
        return new ArrayList<>(chatRooms.values());
    }
    public ChatRoom findRoomById(String roomId){
        log.info("rooms:" + chatRooms);
        return chatRooms.get(roomId);
    }

    public ChatRoom createRoom(String name){
        System.out.println("createRoom is invoked. this is Chat Service");
        String randomId = UUID.randomUUID().toString();
        ChatRoom chatRoom = ChatRoom.builder()
                .roomId(randomId)
                .name(name)
                .build();

        System.out.println(randomId);
        chatRooms.put(randomId, chatRoom);
        return chatRoom;
    }

    public <T> void sendMessage(WebSocketSession session, T message){
        try{
            session.sendMessage(new TextMessage(objectMapper.writeValueAsString(message)));
        }catch(IOException e){
            log.error(e.getMessage(), e);
        }
    }

//    ####e
}
