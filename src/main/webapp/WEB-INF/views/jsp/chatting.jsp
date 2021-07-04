<%@ page import="com.example.demo.model.network.response.ChatListResponse" %>
<%@ page import="com.example.demo.model.network.Header" %>
<%@ page import="java.util.Enumeration" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 6/29/21
  Time: 9:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="/css/header.css" rel="stylesheet">
  <link href="/css/chating.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
  <title>chating</title>

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
      <li><a href="board_write.jsp"><img class="write_icon" src="/img/write.png"></a></li>
      <li><a href="chatting.jsp"><img class="chat_icon" src="/img/chat.png"></a></li>
      <li><a href="../../customer/myProfile"><img class="profile_icon" src=<%=picturePath%>></a></li>
    </ul>
  </div>
</header>
<section class="section_container">
  <div class="main_container">
    <div class="chat_wrap">
      <%
        for(int i=0 ; i< ((Header<ChatListResponse>)(session.getAttribute("chats"))).getData().getChatResponseList().size() ; i++){
          if(session.getAttribute("nickname")==((Header<ChatListResponse>)(session.getAttribute("chats"))).getData().getChatResponseList().get(i).getParticipant2()){
      %>
        <div class="chat_list">
          <div class="chat_profile">
            <a href="../../customer/myProfile"><img src="/img/profile.png"></a>
          </div>
          <div class="chat_cont">
            <ul>
              <a href="/showChat" onlcick="readOneChat()">
                <li><h3><%=((Header<ChatListResponse>)(session.getAttribute("chats"))).getData().getChatResponseList().get(i).getParticipant1()%></h3></li>
                <li><p>너는 지금 뭐해 자니 밖이야?</p></li>
              </a>
            </ul>
          </div>
          <div class="chat_date">
            <p><%=((Header<ChatListResponse>)(session.getAttribute("chats"))).getTime()%></p>
          </div>
          <div class="chat_delete">
            <form>
              <button type="submit">삭제</button>
            </form>
          </div>
        </div>
      <%
        }else{
      %>
      <div class="chat_list">
        <div class="chat_profile">
          <a href="my_profile.jsp"><img src="/img/profile.png"></a>
        </div>
        <div class="chat_cont">
          <ul>
            <a href="/chat/showChat" onlcick="readOneChat()">
              <li><h3><%=((Header<ChatListResponse>)(session.getAttribute("chats"))).getData().getChatResponseList().get(i).getParticipant2()%></h3></li>
              <li><p>너는 지금 뭐해 자니 밖이야?</p></li>
            </a>
          </ul>
        </div>
        <div class="chat_date">
          <p><%=((Header<ChatListResponse>)(session.getAttribute("chats"))).getTime()%></p>
        </div>
        <div class="chat_delete">
          <form>
            <button type="submit">삭제</button>
          </form>
        </div>
      </div>

      <%}}%>
    </div>
  </div>
</section>
</body>
<script>

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
          // document.getElementsByClassName("my_profile_status_likes_number")[0].innerHTML=JSON.parse(xhr.response)["data"]['likes_count'];

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

  function readOneChat(){
    mkTime();
    mkData()
  }
</script>
</html>
