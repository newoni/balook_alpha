package com.example.demo.service;

import com.example.demo.model.Stone;
import com.example.demo.model.entity.Board;
import com.example.demo.model.entity.Customer;
import com.example.demo.model.entity.Likes;
import com.example.demo.model.network.Header;
import com.example.demo.model.network.request.BoardRequest;
import com.example.demo.model.network.request.LikesRequest;
import com.example.demo.model.network.response.BoardListResponse;
import com.example.demo.model.network.response.BoardResponse;
import com.example.demo.model.network.response.LikesResponse;
import com.example.demo.repository.BoardRepository;
import com.example.demo.repository.CustomerRepository;
import com.example.demo.repository.LikesRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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

    public Header<BoardListResponse> showLikedBoards(String nickname) throws IOException {
        System.out.println("show Liked Boards is invoked which is in Likes Service");
        Customer customer = customerRepository.findByNickNameLike(nickname);
        List<Likes> likesList = likesRepository.findByAuthor(customer.getId());

        ArrayList<BoardResponse> boardResponseArrayList = new ArrayList<BoardResponse>();
        for(Likes likes : likesList){
            Board likedBoard = boardRepository.findById(likes.getTargetBoard()).get();

            //        start get gibo
            File file = new File(likedBoard.getFilePath());

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
//            end get gibo

            Customer author = customerRepository.findById(likedBoard.getAuthor()).get();
            BoardResponse boardResponse = BoardResponse.builder()
                    .boardedAt(likedBoard.getBoardedAt())
                    .author(author.getNickName())
                    .contents(likedBoard.getContents())
                    .filePath(likedBoard.getFilePath())
                    .updatedAt(likedBoard.getUpdatedAt())
                    .title(likedBoard.getTitle())
                    .id(likedBoard.getId())
                    .gibo(gibo)
                    .build();

            boardResponseArrayList.add(boardResponse);
        }

        BoardListResponse boardListResponse = BoardListResponse.builder()
                .boardList(boardResponseArrayList)
                .build();
        return Header.OK(boardListResponse);
    }
}
