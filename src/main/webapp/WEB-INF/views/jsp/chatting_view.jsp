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
        <textarea id="messageTextArea"></textarea>
      </div>
      <div class="chat_footer">
        <form>
          <input id="textMessage" type="text">
          <button onclick="sendMessage()">전송</button>
        </form>
      </div>
    </div>
  </div>
</section>

<script>
<%--this is for web Socket chatting--%>
var webSocket = new WebSocket("ws://192.168.177.128:8081/ws/chat");
var messageTextArea = document.getElementById("messageTextArea");
// WebSocket 서버와 접속 시 호출되는 함수
webSocket.onopen = function() {
// 콘솔 텍스트에 메시지를 출력한다.
  var data = {
    "type":"ENTER",
    "room_id": "<%=session.getAttribute("roomId").toString()%>",
    "message":"",
    "sender":"<%=session.getAttribute("nickname").toString()%>"
  }
// WebSocket 서버에 메시지 전송
  webSocket.send(JSON.stringify(data));

  messageTextArea.value += "<%=session.getAttribute("roomId").toString()%>"+"\n";
};

// WebSocket 서버와 접속 종료 시 호출되는 함수
webSocket.onclose = function(message) {
// 콘솔 텍스트에 종료 메시지 출력
  messageTextArea.value += "Server Disconnect...\n";

};
// WebSocket 서버와 통싞 중 에러 발생 시 호출되는 함수
webSocket.onerror = function(message) {
// 콘솔 텍스트에 오류 메시지 표시
  messageTextArea.value += "error...\n";
};
// WebSocket 서버로 부터 메시지 수싞 시 호출되는 함수
webSocket.onmessage = function(result) {
  console.log("got return");
  console.log(result);
  console.log(JSON.parse(result.data)["message"]);
// 콘솔 텍스트에 메시지를 출력한다.
  messageTextArea.value += JSON.parse(result.data)["message"] + "\n";
};

// Send 버튼 클릭 시 호출되는 메소드
function sendMessage() {
// 전송 메시지 텍스트 박스 객체 가져오기
  var message = document.getElementById("textMessage");
// 콘솔 텍스트에 메시지 출력
  messageTextArea.value += "Send to Server => "+message.value+"\n";

  var data = {
    "type":"TALK",
    "room_id": "<%=session.getAttribute("roomId").toString()%>",
    "message":message.value,
    "sender":"<%=session.getAttribute("nickname").toString()%>"
  }

  console.log("data is");
  console.log(JSON.stringify(data));



// WebSocket 서버에 메시지 전송
//   webSocket.send(JSON.stringify(data));

  console.log("sendMessage is successed.");
// 전송 메시지 작성 텍스트 박스 초기화
  message.value = "";

}

// Disconnect 버튼 클릭 시 호출되는 함수
function disconnect() {
// WebSocket 접속 해제
  webSocket.close();



}
</script>

</body>
</html>
