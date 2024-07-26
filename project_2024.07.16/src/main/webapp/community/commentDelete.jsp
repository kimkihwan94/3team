<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <style>
        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            width:100vw;
            height:100vh;
        }

        .box {
            border: 3px solid black;
            width: 400px;
            height: 250px;
            margin-top:-125px;
            margin-left:-30px;
            text-align:center;
        }
        
        .textbox {
        margin-top:30px;
        font-size:20px;
        font-weight:bold;
        }
        
        .password {
       margin-top:50px; 
       }
    </style>
    <title>Document</title>
</head>
<body>
    <div class="container">
        <div class="box">
        <div class="textbox">
        댓글을 삭제하시겠습니까?
        </div>
        <div class="password">비밀번호<input type="password"></input></div>

        </div>
    </div>
</body>
</html>