<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 6/29/21
  Time: 10:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="/css/header.css" rel="stylesheet">
    <link href="/css/like_status.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
    <title>like_status</title>
</head>
<body>
<%
    // for profile picture
    String picturePath="";
    if(session.getAttribute("picturePath") == null){
        picturePath = "/img/myprofile.png";
    }else{
        picturePath = session.getAttribute("picturePath").toString();
    }
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
            <li><a href="search_result.jsp"><img class="search_icon" src="/img/search.png"></a></li>
            <li><a href="board_write.jsp"><img class="write_icon" src="/img/write.png"></a></li>
            <li><a href="chating.jsp"><img class="chat_icon" src="/img/chat.png"></a></li>
            <li><a href="../customer/myProfile"><img class="profile_icon" src=<%=picturePath%>></a></li>
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
                    <li><a href="#"><img src="/img/like_active.png"></a></li>
                    <li><a href="#"><img src="/img/comments.png"></a></li>
                    <li><a href="#"><img src="/img/feedback.png"></a></li>
                </ul>
                <div class="footer_comments">
                    <ul>
                        <li><a href="#">vue_ys</a><a href="#">ㄹㅇ 실화냐? 이게 된다고?</a></li>
                        <li><a href="#">vue_ys</a><a href="#">#고스트 바둑왕</a></li>
                        <li><a href="#">더보기</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="card_board_list">
            <div class="card_board_header">
                <ul>
                    <li><a href="#"><img class="profile" src="/img/puppy.jpg"></a></li>
                    <li><a href="#">dangdang</a></li>
                </ul>
            </div>
            <div class="card_board_cont">
                <div class="board_cont_item1">
                    <img class="board_cont_img" src="/img/puppy.jpg">
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
                    <li><a href="#"><img src="/img/like_active.png"></a></li>
                    <li><a href="#"><img src="/img/comments.png"></a></li>
                    <li><a href="#"><img src="/img/feedback.png"></a></li>
                </ul>
                <div class="footer_comments">
                    <ul>
                        <li><a href="#">dangdang</a><a href="#">주인님 바둑 개못둔다개</a></li>
                        <li><a href="#">dangdang</a><a href="#">#간식사주개</a></li>
                        <li><a href="#">더보기</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="card_board_list">
            <div class="card_board_header">
                <ul>
                    <li><a href="#"><img class="profile" src="/img/puppy2.jpg"></a></li>
                    <li><a href="#">mungmoong</a></li>
                </ul>
            </div>
            <div class="card_board_cont">
                <div class="board_cont_item1">
                    <img class="board_cont_img" src="/img/puppy2.jpg">
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
                    <li><a href="#"><img src="/img/like_active.png"></a></li>
                    <li><a href="#"><img src="/img/comments.png"></a></li>
                    <li><a href="#"><img src="/img/feedback.png"></a></li>
                </ul>
                <div class="footer_comments">
                    <ul>
                        <li><a href="#">mungmoong</a><a href="#">댕댕호흡 제 1형!</a></li>
                        <li><a href="#">mungmoong</a><a href="#">#배고프댕</a></li>
                        <li><a href="#">더보기</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
</html>
