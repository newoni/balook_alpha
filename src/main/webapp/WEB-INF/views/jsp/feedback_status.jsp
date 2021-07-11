<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 6/29/21
  Time: 9:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="/css/header.css" rel="stylesheet">
    <link href="/css/main.css" rel="stylesheet">
    <link href="/css/feedback_status.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
    <title>feedback_status</title>
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
            <li><a href="../../main"><img class="logo" src="../img/logo.png"></a></li>
            <li><a href="../../main">balook</a></li>
        </ul>
    </div>
    <div class="menu">
        <ul>
            <li><a href="search_result.jsp"><img class="search_icon" src="/img/search.png"></a></li>
            <li><a href="../board/createPage"><img class="write_icon" src="/img/write.png"></a></li>
            <li><a href="../chat/showChatListPage"><img class="chat_icon" src="/img/chat.png"></a></li>
            <li><a href="../customer/myProfile"><img class="profile_icon" src=<%=picturePath%>></a></li>
        </ul>
    </div>
</header>
<section class="section_container">
    <div class="main_container">
        <div class="feedback_container">
            <div class="feedback_select">
                <div class="feedback_select_box"><button onclick="change2responseTofeedback()">요청 받은 피드백</button></div>
                <div class="feedback_select_box"><button onclick="change2requestTofeedback()">요청한 피드백</button></div>
                <div class="feedback_select_box"><button onclick="change2finishedTofeedback()">해결된 피드백</button></div>
            </div>

            <div class="feedback_card_container">
                <div class="feedback_card4response">
                    <div class="feedback_card4response_user_image">
                        <img src="/img/Ed_-y4RVAAEBBCp.jpg">
                    </div>
                    <div class="feedback_card4response_info">
                        <div class="feedback_card4response_board_title">테스트 제목</div>
                        <div class="feedback_card4response_author">테스트 작성자</div>
                    </div>
                    <div class="feedback_card4response_select_box">
                        <div><button>수락</button></div>
                        <div><button>거절</button></div>
                    </div>
                </div>

                <div class="feedback_card4request">
                    <div class="feedback_card4request_user_image">
                        <img src="/img/J2oWs_zZ_400x400.jpg">
                    </div>
                    <div class="feedback_card4request_info">
                        <div class="feedback_card4request_opponent">테스트 상대방</div>
                        <div class="feedback_card4request_status">응답 대기중</div>
                    </div>
                    <div class="feedback_card4request_select_box">
                        <div><button>취소</button></div>
                    </div>
                </div>

                <div class="feedback_card4finished">
                    <div class="feedback_card4finished_user_image">
                        <img src="/img/puppy-1189067_1280.jpg">
                    </div>
                    <div class="feedback_card4finished_info">
                        <div class="feedback_card4response_board_title">테스트 게시글 제목</div>
                        <div class="feedback_card4response_author">테스트 게시글 작성자</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<script type="text/javascript" src="/js/change_feedbackmode.js"></script>
</body>
</html>
