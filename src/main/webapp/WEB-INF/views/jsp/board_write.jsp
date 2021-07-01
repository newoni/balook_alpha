<%--
  Created by IntelliJ IDEA.
  User: balook
  Date: 6/29/21
  Time: 5:35 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="${path}/css/header.css" rel="stylesheet">
    <link href="${path}/css/board_write.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
    <title>board_write</title>
</head>
<body>
<header class="header_container">
    <div class="logo">
        <ul>
            <li><a href="main.html"><img class="logo" src="../img/logo.png"></a></li>
            <li><a href="main.html">balook</a></li>
        </ul>
    </div>
    <div class="menu">
        <ul>
            <li><a href="#"><img class="search_icon" src="../img/search.png"></a></li>
            <li><a href="#"><img class="write_icon" src="../img/write.png"></a></li>
            <li><a href="#"><img class="chat_icon" src="../img/chat.png"></a></li>
            <li><a href="myprofile.html"><img class="profile_icon" src="../img/profile.png"></a></li>
        </ul>
    </div>
</header>
<section class="section_container">
    <div class="main_container">
        <div class="board_wrtie_container">
            <form id="write_json" action="http://192.168.11.128:8081/board" method="POST" enctype="multipart/form-data">
                <div class="form_group">
                    <div class="label_group">
                        <label for="title">제목</label>
                    </div>
                    <div class="title_input">
                        <input type="text" id="title" class="title" name="title" placeholder="제목 입력 (4~200)" maxlength="200" required="required" pattern=".{4,200}">
                    </div>
                </div>
                <div class="form_group">
                    <div class="label_group">
                        <label for="content">내용</label>
                    </div>
                    <div class="content_textarea">
                        <textarea id="content" name="content" placeholder="내용 입력 (4~1000)" required="required" maxlength="1000"></textarea>
                    </div>
                </div>
                <div class="file_group">
                    <label for="file" class="file_btn">업로드</label>
                    <input class="file_choose" type="file" id="file" name="file" accept=".sgf">
                </div>
                <div class="btn_wrap">
                    <!-- <21.06.29> KH modified-->
                    <!-- <button class="btn" type="submit" onclick="trans()">확인</button> -->
                    <button class="btn" type="button" onclick="mkInfo()">확인</button>
                    <!-- end -->
                    <button class="btn" type="button" onclick="back()">취소</button>
                </div>
            </form>
        </div>
    </div>
</section>
<script>
    // <21.06.29> KH start
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
    var info
    // end
    // <21.06.29> KH start
    function sendJSON(input1){
        console.log("sendJSON invodked");

        console.log("sendJSON invodked1");
        xhr.open('POST', 'board');
        console.log("sendJSON invodked2");
        xhr.setRequestHeader('Content-Type', 'application/json'); // 컨텐츠타입을 json으로
        console.log("sendJSON invodked3");
        xhr.send(JSON.stringify(input1)); // 데이터를 stringify해서 보냄

        xhr.onload = function() {
            console.log("sendJSON invodked4");
            if (xhr.status === 200 || xhr.status === 201) {
                console.log("everything is over");
                console.log(xhr.responseText);
            } else {
                console.error(xhr.responseText);
            }
        };
    }

    // <21.06.30> KH modify
    // <21.06.30> KH modify
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
            "title" : document.getElementById("title").value,
            "content" : document.getElementById("content").value,
            "filepath" : document.getElementById("file").value
        };
    }

    function mkInfo(){
        mkTime();
        mkData();
        info = {time:time, data:data, status:300};
        sendJSON(info);
    }


    // end
    function back() {
        location.href="main.html";
    }
</script>
</body>
</html>
