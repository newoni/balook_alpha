<%--
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
</head>
<body>
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
      <li><a href="other_profile.jsp"><img class="profile_icon" src="/img/profile.png"></a></li>
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
              <%=session.getAttribute("authorNickName").toString()%>>
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
        <div class="my_boards_img_card"><a href="board_view.jsp"><img src="/img/Ed_-y4RVAAEBBCp.jpg"></a></div>
        <div class="my_boards_img_card"><a href="board_view.jsp"><img src="/img/J2oWs_zZ_400x400.jpg"></a></div>
        <div class="my_boards_img_card"><a href="board_view.jsp"><img src="/img/puppy-1189067_1280.jpg"></a></div>
        <div class="my_boards_img_card"><a href="board_view.jsp"><img src="/img/unnamed (1).jpg"></a></div>
        <div class="my_boards_img_card"><a href="board_view.jsp"><img src="/img/unnamed.jpg"></a></div>
        <div class="my_boards_img_card"><a href="board_view.jsp"><img src="/img/WO4SKPUA62ESBOT2QY7QB5XTAI.jpg">   </a></div>
        <div class="my_boards_img_card"><a href="board_view.jsp"><img src="/img/다운로드.jpg">   </a></div>
      </div>
    </div>
  </div>
</section>
</body>
</html>
