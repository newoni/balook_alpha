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
        try{
        for(int i=0 ; i< ((Header<ChatListResponse>)(session.getAttribute("chats"))).getData().getChatResponseList().size() ; i++){
          System.out.println("session value:");
          System.out.println(session.getAttribute("nickname").toString());
          System.out.println("opponent value:");
          System.out.println(((Header<ChatListResponse>)(session.getAttribute("chats"))).getData().getChatResponseList().get(i).getParticipant2());
          System.out.println(((Header<ChatListResponse>)(session.getAttribute("chats"))).getData().getChatResponseList().get(i).getParticipant1());
          System.out.println(session.getAttribute("nickname").toString()==((Header<ChatListResponse>)(session.getAttribute("chats"))).getData().getChatResponseList().get(i).getParticipant2());
          if(session.getAttribute("nickname").toString().equals(((Header<ChatListResponse>)(session.getAttribute("chats"))).getData().getChatResponseList().get(i).getParticipant2())){
      %>
        <div class="chat_list">
          <div class="chat_profile">
            <a href="../../customer/myProfile"><img src="/img/profile.png"></a>
          </div>
          <div class="chat_cont">
            <ul>
              <li><h3><a onclick="mkInfo4readOneChat('<%=((Header<ChatListResponse>)(session.getAttribute("chats"))).getData().getChatResponseList().get(i).getParticipant1()%>')"><%=((Header<ChatListResponse>)(session.getAttribute("chats"))).getData().getChatResponseList().get(i).getParticipant1()%></a></h3></li>
              <li><p><a onclick="mkInfo4readOneChat('<%=((Header<ChatListResponse>)(session.getAttribute("chats"))).getData().getChatResponseList().get(i).getParticipant1()%>')">너는 지금 뭐해 자니 밖이야?</a></p></li>
            </ul>

          </div>
          <div class="chat_date">
            <p><%=((Header<ChatListResponse>)(session.getAttribute("chats"))).getTime()%></p>
          </div>
          <div class="chat_delete">
            <form>
              <button onclick="mkInfo4delete('<%=((Header<ChatListResponse>)(session.getAttribute("chats"))).getData().getChatResponseList().get(i).getParticipant1()%>')">삭제</button>
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
              <li><h3><a onclick="mkInfo4readOneChat('<%=((Header<ChatListResponse>)(session.getAttribute("chats"))).getData().getChatResponseList().get(i).getParticipant2()%>')"><%=((Header<ChatListResponse>)(session.getAttribute("chats"))).getData().getChatResponseList().get(i).getParticipant2()%></a></h3></li>
              <li><p><a onclick="mkInfo4readOneChat('<%=((Header<ChatListResponse>)(session.getAttribute("chats"))).getData().getChatResponseList().get(i).getParticipant2()%>')">너는 지금 뭐해 자니 밖이야?</a></p></li>
            </ul>

        </div>
        <div class="chat_date">
          <p><%=((Header<ChatListResponse>)(session.getAttribute("chats"))).getTime()%></p>
        </div>
        <div class="chat_delete">
          <form>
            <button onclick="mkInfo4delete('<%=((Header<ChatListResponse>)(session.getAttribute("chats"))).getData().getChatResponseList().get(i).getParticipant2()%>')">삭제</button>
          </form>
        </div>
      </div>

      <%}}
        }catch(Exception e){}
      %>
    </div>
  </div>
</section>
</body>
<script>
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

  function mkData4readOneChat(opponent){
    data = {
      "opponent" : opponent
    };
  }

  function sendJSON4readOneChat(input1, address){
    xhr.open('POST', address); // cehck
    xhr.setRequestHeader('Content-Type', 'application/json'); // 컨텐츠타입을 json으로
    xhr.send(JSON.stringify(input1)); // 데이터를 stringify해서 보냄

    xhr.onload = function() {
      if (xhr.status === 200 || xhr.status === 201) {
        console.log("function invoked ");
        if(JSON.parse(xhr.responseText)["result_code"]=="OK"){
          console.log(JSON.parse(xhr.responseText)["result_code"]);
          location.href="/chat/showChat";
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

  function mkInfo4readOneChat(opponent){
    console.log("mkInfo4ReadOneChat is invoked");
    mkTime();
    mkData4readOneChat(opponent);
    info = {time:time, data:data};
    sendJSON4readOneChat(info,"/chat/readOneChat");
  }

  //for delte chat
  function mkData4delete(input){
    data = {
      "opponent" : input
    };
  }

  function sendJSON4delete(input1, address){
    xhr.open('POST', address); // cehck
    xhr.setRequestHeader('Content-Type', 'application/json'); // 컨텐츠타입을 json으로
    xhr.send(JSON.stringify(input1)); // 데이터를 stringify해서 보냄

    xhr.onload = function() {
      if (xhr.status === 200 || xhr.status === 201) {
        console.log("function invoked ");
        if(JSON.parse(xhr.responseText)["result_code"]=="OK"){
          console.log("sendJSON successed")
          console.log(JSON.parse(xhr.responseText)["result_code"]);
          location.href="../../main";

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

  function mkInfo4delete(input){
    var action =confirm("delete this chat room?");
    if(action){
      mkTime();
      mkData4delete(input);
      info={time:time, data:data};

      sendJSON4delete(info, "/chat/deleteOneChat");

      alert("sendJSON is activated");
    }
    console.log(action);

  }


  //for profile
  function sendJSON4Profile(address){
    xhr.open('GET', address);
    xhr.setRequestHeader('Content-Type', 'application/json'); // 컨텐츠타입을 json으로
    xhr.send(); // 데이터를 stringify해서 보냄

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
