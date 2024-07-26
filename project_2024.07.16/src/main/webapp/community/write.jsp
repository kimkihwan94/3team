<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 게시물 작성 </title>
<style type="text/css">


.category {
    text-align: center; /* 내부 요소들을 가운데 정렬 */
}

.category > div {
	width:20%;
    display: inline-block; /* 인라인 블록 요소로 설정 */
    cursor: pointer;
    border: 1px solid gray;
    margin:0 10px;
    box-sizing: border-box;
    border-radius: 10px;
    font-weight: bold;
    line-height: 40px;
    margin-top: 10px;
}

footer>.category > div {
	width:20%;
    display: inline-block; /* 인라인 블록 요소로 설정 */
    cursor: pointer;
    border: 1px solid gray;
    margin:0 10px;
    box-sizing: border-box;
    border-radius: 10px;
    font-weight: bold;
    line-height: 60px;
    margin-top: 10px;
}
td input[type=text],textarea,select {
	outline: none;
	height: 20px;
	font-size: 14px; 
	width:90%;
}
.submit > *{
	width: 60px;
	height: 40px;
	background-color: #ccc;
	color: white;
	border: 0px solid black;
	border-radius:8px;
	cursor: pointer;
}
</style>
</head>
<body>
	<%@ include file="../main/header.jsp" %>
	
	<div style="width: 80%; /*  border: 1px solid black;  */ margin: auto;">
		<h1 style="margin: 30px 0;">인기 카테고리</h1>
			<div class="category">
				<div>고객센터</div>
				<div>메인화면</div>
				<div>구현되지 않은 기능</div>
				<div>뭐로하지</div>
				<div>잠온다</div>
				<div>김동하</div>
				<div>타자</div>
				<div>개빠름</div>
			</div>
	</div>
	<div style="width: 60%; /*border: 1px solid black; */ margin:50px auto;">
		<h1>게시물 작성</h1>
		<form action="writeInput.jsp" method="post" enctype="multipart/form-data" >
			<table style="width: 100%;">
				<tr>
					<td>
						<h4>카테고리*</h4>
					</td>
					<td>
						<select name="category" style="width: auto;">
						  <option value="ㄲ">카테고리</option>
						  <option value="ㄴㄴ">헬스</option>				  
						  <option value="ㄴㄴ">요가</option>
						  <option value="ㄴㄴ">유산소</option>	
						  <option value="ㄴㄴ">맨몸운동</option>
						  <option value="ㄴㄴ">수영</option>
						  <option value="ㄴㄴ">아이디어 고갈</option>			  
						</select>
					</td>
				</tr>
				<tr>
					<td>
						<h4>제목*</h4>
					</td>
					<td>
						<input type="text" name="title"required/> 
					</td>
				</tr>
				<tr>
					<td>
						<h4>닉네임*</h4>
					</td>
					<td>
						<input type="text" name="nickname"required/> 
					</td>
				</tr>
				<tr>
					<td height="10px">
					</td>
					<td height="10px">
						<h6>닉네임 없을 경우 입력해주세요. 이 후 입력하신 닉네임으로 사용됩니다.</h6>
					</td>
				</tr>
				<tr>
					<td>
						<h4>유튜브 링크</h4>
					</td>
					<td>
						<input type="text" name="link"/> 
					</td>
				</tr>
				<tr>
					<td>
						<h4>내용*</h4>				
					</td>
					<td>
						<textarea name="main" cols="100" rows="15" style="min-height:500px; resize: none;"></textarea>
					</td>
				</tr>
		
			<tr>
				<td>
					<h4>첨부파일</h4>
				</td>
				<td>
					<h4>'png', 'gif', 'jpg', 'jpeg' 파일만 업로드가 가능합니다.</h4>
				</td>
			</tr>
			<tr>
				<td>
				</td>
				<td>
					<div style="display:flex; justify-content: space-between;">
						<input type='file' name='file' multiple accept="image/*"/>
					    <div style="margin-right: 10%;" class="submit">
						    <button onclick="history.back()">취소</button>	
						    <input type="submit" value="작성">
					    </div>
					</div>
				</td>
			</tr>
		</table>
		</form>
		<div class="footer">
			<div class="category">
				<div>고객센터</div>
				<div>메인화면</div>
				<div>구현되지 않은 기능</div>
				<div>뭐로하지</div>
				<div>잠온다</div>
				<div>김동하</div>
				<div>타자</div>
				<div>개빠름</div>
			</div>
		</div>
	</div>
	<%@ include file="../main/footer.jsp" %>
</body>
</html>