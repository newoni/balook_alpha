<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 6/29/21
  Time: 9:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="/css/header.css" rel="stylesheet">
  <link href="/css/chating_view.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
  <title>chating_view</title>
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
      <li><a href="search_result.jsp"><img class="search_icon" src="/img/search.png"></a></li>
      <li><a href="../../board/create"><img class="write_icon" src="/img/write.png"></a></li>
      <li><a href="../../chat/showChatList"><img class="chat_icon" src="/img/chat.png"></a></li>
      <li><a href="../../customer/myProfile"><img class="profile_icon" src=<%=picturePath%>></a></li>
    </ul>
  </div>
</header>
<section class="section_container">
  <div class="main_container">
    <div class="chat_wrap">
      <div class="chat_header">
        <div class="chat_back">
          <a href="/chat/showChatList"><img src="/img/back.png"></a>
        </div>
        <div class="chat_profile">
          <ul>
            <li><a href="../../customer/myProfile"><img src="/img/profile.png"></a></li>
            <li><h3>vue_ys</h3></li>
          </ul>
        </div>
      </div>
      <div class="chat_cont">
        <textarea>ㅎㅇ</textarea>
      </div>
      <div class="chat_footer">
        <form>
          <input type="text">
          <button type="submit">전송</button>
        </form>
      </div>
    </div>
  </div>
</section>
</body>
</html>
