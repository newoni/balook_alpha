<%--
  Created by IntelliJ IDEA.
  User: balook
  Date: 6/29/21
  Time: 12:48 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="../css/login.css" rel="stylesheet">
    <link href="../css/header_login.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
    <title>LogIn</title>
</head>
<body>
<section class="section_container">
    <div class="main_container">
        <div class="login_container">
            <div class="title">
                <img src="../img/badookdol.png"> <span class="logo_name">BALOOK</span>
            </div>
            <form action="#" method="post">
                <ul>
                    <li><input id="id" type="text" placeholder="ID"></li>
                    <li><input id="pw" type="password" placeholder="PASSWORD"></li>
                    <li><button class="btn" type="button">LogIn</button></li>
                </ul>
            </form>
            <div class="otherlogin">
                <button type="button">Login with Naver</button>
            </div>
            <div class="find">
                <button type="button" onclick="move_id();">Find ID</button>
                <button type="button" onclick="move_pw();">Find PW</button>
                <button type="button" onclick="move_member_join();">Join Us</button>
            </div>
        </div>
    </div>
</section>
<script>
    function move_id() {
        location.href="find_id.html";
    }
    function move_pw() {
        location.href="find_pw.html";
    }
    function move_member_join() {
        location.href="member_join.html";
    }
</script>
</body>
</html>
