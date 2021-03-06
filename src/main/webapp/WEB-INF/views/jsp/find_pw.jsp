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
    <link href="/css/find_pw.css" rel="stylesheet">
    <link href="/css/header_login.css" rel="stylesheet">
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
                <img src="/img/badookdol.png"><span class="logo_name">FIND PW</span>
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
                    <button type="button" onclick="mkInfo();">FIND PW</button>
                    <button type="button" onclick="back()">CANCLE</button>
                </div>
            </form>
        </div>
    </div>
</section>
<script>
    function back() {
        location.href="signUp";
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
        location.href="signIn";
    }

    // <21.06.29> KH start
    function sendJSON(input1, address){
        xhr.open('POST', address);
        xhr.setRequestHeader('Content-Type', 'application/json'); // ?????????????????? json??????
        xhr.send(JSON.stringify(input1)); // ???????????? stringify?????? ??????

        xhr.onload = function() {
            console.log("sendJSON invodked4");
            if (xhr.status === 200 || xhr.status === 201) {
                console.log("everything is over");
                // alert("your PW is " + JSON.parse(xhr.responseText)["data"]["password"]);
                location.replace("http://192.168.177.128:8081/customer/findCustomerPasswordResult");
            } else {
                console.error(xhr.responseText);
            }
        };
    }

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
            "front_phone_number": document.getElementById("phone").value
        };
    }

    function mkInfo(){
        mkTime();
        mkData();
        info = {time:time, data:data};
        sendJSON(info, "/customer/findCustomerPassword");
    }

</script>
</body>
</html>
