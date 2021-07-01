package com.example.demo.controller;

import com.example.demo.model.entity.Board;
import com.example.demo.model.network.Header;
import com.example.demo.model.network.request.BoardRequest;
import com.example.demo.model.network.request.CustomerRequest;
import com.example.demo.model.network.response.BoardResponse;
import com.example.demo.model.network.response.CustomerResponse;
import com.example.demo.repository.BoardRepository;
import com.example.demo.service.BoardService;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.time.LocalDateTime;

@RestController
@RequestMapping(value="/board")
public class BoardController {
    @Autowired
    BoardService boardService;

    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public Header<BoardResponse> create(@RequestBody Header<BoardRequest> header){
        System.out.println(header);
        return boardService.create(header);
    }

    @PostMapping("/uploadFormAction")
    public void uploadFormPost(MultipartFile uploadFile, @RequestParam("title") String title, @RequestParam("contents")String contents) {

        String uploadFolder = "gibo"; // directory name;

        System.out.println("--------------------------------------");
        System.out.println("Upload File Name : " + uploadFile.getOriginalFilename());
        System.out.println("Upload File Size : " + uploadFile.getSize());

        //1. title, contents -> to boardRequest
        BoardRequest boardRequest = BoardRequest.builder()
                .title(title)
                .contents(contents)
                .build();

//        Header<BoardRequest> header = (Header<BoardRequest>)Header.builder()
//                .data(boardRequest)
//                .time(LocalDateTime)

        File saveFile = new File(uploadFolder, uploadFile.getOriginalFilename());

        System.out.println(title);
        System.out.println(contents);

        try {
            uploadFile.transferTo(saveFile);
        }catch (Exception e) {
            //log.error(e.getMessage());
            e.printStackTrace();
            System.out.println("error");
        }

    }

//    @Controller
//    public class UploadController {
//
//        @GetMapping("/board_write")
//        public void uploadForm() {
//            System.out.println("upload form");
//        }
//
//
//    }

}
