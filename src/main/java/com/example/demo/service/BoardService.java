package com.example.demo.service;

import com.example.demo.model.entity.Board;
import com.example.demo.model.entity.Customer;
import com.example.demo.model.network.Header;
import com.example.demo.model.network.request.BoardRequest;
import com.example.demo.model.network.response.BoardResponse;
import com.example.demo.repository.BoardRepository;
import com.example.demo.repository.CustomerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestBody;

import java.time.LocalTime;

@Service
public class BoardService {
    @Autowired
    BoardRepository boardRepository;

    @Autowired
    CustomerRepository customerRepository;

    public Header<BoardResponse> create(Header<BoardRequest> header) {
        BoardRequest boardRequest = header.getData();

        Customer customer = customerRepository.findByCustomerIdLike(boardRequest.getAuthor());

        Board board = Board.builder()
                .author(customer.getId())//  need to auto create (maybe with ses
                .boardedAt(boardRequest.getBoardedAt()) // need to consider type
                .title(boardRequest.getTitle())
                .contents(boardRequest.getContents())
                .filePath(boardRequest.getFilePath())
                .build();
        Board newBoard = boardRepository.save(board);

        Customer resCustomer = customerRepository.findById(newBoard.getAuthor()).get();

        Header<BoardResponse> resHeader = new Header<BoardResponse>();
        BoardResponse boardResponse = BoardResponse.builder()
                .title(newBoard.getTitle())
                .contents(newBoard.getContents())
                .author(resCustomer.getCustomerId())
                .id(newBoard.getId())
                .boardedAt(newBoard.getBoardedAt())
                .filePath(newBoard.getFilePath())
                .build();

        resHeader.setData(boardResponse);
        resHeader.setTime(LocalTime.now().toString());
        return resHeader;
    }
}
