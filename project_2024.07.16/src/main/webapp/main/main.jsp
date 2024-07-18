<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 메인 페이지 </title>
</head>
<body>
<style>
	.mainImg {
	    display: flex;
	    justify-content: space-between;
	    margin: 20px auto;
	}
	
	.mainImg img {
	    width: 33%;
	    height: auto;
	    object-fit: cover;
	    /* border: 1px solid #ddd; */
	    min-width: 400px;
	}
</style>
	<header>
		<br/>
		<%@ include file="../main/header.jsp" %>
	</header>
	<div>
		<div class="mainImg" >
			<img src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fimg.freepik.com%2Ffree-vector%2Fhand-drawn-korean-street-food-element-collection_23-2149672328.jpg&type=sc960_832" width="33%" height="60%" title="동하몸들어감";>
			<img src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fimg.freepik.com%2Ffree-vector%2Ftasty-food-dishes-collection_23-2148045232.jpg&type=sc960_832" width="33%" height="60%" title="동하몸들어감";>
			<img src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fimg.freepik.com%2Ffree-vector%2Fhand-drawn-food-background_23-2148064817.jpg&type=sc960_832" width="33%" height="60%" title="동하몸들어감";>
		</div>
	</div>
	<div style="text-align: center;">
		<div style="display: inline-block;">
			<div>
				<h1>인기 게시물</h1>
					<div style="border: 1px solid black; width: 800px; height: 300px; ">
						<br>
						<br>
						<a href="../community/write.jsp"
						style="font-size: 30px; text-decoration-line: none; color: gray;">
						게시물 작성</a>
					</div>
				<br><br>
			</div>
			
			<div>
				<h1>카테고리</h1>
					<div style="border: 1px solid black; width: 800px; height: 300px; "></div>
				<br><br>
			</div>
			
			<div>
				<h1>커뮤니티</h1>
					<div style="border: 1px solid black; width: 800px; height: 300px; "></div>
				<br><br> 
			</div>
			
			<div>
				<h1>만든 사람들</h1>
					<div style="border: 1px solid black; width: 800px; height: 300px; "></div>
				<br><br>
			</div>
		</div>
	</div>
	
	<footer>
		<br/>
		<%@ include file="../main/footer.jsp" %>
	</footer>
</body>
</html>