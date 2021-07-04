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
            <li><a href="main"><img class="logo" src="/img/logo.png"></a></li>
            <li><a href="main">balook</a></li>
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
            <li><a href="../board/createPage"><img class="write_icon" src="/img/write.png"></a></li>
            <li><a href="../chat/showChatListPage" onclick="getChatList()"><img class="chat_icon" src="/img/chat.png"></a></li>
            <li><a href="customer/myProfile"><img class="profile_icon" src=<%= picturePath %>></a></li>
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

    var opponent // In chat List, opponent nick name

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

    function mkData4chatList(){
        data = {
            "nickname" : nickName
        };
    }

    function sendJSON4chatList(input1, address){
        xhr.open('GET', address);
        xhr.setRequestHeader('Content-Type', 'application/json'); // 컨텐츠타입을 json으로
        xhr.send(JSON.stringify(input1)); // 데이터를 stringify해서 보냄

        xhr.onload = function() {
            if (xhr.status === 200 || xhr.status === 201) {
                console.log("function invoked ");
                if(JSON.parse(xhr.responseText)["result_code"]=="OK"){
                    console.log("sendJSON successed")
                    console.log(JSON.parse(xhr.responseText)["result_code"]);

                    <%--    for(let i = 0 ; i < JSON.parse(xhr.responseText)["data"]["chat_response_list"].length ; i++){--%>
                    <%--      if(JSON.parse(xhr.responseText)["data"]["chat_response_list"][i]["participant1"]=="<%=session.getAttribute("nickname")%>"){--%>

                    <%--        console.log("participant2 is");--%>
                    <%--        console.log(JSON.parse(xhr.responseText)["data"]["chat_response_list"][i]["participant2"]);--%>
                    <%--        document.getElementsByClassName("chat_wrap")[0].innerHTML=`--%>
                    <%--        <div class="chat_list">--%>
                    <%--  <div class="chat_profile">--%>
                    <%--    <a href="my_profile.jsp"><img src="/img/profile.png"></a>--%>
                    <%--  </div>--%>
                    <%--  <div class="chat_cont">--%>
                    <%--    <ul>--%>
                    <%--      <a onlcick="sendFinalFunction()">--%>
                    <%--        <li><h3>${JSON.parse(xhr.responseText)["data"]["chat_response_list"][i]["participant2"]}</h3></li>--%>
                    <%--        <li><p>너는 지금 뭐해 자니 밖이야?</p></li>--%>
                    <%--      </a>--%>
                    <%--    </ul>--%>
                    <%--  </div>--%>
                    <%--  <div class="chat_date">--%>
                    <%--    <p>06/22 10:27</p>--%>
                    <%--  </div>--%>
                    <%--  <div class="chat_delete">--%>
                    <%--    <form>--%>
                    <%--      <button type="submit">삭제</button>--%>
                    <%--    </form>--%>
                    <%--  </div>--%>
                    <%--</div>`;--%>
                    <%--      }else{--%>
                    <%--        var opponent = JSON.parse(xhr.responseText)["data"]["chat_response_list"][i]["participant1"];--%>
                    <%--        console.log("participant1 is");--%>
                    <%--        console.log(opponent);--%>
                    <%--      }--%>
                    <%--    }--%>

                    // document.getElementsByClassName("my_profile_status_feedbacks_number")[0].innerHTML=JSON.parse(xhr.response)["data"]['feedback_count'];

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

    function getChatList(){
        mkTime();
        mkData4chatList();

        header_data = {time:time, data:data};
        sendJSON4chatList(header_data, "/chat/showChatList/<%=session.getAttribute("nickname").toString()%>");
    }

</script>
</html>
