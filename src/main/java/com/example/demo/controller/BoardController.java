package com.example.demo.controller;

import com.example.demo.model.network.Header;
import com.example.demo.model.network.request.BoardRequest;
import com.example.demo.model.network.request.CustomerRequest;
import com.example.demo.model.network.response.BoardResponse;
import com.example.demo.model.network.response.CustomerResponse;
import com.example.demo.repository.BoardRepository;
import com.example.demo.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/board")
public class BoardController {
    @Autowired
    BoardService boardService;
    @RequestMapping(value = "", method = RequestMethod.GET, produces="application/json; charset=utf8")
    public String board_write() {
        return "/jsp/board_write";         // 실제 호출될 /WEB-INF/jsp/views/viewtest.jsp
    }
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public Header<BoardResponse> create(@RequestBody Header<BoardRequest> header){
        System.out.println(header);
        return boardService.create(header);
    }
    @RequestMapping("/board/insertBoard.do")
    public String insertBoard(BoardDto board,
                              MultipartHttpServletRequest multipartHttpServletRequest) throws Exception {
        boardService.insertBoard(board, multipartHttpServletRequest);
        return "redirect:/board/openBoardList.do";
    }
}
