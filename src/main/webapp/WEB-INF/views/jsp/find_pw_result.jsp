<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 6/29/21
  Time: 10:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="/css/find_pw_result.css" rel="stylesheet">
    <link href="/css/header_login.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
    <title>Find PW Result</title>
    <style>

    </style>
</head>
<body>
<section class="section_container">
    <div class="main_container">
        <div class="find_pw_result_container">
            <div class="title">
                <img src="/img/badookdol.png"><span class="logo_name">BALOOK</span>
            </div>
            <form>
                <ul>
                    <li>회원님의 비밀번호는</li>
                    <li><output><%=session.getAttribute("password")%></output></li>
                    <li class="right">입니다.</li>
                </ul>
            </form>
            <div class="go_back">
                <button type="button" onclick="move()">LogIn</button>
            </div>
        </div>
    </div>
</section>
<script>
    function move() {
        location.href="signIn";
    }
</script>
</body>
</html>
