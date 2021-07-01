<%--
  Created by IntelliJ IDEA.
  User: balook
  Date: 6/29/21
  Time: 12:03 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<%--    <link href="../css/header_login.css" rel="stylesheet">--%>
<%--    <link href="../css/member_join.css" rel="stylesheet">--%>
    <!-- <21.07.01> KH modified -->
    <link rel="stylesheet" href="/css/member_join.css">
    <link rel="stylesheet" href="/css/header_login.css">

    <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
    <title>Member Join</title>
    <style>
    </style>
</head>
<body>

<section class="section_container">
    <div class="main_container">
        <div class="join_container">
            <div class="title">
                <img src="../img/badookdol.png"> <span class="logo_name">BALOOK</span>
            </div>
            <form id ="info" name="join" method="post">
                <ul>
                    <li class="horizen">ID<button type="button" onclick="checkDuplicationId()">ID Check</button></li>
                    <li><input id ="id" name = "userId" type="text" placeholder="ID" required="required"></li>
                    <li>PASSWORD</li>
                    <li><input id ="pw" name = "password" type="password" placeholder="PASSWORD" required="required"></li>
                    <li>PASSWORD CHECK</li>
                    <li><input id ="pwcheck" type="passwordCheck" placeholder="PASSWORD" required="required"></li>
                    <li>NAME</li>
                    <li><input id ="name" name = "name" type="text" placeholder="NAME" required="required"></li>
                    <li>NICKNAME</li>
                    <li><input id ="nickname" name = "nickname" type="text" placeholder="NICKNAME" required="required"></li>
                    <li>E-MAIL</li>
                    <li><input id ="email" name = "email" type="email" placeholder="E-MAIL" required="required"></li>
                    <li>PHONE</li>
                    <li><input id ="phone" name = "frontPhoneNumber" type="number" placeholder="PHONE (숫자로만 입력해주세요.)" required="required" size="11"></li>
                </ul>
                <div class="joinus">
                    <button type="button" onclick="signUp();">SIGN IN</button>
                    <button type="button" onclick="back();">CANCLE</button>
                </div>
            </form>
        </div>
    </div>
</section>
<script>
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
        location.href="login.html";
    }

    // <21.06.29> KH start
    function sendJSON(input1, address){
        xhr.open('POST', address);
        xhr.setRequestHeader('Content-Type', 'application/json'); // 컨텐츠타입을 json으로
        xhr.send(JSON.stringify(input1)); // 데이터를 stringify해서 보냄

        xhr.onload = function() {
            if (xhr.status === 200 || xhr.status === 201) {
                location.href("main.jsp");
            } else {
                console.error(xhr.responseText);
            }
        };
    }

    //<21.07.01> KH start
    function sendJSON4duplicationCheck(input1, address){
        xhr.open('POST', address);
        xhr.setRequestHeader('Content-Type', 'application/json'); // 컨텐츠타입을 json으로
        xhr.send(JSON.stringify(input1)); // 데이터를 stringify해서 보냄

        xhr.onload = function() {
            if (xhr.status === 200 || xhr.status === 201) {
                if(JSON.parse(xhr.response)["result_code"]=="ERROR"){
                    alert("user id is already exist!!!");
                }else{
                    alert("you can use that id");
                }
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
            "user_id" : document.getElementById("id").value,
            "password": document.getElementById("pw").value ,
            "password_check": document.getElementById("pwcheck").value,
            "email":document.getElementById("email").value,
            "nickname":document.getElementById("nickname").value,
            "name":document.getElementById("name").value,
            "front_phone_number":document.getElementById("phone").value
        };
    }

    function mkData4checkDuplication(){
        data = {
            "user_id": document.getElementById("id").value
        }
    }

    function signUp(){
        mkTime();
        mkData();
        info = {time:time, data:data};
        sendJSON(info, "/customer/create");
    }

    function checkDuplicationId(){
        mkTime();
        mkData4checkDuplication();
        info = {time:time, data:data};
        sendJSON4duplicationCheck(info, "/customer/checkDuplication");
    }


</script>
</body>
</html>
