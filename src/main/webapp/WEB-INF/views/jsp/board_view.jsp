<%@ page import="com.example.demo.model.network.response.BoardResponse" %><%--
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
<header class="header_container">
    <div class="logo">
        <ul>
            <li><a href="main.jsp"><img class="logo" src="/img/logo.png"></a></li>
            <li><a href="main.jsp">balook</a></li>
        </ul>
    </div>
    <div class="menu">
        <ul>
            <li><a href="search_result.jsp"><img class="search_icon" src="/img/search.png"></a></li>
            <li><a href="board_write.jsp"><img class="write_icon" src="/img/write.png"></a></li>
            <li><a href="chating.jsp"><img class="chat_icon" src="/img/chat.png"></a></li>
            <li><a href="my_profile.jsp"><img class="profile_icon" src="/img/profile.png"></a></li>
        </ul>
    </div>
</header>
<section class="section_container">
    <div class="main_container">
        <div class="board_container">

            <div class="board_header">
                <ul>
                    <li><a onclick="sendJSON4Profile('/customer/check4Profile/<%=((BoardResponse)(session.getAttribute("board"))).getAuthor()%>')"><img class="profile" src="<%=((BoardResponse)(session.getAttribute("board"))).getAuthorPicturePath()%>"></a></li>
                    <li><a onclick="sendJSON4Profile('/customer/check4Profile/<%=((BoardResponse)(session.getAttribute("board"))).getAuthor()%>')"><%=((BoardResponse)(session.getAttribute("board"))).getAuthor()%></a></li>
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
                            <li><a href="#">vue_ys</a><a href="#">ㄹㅇ 실화냐? 이게 된다고?</a></li>
                            <li><a href="#">vue_ys</a><a href="#">#고스트 바둑왕</a></li>
                        </ul>
                    </div>
                    <div class="footer_comments_write">
                        <form>
                            <input class="footer_comments_write_text" type="text" placeholder="댓글을 작성하세요">
                            <input class="footer_comments_write_submit" type="submit">
                        </form>
                    </div>
                </div>
                <div class="footer_feedbacks">

                    <div class="footer_feedbacks_view">
                        <ul>
                            <li><a href="#">kangh.h</a><a href="#">테스트 피드백</a></li>
                            <li><a href="#">kangh.h</a><a href="#">#고스트 바둑광</a></li>
                            <li><a href="#">kangh.h</a><a href="#">#고스트</a></li>
                            <li><a href="#">kangh.h</a><a href="#">#바둑광</a></li>
                            <li><a href="#">kangh.h</a><a href="#">테스트 피드백 입니다</a></li>
                        </ul>
                    </div>

                    <div class="footer_feedbacks_write">
                        <form>
                            <input class="footer_feedbacks_write_text" type="text" placeholder="피드백을 작성하세요">
                            <input class="footer_feedbacks_write_submit" type="submit">
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
</script>
</body>
</html>
