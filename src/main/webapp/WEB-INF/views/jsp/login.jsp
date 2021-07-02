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
    <link href="/css/login.css" rel="stylesheet">
    <link href="/css/header_login.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
    <title>LogIn</title>
</head>
<body>
<section class="section_container">
    <div class="main_container">
        <div class="login_container">
            <div class="title">
                <img src="/img/badookdol.png"> <span class="logo_name">BALOOK</span>
            </div>
            <form id = "login_form" action="#" method="post">
                <ul>
                    <li><input id="userid" name ="userid" type="text" placeholder="ID" required="required"></li>
                    <li><input id="password" name = "password" type="password" placeholder="PASSWORD" required="required"></li>
                    <li><button class="btn" onclick="mkInfo();" type="button">LogIn</button></li>
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
        location.href="findCustomerId";
    }
    function move_pw() {
        location.href="findCustomerPassword";;
    }
    function move_member_join() {
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
        xhr.setRequestHeader('Content-Type', 'application/json'); // 컨텐츠타입을 json으로
        xhr.send(JSON.stringify(input1)); // 데이터를 stringify해서 보냄

        xhr.onload = function() {
            if (xhr.status === 200 || xhr.status === 201) {
                console.log("function invoked ");
                if(JSON.parse(xhr.responseText)["result_code"]=="OK"){
                    console.log(JSON.parse(xhr.responseText)["result_code"]);
                    location.href="../main";

                }else{
                    console.log(JSON.parse(xhr.responseText)["result_code"]);
                    alert("LogIn failed...");
                    location.reload();
                }

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
            "user_id" : document.getElementById("userid").value,
            "password": document.getElementById("password").value
        };
    }

    function mkInfo(){
        mkTime();
        mkData();
        info = {time:time, data:data};
        sendJSON(info,"/customer/signIn");
    }

</script>
</body>
</html>
