package com.example.demo.controller;

import com.example.demo.model.entity.Board;
import com.example.demo.model.network.Header;
import com.example.demo.model.network.request.BoardRequest;
import com.example.demo.model.network.request.CustomerRequest;
import com.example.demo.model.network.response.BoardListResponse;
import com.example.demo.model.network.response.BoardResponse;
import com.example.demo.model.network.response.CustomerResponse;
import com.example.demo.repository.BoardRepository;
import com.example.demo.service.BoardService;
import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.nio.file.FileSystems;
import java.nio.file.Path;
import java.time.LocalDate;
import java.time.LocalDateTime;

@RestController
@RequestMapping(value="/board")
@Slf4j
public class BoardController {
    @Autowired
    BoardService boardService;

    @RequestMapping(value="/readOneBoard", method = RequestMethod.POST)
    public Header<BoardResponse> readOneBoard(@RequestBody Header<BoardRequest> request, HttpSession session) throws IOException {
        log.info("read One board is invoked");
        Header<BoardResponse> result = boardService.readOneBoard(request);
        log.info("set result board data to session");
        session.setAttribute("board", result.getData());

        return result;
    }

}
