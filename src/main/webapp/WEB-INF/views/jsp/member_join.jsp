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
    <link href="../css/header_login.css" rel="stylesheet">
    <link href="../css/member_join.css" rel="stylesheet">
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
                    <li class="horizen">ID<button type="button">ID Check</button></li>
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
                    <button type="button" onclick="operation();">SIGN IN</button>
                    <button type="button" onclick="back();">CANCLE</button>
                </div>
            </form>
        </div>
    </div>
</section>
<script>
    var obj;
    var xhr = new XMLHttpRequest();

    var now = new Date();
    var year = now.getFullYear();
    var month = now.getMonth() + 1;
    var date = now.getDate();
    var hour = now.getHours();
    var minute = now.getMinutes();
    var second = now.getSeconds();
    var time = year +"/"+ month +"/"+ date +" "+ hour +":"+ minute +":"+ second;

    function operation(){
        console.log("operation invodked");
        information();
        sendJSON(obj);
    }

    function back() {
        location.href="login.html";
    }

    function information() {
        console.log("information invoked");
        document.getElementById("info").addEventListener('submit', (e) => {
            e.preventDefault();
            const formData = new FormData(e.target);
            const data = Array.from(formData.entries()).reduce((memo, pair) => ({
                ...memo,
                [pair[0]]: pair[1],
            }), {});
            // obj = 'time:'+ time +'data:'+ JSON.stringify(data);
            obj = {"time":time ,"data":data};
            console.log(obj);
        });
    }

    // <21.06.29> KH start
    function sendJSON(){
        console.log("sendJSON invodked");
        console.log(obj);
        xhr.onload = function() {
            if (xhr.status === 200 || xhr.status === 201) {
                console.log(xhr.responseText);
            } else {
                console.error(xhr.responseText);
            }
        };
        xhr.open('POST', 'customer/create/');
        xhr.setRequestHeader('Content-Type', 'application/json'); // 컨텐츠타입을 json으로
        xhr.send(JSON.stringify(obj)); // 데이터를 stringify해서 보냄
    }


</script>
</body>
</html>
