<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	/*
	String id = request.getParameter("jid");
	String name = request.getParameter("jname");
	String nickname = request.getParameter("jnickname");
	String pw = request.getParameter("jpw");
	String cpw = request.getParameter("jcpw");
	String isJoin = request.getParameter("isJoin");
	
	if (id == null) id = "";
    if (name == null) name = "";
    if (nickname == null) nickname = "";
    if (pw == null) pw = "";
    if (cpw == null) cpw = "";
    */
    // 20240709 - sam
    String cid = (String)session.getAttribute("jcid");
	String id = (String)session.getAttribute("jid");
	String name = (String)session.getAttribute("jname");
	String nickname = (String)session.getAttribute("jnickname");
	String pw = (String)session.getAttribute("jpw");
	String cpw = (String)session.getAttribute("jcpw");
	String isJoin = (String)session.getAttribute("isJoin");
    // out.println(isJoin);
	
	session.removeAttribute("jid");
	session.removeAttribute("jname");
	session.removeAttribute("jnickname");
	session.removeAttribute("jpw");
	session.removeAttribute("jcpw");
	session.removeAttribute("isJoin");
	
	if (id == null) id = "";
    if (name == null) name = "";
    if (nickname == null) nickname = "";
    if (pw == null) pw = "";
    if (cpw == null) cpw = "";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<style>
	.join {
		display: inline-block;
		text-align: left;
		border: 1px solid #ccc;
		padding: 20px;
	}
	.join>form>input{
		width: 400px;
		height: 40px;
		box-sizing: border-box;
		border : 1px solid gray;
		outline: none;
		padding:0px 15px;
		margin: 5px 20px;
		font-size: 16px;
		
	}
	.join>form>span{
		font-size: 16px;
		margin: 0px 20px;
	}
	.id input[type="text"] {
		width: 300px;
		height: 40px;
		box-sizing: border-box;
		border : 1px solid gray;
		outline: none;
		padding:0px 15px;
		margin: 5px 20px;
		font-size: 16px;
	}
	.id button {
		width: 70px;
		height: 40px;
		box-sizing: border-box;
		border : 1px solid gray;
		outline: none;
		padding:0px 5px;
		font-size: 14px;
	}
	
</style>
<body>
<%@ include file="../main/header.jsp" %>
	<div style="text-align: center;">
		<h1 >회원가입</h1>
		<div class="join">
			<form name="myForm" action="joinCheck.jsp" method="post" id="myForm">
				<span>아이디는 8자 이상의 영어와 숫자만 사용해주세요</span>
				<div class="id">
					<input type="text" placeholder="아이디" name="jid" tabindex="1"  autofocus="autofocus" autocomplete="off" value="<%=id%>" required>
					<button type="button" onclick="idCheck();">중복확인</button><br/>
				</div>
				<span>이름은 2~4글자로 작성해주세요. <br/></span>
				<input type="text" placeholder="이름" name="jname" tabindex="2" autocomplete="off" value="<%=name%>" required> <br/>
				<span>닉네임은 3~5자의 한글만 사용해주세요<br/></span>
				<input type="text" placeholder="닉네임" name="jnickname" tabindex="3" autocomplete="off" value="<%=nickname%>" required><br/>
				<span>비밀번호는 8자 이상의 영어와 숫자만 사용해주세요<br/></span>
				<input type="password" placeholder="비밀번호" name="jpw" tabindex="4" autocomplete="off" value="<%=pw%>" required><br/>
				<span>비밀번호를 확인해 주세요<br/></span>
				<input type="password" placeholder="비밀번호 확인" name="jcpw" tabindex="5" autocomplete="off" value="<%=cpw%>" required><br/>
				<br/>
				<input type="submit" value="회원가입">
				<input type="hidden" name="isJoin" value="<%=isJoin%>">
				<input type="hidden" name="cid" value="<%=cid%>">
			</form>
		</div>
	</div>
	<br><br>
	<%@ include file="../main/footer.jsp" %>
</body>
	<script>
		function idCheck(){
			document.myForm.action = "idcheck.jsp";
			document.myForm.submit();
		}
	</script>
</html>