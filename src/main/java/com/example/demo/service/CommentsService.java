package com.example.demo.service;

import com.example.demo.model.entity.Board;
import com.example.demo.model.entity.Comments;
import com.example.demo.model.entity.Customer;
import com.example.demo.model.network.Header;
import com.example.demo.model.network.request.CommentsRequest;
import com.example.demo.model.network.response.BoardListResponse;
import com.example.demo.model.network.response.BoardResponse;
import com.example.demo.model.network.response.CommentsListResponse;
import com.example.demo.model.network.response.CommentsResponse;
import com.example.demo.repository.BoardRepository;
import com.example.demo.repository.CommentsRepository;
import com.example.demo.repository.CustomerRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.xml.stream.events.Comment;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Service
@Slf4j
public class CommentsService {
    @Autowired
    CommentsRepository commentsRepository;
    @Autowired
    BoardRepository boardRepository;
    @Autowired
    CustomerRepository customerRepository;

    public Header<CommentsResponse> create(Header<CommentsRequest> request, String nickname){
        CommentsRequest body = request.getData();

        log.info("request: " + request);
        log.info("body: " + body);
        log.info("boardAuthor: " + body.getAuthor());
        log.info("commentsAuthor: " + nickname);
        Customer boardAuthor = customerRepository.findByNickNameLike(body.getAuthor());
        Customer user = customerRepository.findByNickNameLike(nickname);

        Board board = boardRepository.findByAuthorAndTitle(boardAuthor.getId(),body.getTitle());

        Comments comments = Comments.builder()
                .author(user.getId()) // comment author
                .targetBoard(board.getId())
                .contents(body.getContents())
                .boardedAt(LocalDate.now())
                .build();

        Comments newComments = commentsRepository.save(comments);
        Customer savedAuthor = customerRepository.findById(newComments.getAuthor()).get();

        CommentsResponse commentsResponse = CommentsResponse.builder()
                .author(savedAuthor.getNickName())
                .contents(newComments.getContents())
                .boardedAt(LocalDate.now())
                .build();

        return Header.OK(commentsResponse);
    }

    public Header<CommentsListResponse>  getOneBoardCommentsList(String authorNickName, String title){
        log.info("author Nickname: " + authorNickName);
        log.info("title: " + title);


        Customer author = customerRepository.findByNickNameLike(authorNickName);
        log.info("author: " + author);
        Board board = boardRepository.findByAuthorAndTitle(author.getId(),title);
        log.info("board: " + board);



        ArrayList<Comments> commentsList = (ArrayList<Comments>)(commentsRepository.findByTargetBoard(board.getId()));
        ArrayList<CommentsResponse> commentsResponseArrayList = new ArrayList<CommentsResponse>();

        for(Comments comments : commentsList){
            Customer tmpCustomer = customerRepository.findById(comments.getAuthor()).get();
            CommentsResponse commentsResponse = CommentsResponse.builder()
                    .author(tmpCustomer.getNickName())
                    .boardedAt(comments.getBoardedAt())
                    .contents(comments.getContents())
                    .build();

            commentsResponseArrayList.add(commentsResponse);
        }

        CommentsListResponse commentsListResponse = CommentsListResponse.builder()
                .commentsResponseArrayList(commentsResponseArrayList)
                .build();

        return Header.OK(commentsListResponse);
    }

}
