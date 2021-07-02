<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: balook
  Date: 6/29/21
  Time: 12:16 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import = "com.example.demo.controller.CustomerController"%>
<%@ page import = "com.example.demo.model.network.Header"%>
<%@ page import = "com.example.demo.model.network.request.CustomerRequest"%>
<%@ page import = "com.example.demo.model.network.response.CustomerResponse"%>
<%@ page import = "com.example.demo.controller.BoardController"%>

<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="/css/header.css" rel="stylesheet">
    <link href="/css/main.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
    <title>index</title>
</head>
<body>
<%
    CustomerRequest customerRequest = new CustomerRequest();
    System.out.println(session.getAttribute("customerId"));
    System.out.println(session.getAttribute("nickname"));
    System.out.println(session.getAttribute("picturePath"));

    customerRequest.setUserId(session.getAttribute("customerId").toString());
    customerRequest.setNickname(session.getAttribute("nickname").toString());

    String picturePath="";

    if(session.getAttribute("picturePath") == null){
        picturePath = "/img/myprofile.png";
    }else{
        picturePath = session.getAttribute("picturePath").toString();
    }
    customerRequest.setPicturePath(picturePath);

    System.out.println(customerRequest);
%>
<header class="header_container">
    <div class="logo">
        <ul>
            <li><a href="main.jsp"><img class="logo" src="/img/logo.png"></a></li>
            <li><a href="main.jsp">balook</a></li>
        </ul>
    </div>
    <div class="menu">
        <ul>
            <li class="dropdown">
                <a href="#" class="dropbtn"><img class="search_icon" src="/img/search.png"></a>
                <div class="search_content">
                    <form action="search_result.jsp" method="POST">
                        <input type="text" placeholder="검색어 입력">
                    </form>
                </div>
            </li>
            <li><a href="board_write.jsp"><img class="write_icon" src="/img/write.png"></a></li>
            <li><a href="chating.jsp"><img class="chat_icon" src="/img/chat.png"></a></li>
            <li><a href="my_profile.jsp"><img class="profile_icon" src=<%= picturePath %>></a></li>
        </ul>
    </div>
</header>
<section class="section_container">
    <div class="main_container">
        <div class="card_board_list">
            <div class="card_board_header">
                <ul>
                    <li><a href="#"><img class="profile" src="/img/profile.png"></a></li>
                    <li><a href="#">vue_ys</a></li>
                    <li class="more_li"><a href="board_modify.jsp"><img class="more" src="/img/more.png"></a></li>
                </ul>
            </div>
            <div class="card_board_cont">
                <div class="board_cont_item1">
                    <img class="board_cont_img" src="/img/go.png">
                </div>
                <div class="board_cont_item2">
                    <ul class="board_cont_ul">
                        <li><a href="#"><<<</a></li>
                        <li><a href="#"><<</a></li>
                        <li><a href="#"><</a></li>
                        <li><a href="#">></a></li>
                        <li><a href="#">>></a></li>
                        <li><a href="#">>>></a></li>
                    </ul>
                </div>
            </div>
            <div class="card_board_footer">
                <ul class="footer_icon">
                    <li><a href="#"><img src="/img/like.png"></a></li>
                    <li><a href="board_view.html"><img src="/img/comments.png"></a></li>
                    <li><a href="board_view.html"><img src="/img/feedback.png"></a></li>
                </ul>
                <div class="footer_comments">
                    <ul>
                        <li><a href="board_view.jsp">vue_ys</a><a href="#">ㄹㅇ 실화냐? 이게 된다고?</a></li>
                        <li><a href="board_view.jsp">vue_ys</a><a href="#">#고스트 바둑왕</a></li>
                        <li><a href="board_view.jsp">더보기</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="card_board_list">
            <div class="card_board_header">
                <ul>
                    <li><a href="#"><img class="profile" src="/img/profile.png"></a></li>
                    <li><a href="#">vue_ys</a></li>
                    <li class="more_li"><a href="#"><img class="more" src="/img/more.png"></a></li>
                </ul>
            </div>
            <div class="card_board_cont">
                <div class="board_cont_item1">
                    <img class="board_cont_img" src="/img/go.png">
                </div>
                <div class="board_cont_item2">
                    <ul class="board_cont_ul">
                        <li><a href="#"><<<</a></li>
                        <li><a href="#"><<</a></li>
                        <li><a href="#"><</a></li>
                        <li><a href="#">></a></li>
                        <li><a href="#">>></a></li>
                        <li><a href="#">>>></a></li>
                    </ul>
                </div>
            </div>
            <div class="card_board_footer">
                <ul class="footer_icon">
                    <li><a href="#"><img src="../img/like.png"></a></li>
                    <li><a href="board_view.jsp"><img src="/img/comments.png"></a></li>
                    <li><a href="board_view.jsp"><img src="/img/feedback.png"></a></li>
                </ul>
                <div class="footer_comments">
                    <ul>
                        <li><a href="board_view.jsp">vue_ys</a><a href="#">ㄹㅇ 실화냐? 이게 된다고?</a></li>
                        <li><a href="board_view.jsp">vue_ys</a><a href="#">#고스트 바둑왕</a></li>
                        <li><a href="board_view.jsp">더보기</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
</html>
