<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 6/29/21
  Time: 10:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="../css/header.css" rel="stylesheet">
    <link href="../css/follow_status.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
    <title>follow_status</title>
    <style>

    </style>
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
            <li><a href="../main"><img class="logo" src="/img/logo.png"></a></li>
            <li><a href="../main">balook</a></li>
        </ul>
    </div>
    <div class="menu">
        <ul>
            <li><a href="search_result.jsp"><img class="search_icon" src="/img/search.png"></a></li>
            <li><a href="board_write.jsp"><img class="write_icon" src="/img/write.png"></a></li>
            <li><a href="chating.jsp"><img class="chat_icon" src="/img/chat.png"></a></li>
            <li><a href="../customer/myProfile"><img class="profile_icon" src=<%= picturePath%>></a></li>
        </ul>
    </div>
</header>
<section class="section_container">
    <div class="main_container">
        <div class="sub_container">
            <div class="title">
                <ul>
                    <li>팔로잉</li>
                </ul>
            </div>
            <div class="content">
                <div class="profile">
                    <ul onclick="move();">
                        <li><img src="/img/myprofile.png"></li>
                        <li>바둑사랑</li>
                    </ul>
                    <div class="follow_cancle">
                        <button type="button">팔로우 취소</button>
                    </div>
                </div>
                <div class="profile">
                    <ul onclick="move();">
                        <li><img src="/img/myprofile.png"></li>
                        <li>바둑조아</li>
                    </ul>
                    <div class="follow_cancle">
                        <button type="button">팔로우 취소</button>
                    </div>
                </div>
                <div class="profile">
                    <ul onclick="move()">
                        <li><img src="/img/myprofile.png"></li>
                        <li>옆집바둑이</li>
                    </ul>
                    <div class="follow_cancle">
                        <button type="button">팔로우 취소</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<script>
    function move() {
        location.href="other_profile.jsp";
    }
</script>
</body>
</html>
