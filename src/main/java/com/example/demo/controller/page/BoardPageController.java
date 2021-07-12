package com.example.demo.controller.page;

import com.example.demo.model.network.Header;
import com.example.demo.model.network.request.BoardRequest;
import com.example.demo.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.time.LocalDate;
import java.time.LocalDateTime;

@Controller
@RequestMapping(value="/board")
public class BoardPageController {
    @Autowired
    BoardService boardService;

    @RequestMapping(value="/createPage", method = RequestMethod.GET)
    public String createPage(){return "/jsp/board_write";}

    @RequestMapping(value = "/create", method = RequestMethod.POST, consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public String create(@RequestParam("uploadFile") MultipartFile uploadFile, @RequestParam("title") String title, @RequestParam("contents")String contents, HttpSession session){
//        file part
//        define derectory name
//        String uploadFolder = "gibo";

//        define file name, derectory
//        source: https://docs.oracle.com/javase/8/docs/api/java/io/File.html?is-external=true
//        File saveFile = new File(uploadFolder, uploadFile.getOriginalFilename());
        String destination = "/home/balook/IdeaProjects/demo/gibo/" + uploadFile.getOriginalFilename();
        File saveFile = new File(destination);

        System.out.println("saveFile");
        System.out.println(saveFile.getAbsolutePath());

        System.out.println("uploadFile");
        System.out.println(uploadFile);


//        source: https://docs.spring.io/spring-framework/docs/current/javadoc-api/org/springframework/web/multipart/MultipartFile.html
//        checked how to user this method
        try {
            uploadFile.transferTo(saveFile);
        }catch (Exception e) {
            e.printStackTrace();
            System.out.println("error");
        }

//        ReqeustParam part
        BoardRequest boardRequest = BoardRequest.builder()
                .title(title)
                .contents(contents)
                .author(session.getAttribute("customerId").toString())
                .filePath(destination)
                .boardedAt(LocalDate.now())
                .build();

        Header<BoardRequest> header = new Header<BoardRequest>();
        header.setTime(LocalDateTime.now().toString());
        header.setData(boardRequest);

        boardService.create(header);

        return "/jsp/main";

    }

    @RequestMapping(value = "/boardList", method = RequestMethod.GET)
    public String boardList(){
        return "/jsp/board_list";
    }

    @RequestMapping(value = "/readBoard", method = RequestMethod.GET)
    public String readBoard(){return "/jsp/board_view";}

}
