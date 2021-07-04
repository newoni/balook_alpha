<%--
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
      <div class="chat_list">
        <div class="chat_profile">
          <a href="my_profile.jsp"><img src="/img/profile.png"></a>
        </div>
        <div class="chat_cont">
          <ul>
            <a onlcick="sendFinalFunction()">
              <li><h3>vue_ys</h3></li>
              <li><p>너는 지금 뭐해 자니 밖이야?</p></li>
            </a>
          </ul>
        </div>
        <div class="chat_date">
          <p>06/22 10:27</p>
        </div>
        <div class="chat_delete">
          <form>
            <button type="submit">삭제</button>
          </form>
        </div>
      </div>
      <div class="chat_list">
        <div class="chat_profile">
          <a href="my_profile.jsp"><img src="/img/profile.png"></a>
        </div>
        <div class="chat_cont">
          <ul>
            <a href="/chat/showChat">
              <li><h3>vue_ys</h3></li>
              <li><p>너는 지금 뭐해 자니 밖이야?</p></li>
            </a>
          </ul>
        </div>
        <div class="chat_date">
          <p>06/22 10:27</p>
        </div>
        <div class="chat_delete">
          <form>
            <button type="submit">삭제</button>
          </form>
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

  window.onload(getChatList());

  function getChatList(){
    mkTime();
    mkData4chatList();

    header_data = {time:time, data:data};
    sendJSON4chatList(header_data, "/chat/showChatList");
  }

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

  function mkData(){
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
