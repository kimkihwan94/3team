<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
		<%@ page import="dd.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.top_color {
	background-color: #e8e8e8;
	width: 100%;
	height: 44px;
}

.body2 {
	position: relative;
	margin: 0 auto;
	bottom: 44px;
	width: 1000px;
}

.menu {
	height: 44px;
	margin: 0px;
	font-size: 15px;
	text-overflow: hidden;
	
}

.left_menu {
	display: inline-block;
	float:left;
	font-size:15px;
	font-weight:700;
	padding-top: 10px;
	cursor: pointer;
}

.right_menu {
	display: inline-block;
	float:right;
	font-size:15px;
	font-weight:700;
	padding-top: 10px;
	cursor: pointer;
}

.left_menu>span {
	padding: 5px
}

.right_menu>span {
	padding: 5px
}

body {
	margin: 0px;
}

.menu_type {
	padding-top: 35px;
	font-size: 30px;
	font-weight: 900;
}

.ingi_category {
	font-size: 20px;
	margin-top: 100px;
	font-weight: 900;
}

.category {
	margin-top:20px;

}
.category>div {
	display: inline-block;
	height: 40px;
	cursor: pointer;
	border: 1px solid gray;
	margin-left: 20px;
	width:150px;
	box-sizing: border-box;
	border-radius:10px;
	font-weight:bold;
	text-align:center;
	line-height:40px; 
}

.category>div:nth-child(5n+1) {
	margin-left:0px;
}
</style>
</head>
<body>
	<div class="top_color"></div>
	<div class="body2">
		<div class="menu">
			<div class="left_menu">
				<span>menu1</span> <span>menu2</span> <span>menu3</span> <span>menu4</span>
			</div>
			<div class="right_menu">
				<span>menu5</span> <span>menu6</span> <span>menu7</span> <span>menu8</span>
			</div>
		</div>

		<div class="menu_type">커뮤니티</div>
		<div class="ingi_category">인기 카테고리</div>
		<div class="category">
			<div>category1</div>
			<div>category2</div>
			<div>category3</div>
			<div>category4</div>
			<div>category5</div>
			<div>category6</div>
		</div>
		
		String guestName = request.getParameter("guestName");
		String password = request.getParameter("password");
		String message = request.getParameter("message");
		<table border="1" cellspacing="0" cellpadding="0" style="width:100%;">
		<%
			while(rs.next()){
				int num = rs.getInt("num");				
				String guestName = rs.getString("guestName");
				String message = rs.getString("message");
		%>
			<tr style="width:100%;margin-bottom:5px;">
				<td>
					메세지 번호 : <%=num%> <br/>
					손님 이름 : <%=guestName %> <br/>
					메세지 : <%=message %> 
					<a href="guest_book_confirm.jsp?num=<%=num%>">[삭제]</a>
				</td>				
			</tr>

		</table>
	</div>
</body>
</html>