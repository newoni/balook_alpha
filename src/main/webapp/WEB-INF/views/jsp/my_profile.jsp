<%@ page import="com.example.demo.model.network.request.CustomerRequest" %>
<%@ page import="com.example.demo.controller.CustomerController" %>
<%@ page import="com.example.demo.model.network.Header" %>
<%@ page import="com.example.demo.service.LikesService" %>
<%@ page import="com.example.demo.model.network.request.LikesRequest" %>
<%@ page import="com.example.demo.service.FollowService" %>
<%@ page import="com.example.demo.model.network.request.FollowRequest" %>
<%@ page import="com.example.demo.service.FeedbackService" %>
<%@ page import="com.example.demo.model.network.request.FeedbackRequest" %>
<%@ page import="org.springframework.beans.factory.annotation.Autowired" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.demo.model.network.response.*" %>
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

    <script type="text/javascript" src="/js/go.js"></script>
    <script type="text/javascript" src="/js/gocanvas.js"></script>
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
            <li><a href="../board/createPage"><img class="write_icon" src="/img/write.png"></a></li>
            <li><a href="../chat/showChatListPage"><img class="chat_icon" src="/img/chat.png"></a></li>
            <li><a onclick="sendJSON4Profile('/customer/check4Profile/<%=session.getAttribute("nickname")%>')"><img class="profile_icon" src=<%=picturePath%>></a></li>
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
                            <%=session.getAttribute("nickname").toString()%>
                        </div>
                        <div class="my_profile_info_name_setting_modify_button">
                            <a href="my_profile_modify.jsp"><img src="/img/setting.png"></a>
                        </div>
                    </div>
                </div>

                <div class="my_profile_status">
                    <ul>
                        <a href="/likes/likeStatus/<%=session.getAttribute("nickname").toString()%>">
                        <a onclick="sendJSON4LikedBoard('/likes/likeStatus/<%=session.getAttribute("nickname").toString()%>')">

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
                <%for(int i = 0; i<((ArrayList<BoardResponse>)(session.getAttribute("boardList"))).size() ; i++){%>
                    <canvas class="tmp_canvas" height="451" width="451" id="gocanvas<%=i%>"></canvas>
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

    function sendJSON4LikedBoard(address){
        xhr.open('GET', address);
        xhr.setRequestHeader('Content-Type', 'application/json'); // 컨텐츠타입을 json으로
        xhr.send(); // 데이터를 stringify해서 보냄

        xhr.onload = function() {
            if (xhr.status === 200 || xhr.status === 201) {
                console.log("function invoked ");

                console.log("sendJSON successed")
                console.log(xhr.responseText);
                if(xhr.responseText == "OK"){
                    location.href="/likes/likeStatus";
                }else{
                    location.href="../../main";
                }
                console.log("reloaded");

            } else {
                console.log("sendJSON 4 Profile");
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
