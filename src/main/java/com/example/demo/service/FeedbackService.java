package com.example.demo.service;

import com.example.demo.model.entity.Board;
import com.example.demo.model.entity.Comments;
import com.example.demo.model.entity.Customer;
import com.example.demo.model.entity.Feedback;
import com.example.demo.model.network.Header;
import com.example.demo.model.network.request.FeedbackRequest;
import com.example.demo.model.network.response.CommentsResponse;
import com.example.demo.model.network.response.FeedbackListResponse;
import com.example.demo.model.network.response.FeedbackResponse;
import com.example.demo.repository.BoardRepository;
import com.example.demo.repository.CustomerRepository;
import com.example.demo.repository.FeedbackRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.ArrayList;

@Service
@Slf4j
public class FeedbackService {
    @Autowired
    private FeedbackRepository feedbackRepository;
    @Autowired
    private CustomerRepository  customerRepository;

    @Autowired
    private BoardRepository boardRepository;


    public Header<FeedbackResponse> create(Header<FeedbackRequest> request, String nickname){
        FeedbackRequest body = request.getData();

        log.info("request: " + request);
        log.info("body: " + body);
        log.info("request user(board author): " + body.getRequestUserNickName());
        log.info("feedback author: " + nickname);

        Customer boardAuthor = customerRepository.findByNickNameLike(body.getRequestUserNickName());
        Customer user = customerRepository.findByNickNameLike(nickname);

        Board board = boardRepository.findByAuthorAndTitle(boardAuthor.getId(),body.getTitle());

        Feedback feedback = Feedback.builder()
                .contents(body.getContents())
                .targetBoard(board.getId())
                .requestBy(boardAuthor.getId())
                .requestTo(user.getId())
                .status("wait")
                .build();

        Feedback newFeedback = feedbackRepository.save(feedback);

        return Header.OK();
    }

    public Header<FeedbackListResponse> getOneBoardFeedbackList(String requestUserNickName, String title){
        log.info("author Nickname: " + requestUserNickName);
        log.info("title: " + title);

        Customer author = customerRepository.findByNickNameLike(requestUserNickName);
        log.info("author: " + author);
        Board board = boardRepository.findByAuthorAndTitle(author.getId(),title);
        log.info("board: " + board);

        ArrayList<Feedback> feedbackList = (ArrayList<Feedback>)(feedbackRepository.findByTargetBoard(board.getId()));
        ArrayList<FeedbackResponse> feedbackResponseArrayList = new ArrayList<FeedbackResponse>();

        for(Feedback feedback : feedbackList){
            Customer requestBy = customerRepository.findById(feedback.getRequestBy()).get();
            Customer requestTo = customerRepository.findById(feedback.getRequestBy()).get();

            FeedbackResponse feedbackResponse = FeedbackResponse.builder()
                    .contents(feedback.getContents())
                    .requestTo(requestTo.getNickName())
                    .requestBy(requestBy.getNickName())
                    .status(feedback.getStatus())
                    .build();

            feedbackResponseArrayList.add(feedbackResponse);
        }

        FeedbackListResponse feedbackListResponse = FeedbackListResponse.builder()
                .feedbackResponseArrayList(feedbackResponseArrayList)
                .build();

        return Header.OK(feedbackListResponse);
    }
}
