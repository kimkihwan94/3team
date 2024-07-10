<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<style type="text/css">
	
	table{
		margin : auto;   
	    width : 80%;
	}
	
	</style>
	<title>게시물 작성</title>
</head>
<body>
	<table>
		<tr>
			<td>
				<h4  text-align: right;>카테고리</h4>
			</td>
			<td>
				<select name="카테고리">
				  <option value="ㄲ">카테고리</option>
				  <option value="ㄴㄴ">ㄴㄴ</option>				  
				  <option value="ㄴㄴ">ㄴㄴ</option>
				  <option value="ㄴㄴ">ㄴㄴ</option>	
				  <option value="ㄴㄴ">ㄴㄴ</option>
				  <option value="ㄴㄴ">ㄴㄴ</option>
				  <option value="ㄴㄴ">ㄴㄴ</option>			  
				</select>
			</td>
		</tr>
		<tr>
			<td>
				<h4>제목</h4>
			</td>
			<td>
				<input type="text" name="a" style="width:100%;"required/> 
			</td>
		</tr>
		<tr>
			<td>
				<h4>닉네임</h4>
			</td>
			<td>
				<input type="text" name="b" style="width:100%;"required/> 
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
				<input type="text" name="c" style="width:100%;"required/> 
			</td>
		</tr>
		<tr>
			<td>
				<h4>내용</h4>				
			</td>
			<td>
				<textarea name="d" cols="100" rows="15" style="width:100%;"></textarea>
			</td>
		</tr>
	</table>
	<table>
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
				<form name="이 폼의 이름" action="이 데이터들을 받을 파일" method="post" enctype="multipart/form-data">
					<input type='file' name='e' multiple/>
				</form>
			</td>
		</tr>
		<tr>
			<td>
			</td>
			<td>
				<form name="이 폼의 이름" action="이 데이터들을 받을 파일" method="post" enctype="multipart/form-data">
					<input type='file' name='f' multiple/>
				</form>
			</td>
		</tr>
		<tr>
			<td>
			</td>
			<td>
				<form name="이 폼의 이름" action="이 데이터들을 받을 파일" method="post" enctype="multipart/form-data">
					<input type='file' name='g' multiple/>
				</form>
			</td>
		</tr>
		<tr>
			<td>
			</td>
			<td>
				<form name="이 폼의 이름" action="이 데이터들을 받을 파일" method="post" enctype="multipart/form-data">
					<input type='file' name='h' multiple/>
				</form>
			</td>
		</tr>
		<tr>
			<td>
			</td>
			<td>
				<form name="이 폼의 이름" action="이 데이터들을 받을 파일" method="post" enctype="multipart/form-data">
					<input type='file' name='i' multiple/>
				</form>
			</td>
		</tr>
		<tr>
			<td>
			</td>
			<td>			
				<button  onclick="history.back()">취소</button>	
				<button  onclick="">글쓰기</button>		
			</td>
		</tr>
	</table>
</body>
</html>