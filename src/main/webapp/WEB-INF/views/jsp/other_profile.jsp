<%@ page import="com.example.demo.model.network.response.BoardResponse" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.demo.model.network.response.BoardListResponse" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 6/29/21
  Time: 10:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="/css/header.css" rel="stylesheet">
  <link href="/css/other_profile.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
  <title>other profile page</title>
  <style>

  </style>
  <script type="text/javascript" src="/js/go.js"></script>
  <script type="text/javascript" src="/js/gocanvas.js"></script>
</head>
<body>
<%
  // for profile picture
  String picturePath="";
  if(session.getAttribute("picturePath") == null){
    System.out.println("session.getAttribute picturePath is null");
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
      <li><a href="chating.jsp"><img class="chat_icon" src="/img/chat.png"></a></li>
      <li><a onclick="sendJSON4Profile('/customer/check4Profile/<%=session.getAttribute("nickname")%>')"><img class="profile_icon" src="<%=picturePath%>"></a></li>
    </ul>
  </div>
</header>
<section class="section_container">
  <div class="main_container">
    <div class="other_profile_container">
      <div class="other_profile">
        <div class="other_profile_info">
          <div class="other_profile_info_img">
            <img src="/img/profile.jpg">
          </div>
          <div class="other_profile_info_name_setting">
            <div class="other_profile_info_name_setting_my_name">
              <%=session.getAttribute("authorNickName").toString()%>
            </div>
          </div>
        </div>

        <div class="other_profile_status">
          <ul>
            <a href="#">
              <li>
                <div class="other_profile_status_follows">
                  <div class="other_profile_status_follows_name">
                    팔로우
                  </div>
                  <div class="other_profile_status_follows_img_box">
                    <img src="/img/人物シルエット　プラス.png">
                  </div>
                </div>
              </li>
            </a>

            <a href="chating.jsp">
              <li>
                <div class="other_profile_status_chat">
                  <div class="other_profile_status_chat_name">
                    채팅 하기
                  </div>
                  <div class="other_profile_status_chat_image_box">
                    <img src="/img/chat.png">
                  </div>
                </div>
              </li>
            </a>
          </ul>
        </div>
      </div>
      <div class="my_boards">
        <%for(int i = 0; i<((ArrayList<BoardResponse>)(session.getAttribute("boardList"))).size() ; i++){%>
        <a href="/board/boardList"><canvas class="tmp_canvas" height="451" width="451" id="gocanvas<%=i%>"></canvas></a>
          <p style="margin-top: 0pt; font-style: normal; display:none;" class="legend">Moves: <span id="movecount<%=i%>">0</span>&nbsp;&nbsp;&nbsp;&nbsp;<span id="warnings"></span></p>

          <FORM style="display:none;" id="go" name="go">
            <FIELDSET>
              <LEGEND ACCESSKEY=A>Actions:</LEGEND>
              <input type="button" name="confirm" value="Confirm" />
              <input type="button" name="pass" value="Pass" />
              <input type="button" name="resign" value="Resign" />
            </FIELDSET>
            <FIELDSET>
              <LEGEND ACCESSKEY=P>Next Player:</LEGEND>
              <input type="radio" name="player" value="b" id="black" onclick="return false" /><label for="black" class="blackLabel">Black</label>
              <input type="radio" name="player" value="w" id="white" onclick="return false" /><label for="white" class="whiteLabel">White</label>
            </FIELDSET>
            <br />
            <label>Show SGF logs: <input type="checkbox" title="show SGF logs" name="enableLogs" id="enableLogs"  /></label>
            <div id="displayMoves" style="display:none"></div>
            <label>Size of Board:
              <select name= "boardSize">
                <option>5</option>
                <option>9</option>
                <option>13</option>
                <option selected="selected">19</option>
              </select>
            </label>
          </FORM>
        <%}%>
      </div>
    </div>
  </div>
</section>
</body>

<script>
  var xhr = new XMLHttpRequest();

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

  //for go
  function initGameKHs(){
    <%for(int i =0; i<((ArrayList<BoardListResponse>)(session.getAttribute("boardList"))).size() ; i++){%>
    window.onload =initGameKH(<%=i%>,document.getElementById('gocanvas<%=i%>'), document.getElementById('movecount'), document.forms.go);
    // window.onload = initGame(document.getElementById('gocanvas'), document.getElementById('movecount'), document.forms.go);
    <%}%>
  }

  // make session data to js variable
  function getGiboData(){
    <%for(int i =0; i<((ArrayList<BoardResponse>)(session.getAttribute("boardList"))).size() ; i++){%>

    <% for(int j =0; j<((ArrayList<BoardResponse>)(session.getAttribute("boardList"))).get(i).getGibo().size(); j++){ %>
    var player = <%=((ArrayList<BoardResponse>)(session.getAttribute("boardList"))).get(i).getGibo().get(j).getPlayer()%>;
    var columnNumber = <%=((ArrayList<BoardResponse>)(session.getAttribute("boardList"))).get(i).getGibo().get(j).getCol()%>;
    var rowNumber = <%=((ArrayList<BoardResponse>)(session.getAttribute("boardList"))).get(i).getGibo().get(j).getRow()%>;

    goOnKH(<%=i%>, rowNumber, columnNumber, player);
    gPiecesKH[<%=i%>] = gPiecesKH_tmp.slice();
    drawBoardKH(<%=i%>);
    gMoveCount[<%=i%>] = gPiecesKH[<%=i%>].length;

    <%}%>
    gPiecesKH_tmp = [];
    <%
    }
    %>
    gPieces = gPiecesKH.slice(); //for move draw, make duplication
  }

  function initPage(){
    initGameKHs();
    getGiboData();
  }

  window.onload = initPage();
</script>

</html>
