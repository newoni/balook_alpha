package com.example.demo.service;

import com.example.demo.model.Stone;
import com.example.demo.model.entity.Board;
import com.example.demo.model.entity.Customer;
import com.example.demo.model.network.Header;
import com.example.demo.model.network.request.BoardRequest;
import com.example.demo.model.network.response.BoardListResponse;
import com.example.demo.model.network.response.BoardResponse;
import com.example.demo.repository.BoardRepository;
import com.example.demo.repository.CustomerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestBody;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

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

    public Header<BoardListResponse> showBoardList(String request) throws IOException {
        List<Board> boardList = boardRepository.findAll();
        ArrayList<BoardResponse> boardResponseArrayList = new ArrayList<BoardResponse>();
        BoardListResponse boardListResponse = new BoardListResponse();

//        start get gibo

        for(Board board: boardList) {
            File file = new File(board.getFilePath());

            ArrayList<Stone> gibo = new ArrayList<Stone>();
            if (file.exists()) {
                BufferedReader inFile = new BufferedReader(new FileReader(file));
                String sLine = null;
                while ((sLine = inFile.readLine()) != null) {
                    if(sLine.startsWith("STO")){
                        Stone stone = Stone.builder()
                                .player(sLine.split(" ")[3])
                                .row(sLine.split(" ")[4])
                                .col(sLine.split(" ")[5])
                                .build();

                        gibo.add(stone);
                    }

                }
            }

            BoardResponse boardResponse = BoardResponse.builder()
                    .author((customerRepository.findById(board.getAuthor())).get().getNickName())
                    .title(board.getTitle())
                    .boardedAt(board.getBoardedAt())
                    .gibo(gibo)
                    .build();

            boardResponseArrayList.add(boardResponse);
        }

        boardListResponse.setBoardList(boardResponseArrayList);


        return Header.OK(boardListResponse);
    }
}
