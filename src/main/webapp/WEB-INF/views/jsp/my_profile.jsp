<%@ page import="com.example.demo.model.network.request.CustomerRequest" %>
<%@ page import="com.example.demo.controller.CustomerController" %>
<%@ page import="com.example.demo.model.network.Header" %>
<%@ page import="com.example.demo.service.LikesService" %>
<%@ page import="com.example.demo.model.network.request.LikesRequest" %>
<%@ page import="com.example.demo.model.network.response.LikesResponse" %>
<%@ page import="com.example.demo.service.FollowService" %>
<%@ page import="com.example.demo.model.network.request.FollowRequest" %>
<%@ page import="com.example.demo.model.network.response.FollowResponse" %>
<%@ page import="com.example.demo.service.FeedbackService" %>
<%@ page import="com.example.demo.model.network.request.FeedbackRequest" %>
<%@ page import="com.example.demo.model.network.response.FeedbackResponse" %>
<%@ page import="org.springframework.beans.factory.annotation.Autowired" %>
<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 6/29/21
  Time: 10:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="/css/header.css" rel="stylesheet">
    <link href="/css/my_profile.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
    <title>my profile page</title>
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
            <li><a href="main.jsp"><img class="logo" src="/img/logo.png"></a></li>
            <li><a href="main.jsp">balook</a></li>
        </ul>
    </div>
    <div class="menu">
        <ul>
            <li><a href="search_result.jsp"><img class="search_icon" src="/img/search.png"></a></li>
            <li><a href="../board/createPage"><img class="write_icon" src="/img/write.png"></a></li>
            <li><a href="../chat/showChatList"><img class="chat_icon" src="/img/chat.png"></a></li>
            <li><a href="myProfile"><img class="profile_icon" src=<%=picturePath%>></a></li>
        </ul>
    </div>
</header>
<section class="section_container">
    <div class="main_container">
        <div class="my_profile_container">
            <div class="my_profile">
                <div class="my_profile_info">
                    <div class="my_profile_info_img">
                        <img src=<%= picturePath %>>
                    </div>
                    <div class="my_profile_info_name_setting">
                        <div class="my_profile_info_name_setting_my_name">
                            kangh.h
                        </div>
                        <div class="my_profile_info_name_setting_modify_button">
                            <a href="my_profile_modify.jsp"><img src="/img/setting.png"></a>
                        </div>
                    </div>
                </div>

                <div class="my_profile_status">
                    <ul>
                        <a href="../likes/likeStatus">
                            <li>
                                <div class="my_profile_status_likes">
                                    <div class="my_profile_status_likes_name">
                                        좋아요
                                    </div>
                                    <div class="my_profile_status_likes_number">
                                    </div>
                                </div>
                            </li>
                        </a>

                        <a href="../follow/followStatus">
                            <li>
                                <div class="my_profile_status_follows">
                                    <div class="my_profile_status_follows_name">
                                        팔로우
                                    </div>
                                    <div class="my_profile_status_follows_number">
                                    </div>
                                </div>
                            </li>
                        </a>

                        <a href="../feedback/feedbackStatus">
                            <li>
                                <div class="my_profile_status_feedbacks">
                                    <div class="my_profile_status_feedbacks_name">
                                        피드백
                                    </div>
                                    <div class="my_profile_status_feedbacks_number">
                                    </div>
                                </div>
                            </li>
                        </a>
                    </ul>
                </div>
            </div>
            <div class="my_boards">
                <div class="my_boards_img_card"><a href="board_view.jsp"><img src="/img/Ed_-y4RVAAEBBCp.jpg"></a></div>
                <div class="my_boards_img_card"><a href="board_view.jsp"><img src="/img/J2oWs_zZ_400x400.jpg"></a></div>
                <div class="my_boards_img_card"><a href="board_view.jsp"><img src="/img/puppy-1189067_1280.jpg"></a></div>
                <div class="my_boards_img_card"><a href="board_view.jsp"><img src="/img/unnamed (1).jpg"></a></div>
                <div class="my_boards_img_card"><a href="board_view.jsp"><img src="/img/unnamed.jpg"></a></div>
                <div class="my_boards_img_card"><a href="board_view.jsp"><img src="/img/WO4SKPUA62ESBOT2QY7QB5XTAI.jpg">   </a></div>
                <div class="my_boards_img_card"><a href="board_view.jsp"><img src="/img/다운로드.jpg">   </a></div>
            </div>
        </div>
    </div>
</section>
</body>
<script>
    var nickName = '<%=session.getAttribute("nickname").toString()%>'
    var obj;

    var xhr = new XMLHttpRequest();

    var now
    var year
    var month
    var date
    var hour
    var minute
    var second
    var time

    var data
    var header_data

    window.onload(onload());


    function onload(){
        mkTime();
        mkData();

        header_data = {time:time, data:data};
        sendJSON(header_data, "/customer/countProfiles");
    };

    function mkTime(){
        now = new Date();
        year = now.getFullYear();
        month = now.getMonth() + 1;
        date = now.getDate();
        hour = now.getHours();
        minute = now.getMinutes();
        second = now.getSeconds();
        time = year +"/"+ month +"/"+ date +" "+ hour +":"+ minute +":"+ second;
    }

    function mkData(){
        data = {
            "nickname" : nickName
        };
    }

    function sendJSON(input1, address){
        xhr.open('POST', address);
        xhr.setRequestHeader('Content-Type', 'application/json'); // 컨텐츠타입을 json으로
        xhr.send(JSON.stringify(input1)); // 데이터를 stringify해서 보냄

        xhr.onload = function() {
            if (xhr.status === 200 || xhr.status === 201) {
                console.log("function invoked ");
                if(JSON.parse(xhr.responseText)["result_code"]=="OK"){
                    console.log("sendJSON successed")
                    console.log(JSON.parse(xhr.responseText)["result_code"]);
                    document.getElementsByClassName("my_profile_status_likes_number")[0].innerHTML=JSON.parse(xhr.response)["data"]['likes_count'];
                    document.getElementsByClassName("my_profile_status_follows_number")[0].innerHTML=JSON.parse(xhr.response)["data"]['follow_count'];
                    document.getElementsByClassName("my_profile_status_feedbacks_number")[0].innerHTML=JSON.parse(xhr.response)["data"]['feedback_count'];

                }else{
                    console.log(JSON.parse(xhr.responseText)["result_code"]);
                    alert("sendJSON failed...");
                    location.reload();
                }

            } else {
                console.error(xhr.responseText);
            }
        };
    }

</script>
</html>
