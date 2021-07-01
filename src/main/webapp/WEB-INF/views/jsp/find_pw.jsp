<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 6/29/21
  Time: 10:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="../../../../resources/static/css/find_pw.css" rel="stylesheet">
    <link href="../../../../resources/static/css/header_login.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
    <title>Find PW</title>
    <style>

    </style>
</head>
<body>
<section class="section_container">
    <div class="main_container">
        <div class="find_pw_container">
            <div class="title">
                <img src="../img/badookdol.png"><span class="logo_name">FIND PW</span>
            </div>
            <form id = "find_pw_form">
                <ul>
                    <li>NAME</li>
                    <li><input id ="name" name = "name" type="text" placeholder="NAME"></li>
                </ul>
                <ul>
                    <li>ID</li>
                    <li><input id ="userid" name = "userid" type="text" placeholder="ID"></li>
                </ul>
                <ul>
                    <li>E-MAIL</li>
                    <li><input id ="email" name = "email" type="email" placeholder="E-MAIL"></li>
                </ul>
                <ul>
                    <li>PHONE</li>
                    <li><input id ="phone" name = "phone" type="number" placeholder="PHONE"></li>
                </ul>

                <div class="find_pw">
                    <button type="submit" onclick="operation();"><a href="find_pw_result.jsp">FIND PW</a></button>
                    <button type="button" onclick="back()">CANCLE</button>
                </div>
            </form>
        </div>
    </div>
</section>
<script>
    function back() {
        location.href="login.jsp";
    }
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
    var info

    function back() {
        location.href="login.jsp";
    }

    // <21.06.29> KH start
    function sendJSON(input1){
        console.log("sendJSON invodked");

        console.log("sendJSON invodked1");
        xhr.open('POST', 'customer');
        console.log("sendJSON invodked2");
        xhr.setRequestHeader('Content-Type', 'application/json'); // 컨텐츠타입을 json으로
        console.log("sendJSON invodked3");
        xhr.send(JSON.stringify(input1)); // 데이터를 stringify해서 보냄

        xhr.onload = function() {
            console.log("sendJSON invodked4");
            if (xhr.status === 200 || xhr.status === 201) {
                console.log("everything is over");
                console.log(xhr.responseText);
            } else {
                console.error(xhr.responseText);
            }
        };
    }

    // <21.06.30> KH modify
    // <21.06.30> KH modify
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
            "name" : document.getElementById("name").value,
            "user_id" : document.getElementById("userid").value,
            "email": document.getElementById("email").value,
            "phone": document.getElementById("phone").value
        };
    }

    function mkInfo(){
        mkTime();
        mkData();
        info = {time:time, data:data, status:300};
        sendJSON(info);
    }

</script>
</body>
</html>
