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
<%--    <link href="${path}/css/header.css" rel="stylesheet">--%>
    <link href="/css/header.css" rel="stylesheet">
<%--    <link href="${path}/css/board_write.css" rel="stylesheet">--%>
    <link href="/css/board_write.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
    <title>board_write</title>
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
            <li><a href="../../main"><img class="logo" src="/img/logo.png"></a></li>
            <li><a href="../../main">balook</a></li>
        </ul>
    </div>
    <div class="menu">
        <ul>
            <li><a href="#"><img class="search_icon" src="/img/search.png"></a></li>
            <li><a href="createPage"><img class="write_icon" src="/img/write.png"></a></li>
            <li><a href="../../chat/showChatList"><img class="chat_icon" src="/img/chat.png"></a></li>
            <li><a href="../../customer/myProfile"><img class="profile_icon" src=<%= picturePath%>></a></li>
        </ul>
    </div>
</header>
<section class="section_container">
    <div class="main_container">
        <div class="board_wrtie_container">
            <form id="write_json" action="/board/create" method="POST" enctype="multipart/form-data">
                <div class="form_group">
                    <div class="label_group">
                        <label for="title">??????</label>
                    </div>
                    <div class="title_input">
                        <input type="text" id="title" class="title" name="title" placeholder="?????? ?????? (4~200)" maxlength="200" required="required" pattern=".{4,200}">
                    </div>
                </div>
                <div class="form_group">
                    <div class="label_group">
                        <label for="content">??????</label>
                    </div>
                    <div class="content_textarea">
                        <textarea id="content" name="contents" placeholder="?????? ?????? (4~1000)" required="required" maxlength="1000"></textarea>
                    </div>
                </div>
                <div class="file_group">
                    <label for="file" class="file_btn">?????????</label>
                    <input class="file_choose" type="file" id="file" name="uploadFile" accept=".sgf, .gib">
                </div>
                <div class="btn_wrap">
                    <!-- <21.06.29> KH modified-->
                    <!-- <button class="btn" type="submit" onclick="trans()">??????</button> -->
                    <button class="btn" type="submit" onsubmit="return afterSubmit()">??????</button>
                    <!-- end -->
                    <button class="btn" type="button" onclick="back()">??????</button>
                </div>
            </form>
        </div>
    </div>
</section>

</body>
<script>
    var xhr = new XMLHttpRequest();
    function afterSubmit(){
        location.replace("../../main");
    }

    function sendJSON4Profile(address){
        xhr.open('GET', address);
        xhr.setRequestHeader('Content-Type', 'application/json'); // ?????????????????? json??????
        xhr.send(); // ???????????? stringify?????? ??????

        xhr.onload = function() {
            if (xhr.status === 200 || xhr.status === 201) {
                console.log("function invoked ");

                console.log("sendJSON successed")
                console.log(xhr.responseText);
                if(xhr.responseText == "my_profile"){
                    location.href="../customer/myProfile";
                }else{
                    location.href="../customer/otherProfile";
                }
                console.log("reloaded");

            } else {
                console.log("sendJSON 4 Profile");
                console.error(xhr.responseText);
            }
        };
    }

</script>
</html>
