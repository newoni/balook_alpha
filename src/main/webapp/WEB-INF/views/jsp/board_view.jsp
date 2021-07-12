<%@ page import="com.example.demo.model.network.response.BoardResponse" %>
<%@ page import="com.example.demo.model.network.response.CommentsListResponse" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.demo.model.network.response.CommentsResponse" %>
<%@ page import="com.example.demo.model.network.response.FeedbackResponse" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 6/29/21
  Time: 9:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="/css/header.css" rel="stylesheet">
    <link href="/css/board_view.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
    <script type="text/javascript" src="/js/go.js"></script>
    <script type="text/javascript" src="/js/gocanvas.js"></script>
    <title>test_index</title>
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
            <li><a href="/createPage"><img class="write_icon" src="/img/write.png"></a></li>
            <li><a onclick="getChatList()"><img class="chat_icon" src="/img/chat.png"></a></li>
            <li><a onclick="sendJSON4Profile('../customer/check4Profile/<%=session.getAttribute("nickname")%>')"><img class="profile_icon" src=<%= picturePath %>></a></li>
        </ul>
    </div>
</header>
<section class="section_container">
    <div class="main_container">
        <div class="board_container">

            <div class="board_header">
                <ul>
                    <li><a onclick="sendJSON4Profile('../customer/check4Profile/<%=((BoardResponse)(session.getAttribute("board"))).getAuthor()%>')"><img class="profile" src="<%=((BoardResponse)(session.getAttribute("board"))).getAuthorPicturePath()%>"></a></li>
                    <li><a onclick="sendJSON4Profile('../customer/check4Profile/<%=((BoardResponse)(session.getAttribute("board"))).getAuthor()%>')"><%=((BoardResponse)(session.getAttribute("board"))).getAuthor()%></a></li>
                    <li class="more_li"><a href="#"><img class="more" src="/img/more.png"></a></li>
                </ul>
            </div>
            <div class="board_content">
                <div class="board_cont_item1">
                    <canvas class="tmp_canvas" height="451" width="451" id="gocanvas0"></canvas>
                    <p style="margin-top: 0pt; font-style: normal; display:none;" class="legend">Moves: <span id="movecount0">0</span>&nbsp;&nbsp;&nbsp;&nbsp;<span id="warnings"></span></p>

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
                </div>
                <div class="board_cont_item2">
                    <ul class="board_cont_ul">
                        <li onclick="drawMovedBoardKH(0,-gMoveCount[0])"><<<</li>
                        <li onclick="drawMovedBoardKH(0,-5)"> <<</li>
                        <li onclick="drawMovedBoardKH(0,-1)"> <</li>
                        <li onclick="drawMovedBoardKH(0,1)"> > </li>
                        <li onclick="drawMovedBoardKH(0,5)"> >>> </li>
                        <li onclick="drawMovedBoardKH(0,gPiecesKH[0].length-gMoveCount[0])"> >>></li>
                    </ul>
                </div>
            </div>
            <div class="board_footer">
                <ul class="footer_icon">
                    <li><a href="#"><img src="../img/like.png"></a></li>
                    <li><a href="javascript:void(0);" onclick="change_feedback2comment()"><img src="../img/comments.png"></a></li>
                    <li><a href="javascript:void(0);" onclick="change_comment2feedback()"><img src="../img/feedback.png"></a></li>
                </ul>
                <div class="footer_comments">
                    <div class="footer_comments_view">
                        <ul>
                            <%for(int i =0 ; i<((ArrayList<CommentsResponse>)(session.getAttribute("commentsList"))).size(); i++){%>
                                <li><a onclick="sendJSON4Profile('../../customer/check4Profile/<%=session.getAttribute("nickname")%>')"> <%=((ArrayList<CommentsResponse>)(session.getAttribute("commentsList"))).get(i).getAuthor()%></a><a href="#"><%=((ArrayList<CommentsResponse>)(session.getAttribute("commentsList"))).get(i).getContents()%></a></li>
                            <%}%>
                        </ul>
                    </div>
                    <div class="footer_comments_write">
                        <form>
                            <input class="footer_comments_write_text" type="text" placeholder="댓글을 작성하세요">
                            <button class="footer_comments_write_submit" onclick="createComments()">submit</button>
                        </form>
                    </div>
                </div>
                <div class="footer_feedbacks">

                    <div class="footer_feedbacks_view">
                        <ul>
                            <%for(int i =0; i< ((ArrayList<FeedbackResponse>)(session.getAttribute("feedbackList"))).size(); i++){ %>
                            <li><a onclick="sendJSON4Profile('../../customer/check4Profile/<%=session.getAttribute("nickname")%>')"><%=((ArrayList<FeedbackResponse>)(session.getAttribute("feedbackList"))).get(i).getRequestTo()%></a><a href="#"><%=((ArrayList<FeedbackResponse>)(session.getAttribute("feedbackList"))).get(i).getContents()%>></a></li>
                            <%}%>
                        </ul>
                    </div>

                    <div class="footer_feedbacks_write">
                        <form>
                            <input class="footer_feedbacks_write_text" type="text" placeholder="피드백을 작성하세요">
                            <button class="footer_feedbacks_write_submit" onclick="createFeedback()">submit</button>
                        </form>
                    </div>

                </div>
            </div>

        </div>
    </div>
</section>
<script type="text/javascript" src="/js/change_comment2feedback.js"></script>
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

    //for go
    // make session data to js variable
    function getOneGiboData(){

        <% for(int j =0; j<((BoardResponse)(session.getAttribute("board"))).getGibo().size(); j++){ %>
            var player = <%=((BoardResponse)(session.getAttribute("board"))).getGibo().get(j).getPlayer()%>;
            var columnNumber = <%=((BoardResponse)(session.getAttribute("board"))).getGibo().get(j).getCol()%>;
            var rowNumber = <%=((BoardResponse)(session.getAttribute("board"))).getGibo().get(j).getRow()%>;

            goOnKH(0, rowNumber, columnNumber, player);
            gPiecesKH[0] = gPiecesKH_tmp.slice();
            drawBoardKH(0);
            gMoveCount[0] = gPiecesKH[0].length;
        <%}%>
        gPiecesKH_tmp = [];
        gPieces = gPiecesKH.slice(); //for move draw, make duplication
    }

    function initPage(){
        // initGameKHs();
        initGameKH(0,document.getElementById('gocanvas0'),document.getElementById('movecount0'), document.forms.go);
        getOneGiboData();
    }

    window.onload = initPage();

    //for chatting
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
                    location.href="../../chat/showChatListPage";

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

    //for comment create
    function mkData4createComment(){
        data = {
            "author" : "<%=((BoardResponse)(session.getAttribute("board"))).getAuthor()%>",
            "contents" : document.getElementsByClassName("footer_comments_write_text")[0].value,
            "title" : "<%=((BoardResponse)(session.getAttribute("board"))).getTitle()%>"
        };

        console.log(data);
    }

    function sendJSON4createComment(input1, address){
        xhr.open('POST', address);
        xhr.setRequestHeader('Content-Type', 'application/json'); // 컨텐츠타입을 json으로
        xhr.send(JSON.stringify(input1)); // 데이터를 stringify해서 보냄

        xhr.onload = function() {
            if (xhr.status === 200 || xhr.status === 201) {
                console.log("function invoked ");
                if(JSON.parse(xhr.responseText)["result_code"]=="OK"){
                    console.log("sendJSON successed")
                    console.log(JSON.parse(xhr.responseText)["result_code"]);
                    history.go(0);
                    // location.reload();

                }else{
                    console.log(JSON.parse(xhr.responseText)["result_code"]);
                    alert("sendJSON failed...");
                    history.go(0);
                }

            } else {
                console.error(xhr.responseText);
            }
        };
    }

    function createComments(){
        mkTime();
        mkData4createComment();
        header_data = {time:time, data:data};
        sendJSON4createComment(header_data, "/comments/createComments");
    }

    //for feedback create
    function mkData4createFeedback(){
        data = {
            "request_user_nick_name" : "<%=((BoardResponse)(session.getAttribute("board"))).getAuthor()%>",
            "contents" : document.getElementsByClassName("footer_feedbacks_write_text")[0].value,
            "title" : "<%=((BoardResponse)(session.getAttribute("board"))).getTitle()%>"
        };

        console.log(data);
    }

    function sendJSON4createFeedback(input1, address){
        xhr.open('POST', address);
        xhr.setRequestHeader('Content-Type', 'application/json'); // 컨텐츠타입을 json으로
        xhr.send(JSON.stringify(input1)); // 데이터를 stringify해서 보냄

        xhr.onload = function() {
            if (xhr.status === 200 || xhr.status === 201) {
                console.log("function invoked ");
                if(JSON.parse(xhr.responseText)["result_code"]=="OK"){
                    console.log("sendJSON successed")
                    console.log(JSON.parse(xhr.responseText)["result_code"]);
                    history.go(0);
                    // location.reload();

                }else{
                    console.log(JSON.parse(xhr.responseText)["result_code"]);
                    alert("sendJSON failed...");
                    history.go(0);
                }

            } else {
                console.error(xhr.responseText);
            }
        };
    }

    function createFeedback(){
        mkTime();
        mkData4createFeedback();
        header_data = {time:time, data:data};
        sendJSON4createComment(header_data, "/feedback/createFeedback");
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
                    location.href="../../customer/myProfile";
                }else{
                    location.href="../../customer/otherProfile";
                }
                console.log("reloaded");

            } else {
                console.log("sendJSON 4 Profile");
                console.error(xhr.responseText);
            }
        };
    }

</script>
</body>
</html>
