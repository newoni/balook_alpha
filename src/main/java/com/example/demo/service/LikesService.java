package com.example.demo.service;

import com.example.demo.model.entity.Board;
import com.example.demo.model.entity.Customer;
import com.example.demo.model.entity.Likes;
import com.example.demo.model.network.Header;
import com.example.demo.model.network.request.BoardRequest;
import com.example.demo.model.network.request.LikesRequest;
import com.example.demo.model.network.response.LikesResponse;
import com.example.demo.repository.BoardRepository;
import com.example.demo.repository.CustomerRepository;
import com.example.demo.repository.LikesRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.Date;

@Service
public class LikesService {
    @Autowired
    private LikesRepository likesRepository;

    @Autowired
    private CustomerRepository customerRepository;

    @Autowired
    private BoardRepository boardRepository;

    public Boolean check(String nickname, String author, String title){
        System.out.println("like check is invoked");
        try{
            Customer customer = customerRepository.findByNickNameLike(nickname);

            Customer authorCustomer = customerRepository.findByNickNameLike(author);
            Board board = boardRepository.findByAuthorAndTitle(authorCustomer.getId(), title);

            Likes likes = likesRepository.findByAuthorAndTargetBoard(customer.getId(), board.getId());

            System.out.println(likes);
            if(likes==null){
                System.out.println("likes==null");
                System.out.println(likes==null);
                return false;
            }else{
                System.out.println("likes==null");
                System.out.println(likes==null);
                return true;
            }
        }catch(Exception e){
            e.printStackTrace();
            return false;
        }
    }


    public void create(String nickname, String author, String title) {
        System.out.println("Likes service, create is invoked");
        Customer customer = customerRepository.findByNickNameLike(nickname);

        Customer authorCustomer = customerRepository.findByNickNameLike(author);
        Board board = boardRepository.findByAuthorAndTitle(authorCustomer.getId(), title);

        System.out.println("Load DB with input data");

        Likes likes = Likes.builder()
                .author(customer.getId())
                .targetBoard(board.getId())
                .boardedAt(LocalDate.now())
                .build();

        System.out.println("Made entity");
        Likes newLikes = likesRepository.save(likes);
        System.out.println("Save Entity");

        System.out.println(newLikes);
    }

    public void delete(String nickname, String author, String title){
        System.out.println("Likes service, delete is invoked");
        Customer customer = customerRepository.findByNickNameLike(nickname);

        Customer authorCustomer = customerRepository.findByNickNameLike(author);
        Board board = boardRepository.findByAuthorAndTitle(authorCustomer.getId(), title);

        Likes likes = likesRepository.findByAuthorAndTargetBoard(customer.getId(), board.getId());

        likesRepository.delete(likes);
    }
}
